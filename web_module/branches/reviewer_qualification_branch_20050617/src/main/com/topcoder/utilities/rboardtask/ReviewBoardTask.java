/*
 * ReviewBoardTask.java
 *
 * Copyright (c) 2005 TopCoder, Inc.  All rights reserved.
 * Created on June 17, 2005, 4:59 PM
 */

package com.topcoder.utilities.rboardtask;

import com.topcoder.db.connectionfactory.ConfigurationException;
import com.topcoder.db.connectionfactory.DBConnectionException;
import com.topcoder.db.connectionfactory.DBConnectionFactory;
import com.topcoder.db.connectionfactory.DBConnectionFactoryImpl;
import com.topcoder.db.connectionfactory.UnknownConnectionException;
import com.topcoder.message.email.EmailEngine;
import com.topcoder.message.email.TCSEmailMessage;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.config.ConfigManager;
import com.topcoder.util.config.ConfigManagerException;
import com.topcoder.util.config.UnknownNamespaceException;
import com.topcoder.util.file.DocumentGenerator;
import com.topcoder.util.file.InvalidConfigException;
import com.topcoder.util.file.Template;
import com.topcoder.util.file.TemplateDataFormatException;
import com.topcoder.util.file.TemplateFormatException;
import com.topcoder.util.file.fieldconfig.Field;
import com.topcoder.util.file.fieldconfig.Node;
import com.topcoder.util.file.fieldconfig.TemplateFields;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author ivern
 */
public class ReviewBoardTask {
    /** Namespace to use for the class' configuration. */
    private static final String RBOARD_TASK_NAMESPACE = "com.topcoder.utilities.rboardtask.ReviewBoardTask";
    
    /** Namespace to use for the DB Connection Factory configuration. */
    private final static String DB_CONNECTION_FACTORY_NAMESPACE = "com.topcoder.db.connectionfactory.DBConnectionFactoryImpl";
    
    /** Namespace to use for the Document Generator configuration. */
    private static final String DOCUMENT_GENERATOR_NAMESPACE = "com.topcoder.util.file.DocumentGenerator";
    
    /** Head of the slacker query. */
    private static final String QUERY_HEAD =
            "SELECT ru.phase_id                                                        " +
            "     , ph.description                                                     " +
            "     , u.handle                                                           " +
            "     , u.user_id                                                          " +
            "     , e.address                                                          " +
            "  FROM rboard_user ru                                                     " +
            "     , user u                                                             " +
            "     , phase ph                                                           " +
            "     , common_oltp:email e                                                " +
            " WHERE ru.user_id NOT IN (SELECT user_id                                  " +
            "                            FROM project_result pr                        " +
            "                               , phase_instance pi                        " +
            "                               , project p                                " +
            "                           WHERE pr.final_score >= ?                      " +
            "                             AND pr.project_id = pi.project_id            " +
            "                             AND pi.phase_id = 1                          " +
            "                             AND pi.cur_version = 1                       " +
            "                             AND pi.start_date >= CURRENT - ? UNITS MONTH " +
            "                             AND pi.project_id = p.project_id             " +
            "                             AND p.cur_version = 1                        " +
            "                             AND ru.phase_id = p.project_type_id + 111)   " +
            "   AND ru.user_id = u.user_id                                             " +
            "   AND ru.user_id = e.user_id                                             " +
            "   AND e.primary_ind = 1                                                  " +
            "   AND e.status_id = 1                                                    " +
            "   AND e.email_type_id = 1                                                " +
            "   AND ru.phase_id = ph.phase_id                                          ";
    
    // All the center of the query should do is check for a specific ru.status_id
    
    /** Tail end of the slacker query. */
    private static final String QUERY_TAIL =
            "GROUP BY 1, 2, 3, 4, 5                                                    ";
    
    /** Query to deactivate a specified reviewer. */
    private static final String DEACTIVATE_REVIEWER =
            "UPDATE rboard_user SET status_id = ? WHERE user_id = ? AND phase_id = ?";
    
    /** Cached static logger instance. */
    private static Logger log = Logger.getLogger(ReviewBoardTask.class);
    
    /** Cached DB Connection Factory instance. */
    private DBConnectionFactory dbConnectionFactory = null;

    /** Cached Email Engine instance. */
    private EmailEngine emailEngine = null;
    
    /** Number of months since the last qualifying submission before a reviewer is temporarily suspended from the review board. */
    private int temporaryDeactivationThreshold;
    
    /** Number of months since the last qualifying submission before a reviewer is permanently suspended from the review board. */
    private int permanentDeactivationThreshold;
    
    /** Minimum score required for a submission to qualify. */
    private double minimumQualifyingScore;

    /** */
    private String emailFromAddress = null;
    
    /** */
    private String emailFromName = null;
    
    /** */
    private String emailSubject = null;
    
    /** */
    private Template temporaryDeactivationEmailTemplate = null;
    
    /** */
    private Template permanentDeactivationEmailTemplate = null;
    
    /**
     * Default constructor.
     */
    public ReviewBoardTask() {
        ConfigManager config = ConfigManager.getInstance();
        
        // Read the configuration values, or use a default if they are missing.
        temporaryDeactivationThreshold = getIntProperty(config, "temporary_deactivation_threshold", 3);
        permanentDeactivationThreshold = getIntProperty(config, "permanent_deactivation_threshold", 6);
        minimumQualifyingScore = getDoubleProperty(config, "minimum_qualifying_score", 80.0);
        emailFromAddress = getStringProperty(config, "email_from_address", "service@topcodersoftware.com");
        emailFromName = getStringProperty(config, "email_from_name", "TopCoder Software Service");
        emailSubject = getStringProperty(config, "email_subject", "TCS Review Board Deactivation Notice");

        // Read the email templates, fail if there's an error.
        try {
            DocumentGenerator dg = DocumentGenerator.getInstance();
            temporaryDeactivationEmailTemplate =
                    dg.getTemplate(config.getString(DOCUMENT_GENERATOR_NAMESPACE, "temporary_deactivation_template"));
            permanentDeactivationEmailTemplate =
                    dg.parseTemplate(config.getString(DOCUMENT_GENERATOR_NAMESPACE, "permanent_deactivation_template"));
        } catch (Exception e) {
            log.fatal("Error parsing email templates.", e);
            throw new RuntimeException(e);
        }
        
        try {
            dbConnectionFactory = new DBConnectionFactoryImpl(DB_CONNECTION_FACTORY_NAMESPACE);
        } catch (ConfigurationException ce) {
            log.fatal("Error creating the DB Connection Factory.", ce);
            throw new RuntimeException(ce);
        } catch (UnknownConnectionException uce) {
            log.fatal("Error creating the DB Connection Factory.", uce);
            throw new RuntimeException(uce);
        }
        
        emailEngine = new EmailEngine();
    }
    
    /**
     */
    public void deactivateSlackers() {
        log.info("ReviewBoardTask.deactivateSlackers() starting.");
        
        Connection connection = null;
        
        try {
            connection = dbConnectionFactory.createConnection();
        } catch (DBConnectionException dbce) {
            log.fatal("Error creating a connection to the database", dbce);
            throw new RuntimeException(dbce);
        }
        
        performTemporaryDeactivations(connection);
        performPermanentDeactivations(connection);
        
        close(connection);
        
        log.info("ReviewBoardTask.deactivateSlackers() completed.");
    }
    
    /**
     *
     * @param connection The <code>Connection</code> to use.
     */
    private void performTemporaryDeactivations(Connection connection) {
        StringBuffer queryString = new StringBuffer();
        queryString.append(QUERY_HEAD);
        queryString.append(" AND ru.status_id = 100 ");
        queryString.append(QUERY_TAIL);
        
        PreparedStatement slackerQuery = null;
        PreparedStatement deactivate = null;
        ResultSet slackers = null;
        
        try {
            slackerQuery = connection.prepareStatement(queryString.toString());
            deactivate = connection.prepareStatement(DEACTIVATE_REVIEWER);
            
            slackerQuery.setDouble(1, minimumQualifyingScore);
            slackerQuery.setInt(2, temporaryDeactivationThreshold);
            
            slackers = slackerQuery.executeQuery();
            
            deactivate.setLong(1, 110);
            
            while (slackers.next()) {
                int phaseId = slackers.getInt("phase_id");
                String phaseName = slackers.getString("description");
                String handle = slackers.getString("handle");
                long userId = slackers.getLong("user_id");
                String address = slackers.getString("address");
                
                log.info("Temporarily deactivating reviewer " + handle + "(" + userId + ") for the " + phaseName + " phase.");
                
                deactivate.setLong(2, userId);
                deactivate.setLong(3, phaseId);
                
                deactivate.executeUpdate();
                
                sendEmail(permanentDeactivationEmailTemplate, handle, address, phaseName);
            }
        } catch (SQLException e) {
            log.error("Error found while temporarily deactivating reviewers.", e);
            e.printStackTrace();
        } finally {
            close(slackers);
            close(slackerQuery);
            close(deactivate);
        }
    }
    
    /**
     *
     * @param connection The <code>Connection</code> to use.
     */
    private void performPermanentDeactivations(Connection connection) {
        StringBuffer queryString = new StringBuffer();
        queryString.append(QUERY_HEAD);
        queryString.append(" AND ru.status_id IN (100, 110) ");
        queryString.append(QUERY_TAIL);
        
        PreparedStatement slackerQuery = null;
        PreparedStatement deactivate = null;
        ResultSet slackers = null;
        
        try {
            slackerQuery = connection.prepareStatement(queryString.toString());
            deactivate = connection.prepareStatement(DEACTIVATE_REVIEWER);
            
            slackerQuery.setDouble(1, minimumQualifyingScore);
            slackerQuery.setInt(2, permanentDeactivationThreshold);
            
            slackers = slackerQuery.executeQuery();
            
            deactivate.setLong(1, 120);
            
            while (slackers.next()) {
                int phaseId = slackers.getInt("phase_id");
                String phaseName = slackers.getString("description");
                String handle = slackers.getString("handle");
                long userId = slackers.getLong("user_id");
                String address = slackers.getString("address");
                
                log.info("Permanently deactivating reviewer " + handle + "(" + userId + ") for the " + phaseName + " phase.");
                
                deactivate.setLong(2, userId);
                deactivate.setLong(3, phaseId);
                
                deactivate.executeUpdate();
                
                sendEmail(permanentDeactivationEmailTemplate, handle, address, phaseName);
            }
        } catch (SQLException e) {
            log.error("Error found while permanently deactivating reviewers.", e);
            e.printStackTrace();
        } finally {
            close(slackers);
            close(slackerQuery);
            close(deactivate);
        }
    }
    
    /**
     * 
     * @param template 
     * @param handle 
     * @param address 
     * @param phaseName 
     */
    private void sendEmail(Template template, String handle, String address, String phaseName) {
        try {
            TCSEmailMessage tem = new TCSEmailMessage();
            
            tem.setFromAddress(emailFromAddress, emailFromName);
            tem.addToAddress(address, TCSEmailMessage.TO);
            tem.setSubject(emailSubject);
            tem.setBody(generateEmailBody(template, handle, phaseName));
            
            emailEngine.send(tem);
        } catch (Exception e) {
            log.error("Error sending email to " + handle + " (" + address + ").", e);
            e.printStackTrace();
        }
    }

    /**
     * 
     * @param template 
     * @param handle 
     * @param phaseName 
     * @throws com.topcoder.util.config.ConfigManagerException 
     * @throws com.topcoder.util.file.InvalidConfigException 
     * @throws com.topcoder.util.file.TemplateDataFormatException 
     * @throws com.topcoder.util.file.TemplateFormatException 
     * @return 
     */
    private String generateEmailBody(Template template, String handle, String phaseName)
            throws ConfigManagerException, InvalidConfigException, TemplateDataFormatException, TemplateFormatException {
        
        DocumentGenerator dg = DocumentGenerator.getInstance();

        TemplateFields root = dg.getFields(template);
        Node[] nodes = root.getNodes();
        for (int i = 0; i < nodes.length; ++i) {
            if (nodes[i] instanceof Field) {
                Field f = (Field) nodes[i];
                if (f.getName().equals("HANDLE")) {
                    f.setValue(handle);
                } else if (f.getName().equals("PHASE_NAME")) {
                    f.setValue(phaseName);
                }
            }
        }
        
        return dg.applyTemplate(root);
    }
    
    /**
     *
     * @param args
     */
    private static void main(String[] args) {
        try {
            ReviewBoardTask rbt = new ReviewBoardTask();
            rbt.deactivateSlackers();
        } catch (Exception e) {
            log.fatal("Error encountered.", e);
            e.printStackTrace();
            System.exit(1);
        }
        
        System.exit(0);
    }
    
    /**
     *
     * @param config
     * @param key
     * @param defaultValue
     * @return
     */
    protected int getIntProperty(ConfigManager config, String key, int defaultValue) {
        try {
            Object property = config.getProperty(RBOARD_TASK_NAMESPACE, key);
            if (property != null) {
                return Integer.parseInt((String) property);
            } else {
                log.warn("Property " + key + " not found in the configuration, using default value (" + defaultValue + ").");
                return defaultValue;
            }
        } catch (UnknownNamespaceException une) {
            log.fatal("Could not load configuration namespace: " + RBOARD_TASK_NAMESPACE, une);
            throw new RuntimeException(une);
        }
    }
    
    /**
     *
     * @param config
     * @param key
     * @param defaultValue
     * @return
     */
    protected double getDoubleProperty(ConfigManager config, String key, double defaultValue) {
        try {
            Object property = config.getProperty(RBOARD_TASK_NAMESPACE, key);
            if (property != null) {
                return Double.parseDouble((String) property);
            } else {
                log.warn("Property " + key + " not found in the configuration, using default value (" + defaultValue + ").");
                return defaultValue;
            }
        } catch (UnknownNamespaceException une) {
            log.fatal("Could not load configuration namespace: " + RBOARD_TASK_NAMESPACE, une);
            throw new RuntimeException(une);
        }
    }
    
    /**
     *
     * @param config
     * @param key
     * @param defaultValue
     * @return
     */
    protected String getStringProperty(ConfigManager config, String key, String defaultValue) {
        try {
            Object property = config.getProperty(RBOARD_TASK_NAMESPACE, key);
            if (property != null) {
                return (String) property;
            } else {
                log.warn("Property " + key + " not found in the configuration, using default value (" + defaultValue + ").");
                return defaultValue;
            }
        } catch (UnknownNamespaceException une) {
            log.fatal("Could not load configuration namespace: " + RBOARD_TASK_NAMESPACE, une);
            throw new RuntimeException(une);
        }
    }
    
    /**
     * Convenience method for closing <code>ResultSet</code> objects since we need to close
     * them all over the place.
     *
     * @param rs The <code>ResultSet</code> object to close.
     */
    protected void close(ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
                rs = null;
            }
        } catch (SQLException sqle) {
            log.error("Error closing ResultSet.");
            sqle.printStackTrace();
        }
    }
    
    /**
     * Convenience method for closing <code>Statement</code> and <code>PreparedStatement</code>
     * objects since we need to close them all over the place.
     *
     * @param stmt The <code>Statement</code> object to close.
     */
    protected void close(Statement stmt) {
        try {
            if (stmt != null) {
                stmt.close();
                stmt = null;
            }
        } catch (SQLException sqle) {
            log.error("Error closing Statement.");
            sqle.printStackTrace();
        }
    }
    
    /**
     * Convenience method for closing <code>Connection</code> objects since we need to close
     * them all over the place.
     *
     * @param conn The <code>Connection</code> object to close.
     */
    protected void close(Connection conn) {
        try {
            if (conn != null) {
                conn.close();
                conn = null;
            }
        } catch (SQLException sqle) {
            log.error("Error closing Connection.");
            sqle.printStackTrace();
        }
    }
}
