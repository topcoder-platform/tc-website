/*
 * ReviewBoardTask.java
 *
 * Created on June 17, 2005, 4:59 PM
 *
 * To change this template, choose Tools | Options and locate the template under
 * the Source Creation and Management node. Right-click the template and choose
 * Open. You can then make changes to the template in the Source Editor.
 */

package com.topcoder.utilities.rboardtask;

import com.topcoder.db.connectionfactory.ConfigurationException;
import com.topcoder.db.connectionfactory.DBConnectionException;
import com.topcoder.db.connectionfactory.DBConnectionFactory;
import com.topcoder.db.connectionfactory.DBConnectionFactoryImpl;
import com.topcoder.db.connectionfactory.UnknownConnectionException;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.config.ConfigManager;
import com.topcoder.util.config.UnknownNamespaceException;

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
    /** */
    private final static String DB_CONNECTION_FACTORY_NAMESPACE = "com.topcoder.db.connectionfactory.DBConnectionFactoryImpl";
    
    /** */
    private static final String RBOARD_TASK_NAMESPACE = "com.topcoder.utilities.rboardtask.ReviewBoardTask";
    
    /** */
    private static final String QUERY_HEAD =
            "SELECT ph.description                                                     " +
            "     , u.handle                                                           " +
            "     , u.user_id                                                          " +
            "  FROM rboard_user ru                                                     " +
            "     , user u                                                             " +
            "     , phase ph                                                           " +
            " WHERE ru.user_id NOT IN (SELECT user_id                                  " +
            "                            FROM project_result pr                        " +
            "                               , phase_instance pi                        " +
            "                               , project p                                " +
            "                           WHERE pr.final_score >= 80.0                   " +
            "                             AND pr.project_id = pi.project_id            " +
            "                             AND pi.phase_id = 1                          " +
            "                             AND pi.cur_version = 1                       " +
            "                             AND pi.start_date >= CURRENT - ? UNITS MONTH " +
            "                             AND pi.project_id = p.project_id             " +
            "                             AND p.cur_version = 1                        " +
            "                             AND ru.phase_id = p.project_type_id + 111)   " +
            "                             AND ru.user_id = u.user_id                   " +
            "                             AND ru.phase_id = ph.phase_id                ";

    /** */
    private static final String QUERY_TAIL =
            "GROUP BY 1, 2, 3                                                          " +
            "ORDER BY 1, 2                                                             ";
    
    /** */
    private static final String DEACTIVATE_REVIEWER =
            "UPDATE rboard_user SET status_id = ? WHERE user_id = ?";
    
    /** */
    private static Logger log = Logger.getLogger(ReviewBoardTask.class);

    /** */
    private DBConnectionFactory dbConnectionFactory = null;

    /** */
    private int temporaryDeactivationThreshold;
    
    /** */
    private int permanentDeactivationThreshold;
    
    public ReviewBoardTask() {
        ConfigManager config = ConfigManager.getInstance();

        try {
            temporaryDeactivationThreshold =
                    Integer.parseInt(config.getString(RBOARD_TASK_NAMESPACE, "temporary_deactivation_threshold"));
            permanentDeactivationThreshold =
                    Integer.parseInt(config.getString(RBOARD_TASK_NAMESPACE, "permanent_deactivation_threshold"));
        } catch (UnknownNamespaceException une) {
            log.fatal("Could not load configuration namespace: " + RBOARD_TASK_NAMESPACE, une);
            throw new RuntimeException(une);
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
    }
    
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
    
    private void performTemporaryDeactivations(Connection connection) {
        StringBuffer queryString = new StringBuffer();
        queryString.append(QUERY_HEAD);
        queryString.append(" AND ru.status_id = 100 ");
        queryString.append(QUERY_TAIL);
        
        try {
            PreparedStatement slackerQuery = connection.prepareStatement(queryString.toString());
            PreparedStatement deactivate = connection.prepareStatement(DEACTIVATE_REVIEWER);
            
            slackerQuery.setInt(1, temporaryDeactivationThreshold);
        
            ResultSet slackers = slackerQuery.executeQuery();
            
            deactivate.setLong(1, 110);
            
            while (slackers.next()) {
                String phase = slackers.getString("description");
                String handle = slackers.getString("handle");
                long userId = slackers.getLong("user_id");
                
                log.info("Temporarily deactivating reviewer " + handle + "(" + userId + ").");
                
                deactivate.setLong(2, userId);
                
                deactivate.executeUpdate();
            }
            
            close(slackers);
            close(slackerQuery);
            close(deactivate);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    private void performPermanentDeactivations(Connection connection) {
        StringBuffer queryString = new StringBuffer();
        queryString.append(QUERY_HEAD);
        queryString.append(" AND ru.status_id IN (100, 110) ");
        queryString.append(QUERY_TAIL);
        
        try {
            PreparedStatement slackerQuery = connection.prepareStatement(queryString.toString());
            PreparedStatement deactivate = connection.prepareStatement(DEACTIVATE_REVIEWER);
            
            slackerQuery.setInt(1, permanentDeactivationThreshold);
        
            ResultSet slackers = slackerQuery.executeQuery();
            
            deactivate.setLong(1, 120);
            
            while (slackers.next()) {
                String phase = slackers.getString("description");
                String handle = slackers.getString("handle");
                long userId = slackers.getLong("user_id");
                
                log.info("Permanently deactivating reviewer " + handle + "(" + userId + ").");
                
                deactivate.setLong(2, userId);
                
                deactivate.executeUpdate();
            }
            
            close(slackers);
            close(slackerQuery);
            close(deactivate);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    /**
     * Convenience method for closing ResultSet objects since we need to close
     * them all over the place.
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
     * Convenience method for closing Statement and PreparedStatement
     * objects since we need to close them all over the place.
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
     * Convenience method for closing Connection objects since we need to close
     * them all over the place.
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
