/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.ldap.sync;

import com.topcoder.security.ldap.LDAPClient;
import com.topcoder.security.ldap.LDAPClientException;
import com.topcoder.shared.util.logging.Logger;
import org.jboss.varia.scheduler.Schedulable;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.MessageFormat;
import java.util.Date;
import java.sql.SQLException;
import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 * <p>A schedulable task to be run periodically by <code>JBoss Scheduler Plugin</code> for synchronizing the user data
 * between database and <code>LDAP</code> directory.</p>
 *
 * <p>This tasks monitors the <code>common_oltp:audit_user</code> table and processes all records related to changed
 * <code>HANDLE</code> and <code>STATUS</code> column values.</p> 
 *
 * @author isv
 * @version 1.0 (LDAP Authentication Release Assembly v1.0)
 */
public class LDAPDBUserDataSynchronizationTask implements Schedulable {

    /**
     * <p>A <code>String</code> providing the template for message to be logged on results of processing a single audit
     * record.</p>
     */
    private static final String RESULT_MESSAGE_TEMPLATE
        = "Updated LDAP entry for TopCoder member (userId: {0}): updated attribute: {1}, old value: {2}, "
          +  "new value: {3}, original timestamp: {4}";

    /**
     * <p>A <code>String</code> providing the template for message to be logged on failure of processing a single audit
     * record.</p>
     */
    private static final String ERROR_MESSAGE_TEMPLATE
        = "Failed to update LDAP entry for TopCoder member (userId: {0}): attribute: {1}, old value: {2}, "
          +  "new value: {3}, original timestamp: {4} due to following error: {5}";

    /**
     * <p>A <code>String</code> providing the value for <code>column_name</code> column from <code>audit_user</code>
     * table for the rows corresponding to updated handles.</p>
     */
    private static final String UPDATED_COLUMN_HANDLE = "HANDLE";

    /**
     * <p>A <code>String</code> providing the value for <code>column_name</code> column from <code>audit_user</code>
     * table for the rows corresponding to updated statuses.</p>
     */
    private static final String UPDATED_COLUMN_STATUS = "STATUS";

    /**
     * <p>A <code>Log</code> to be used for logging the events encountered while performing the task iterations.</p>
     */
    private Logger log = Logger.getLogger(LDAPDBUserDataSynchronizationTask.class);

    /**
     * <p>A <code>String</code> providing the JNDI name for the data source to be used for obtaining connections to
     * target database.</p>
     */
    private final String dataSourceJNDIName;

    /**
     * <p>Constructs new <code>LDAPDBUserDataSynchronizationTask</code> instance.</p>
     *
     * @param dataSourceJNDIName a <code>String</code> providing the JNDI name for the datasource to be used for
     *        obtaining connections to target database.
     * @throws IllegalArgumentException if specified <code>dataSourceJNDIName</code> is <code>null</code> or empty.
     */
    public LDAPDBUserDataSynchronizationTask(String dataSourceJNDIName) {
        if ((dataSourceJNDIName == null) || (dataSourceJNDIName.trim().length() == 0)) {
            throw new IllegalArgumentException("The parameter [dataSourceJNDIName] is not valid. ["
                                               + dataSourceJNDIName + "]");
        }
        this.dataSourceJNDIName = dataSourceJNDIName;
    }

    /**
     * <p>Performs a next scheduled iteration of this task.</p>
     *
     * @param now a <code>Date</code> providing the current time at which this task has been launched.
     * @param remainingRepetitions a <code>long</code> providing the number of remaining repetitions.
     * @throws IllegalArgumentException if specified <code>now</code> is <code>null</code>.
     */
    public void perform(Date now, long remainingRepetitions) {
        if (now == null) {
            throw new IllegalArgumentException("The parameter [now] is NULL");
        }
        this.log.info("Starting task iteration at " + now + ". Remaining repetitions: " + remainingRepetitions);

        LDAPClient ldapClient = new LDAPClient();

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet result = null;

        String updatedColumnName = null;
        String oldValue = null;
        String newValue = null;
        String timestamp = null;
        long userId = 0;
        try {
            // Connect to DB and get the list of records from audit_user table which have not been processed yet
            // and are to be reflected in LDAP directory
            DataSource db = getDataSource();
            connection = db.getConnection();

            String query = "SELECT user_id, column_name, old_value, new_value, timestamp, reflected_to_ldap, rowid " +
                           "FROM audit_user " +
                           "WHERE (UPPER(column_name) = '" + UPDATED_COLUMN_HANDLE + "' " +
                           "       OR UPPER(column_name) = '" + UPDATED_COLUMN_STATUS + "') " +
                           "AND NOT reflected_to_ldap ORDER BY rowid";
            statement = connection.prepareStatement(query, ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_UPDATABLE);
            result = statement.executeQuery();

            if (result.next()) {
                ldapClient.connect();
                do {
                    updatedColumnName = result.getString("column_name");
                    oldValue = result.getString("old_value");
                    newValue = result.getString("new_value");
                    timestamp = result.getString("timestamp");
                    userId = result.getLong("user_id");

                    if (UPDATED_COLUMN_HANDLE.equalsIgnoreCase(updatedColumnName)) {
                        ldapClient.setTopCoderMemberProfileHandle(userId, newValue);
                        log.info(MessageFormat.format(RESULT_MESSAGE_TEMPLATE, userId, "handle", oldValue, newValue,
                                                      timestamp));
                    } else if (UPDATED_COLUMN_STATUS.equalsIgnoreCase(updatedColumnName)) {
                        ldapClient.setTopCoderMemberProfileStatus(userId, newValue);
                        log.info(MessageFormat.format(RESULT_MESSAGE_TEMPLATE, userId, "status", oldValue, newValue,
                                                      timestamp));
                    }
                    result.updateBoolean("reflected_to_ldap", true);
                    result.updateRow();
                } while (result.next());
            }
        } catch (NamingException e) {
            log.info(MessageFormat.format(ERROR_MESSAGE_TEMPLATE, userId, "handle", oldValue, newValue,
                                          timestamp, "Failed to locate data source in JNDI context" + e.getMessage()));
            this.log.error("Failed to locate data source in JNDI context", e);
        } catch (SQLException e) {
            log.info(MessageFormat.format(ERROR_MESSAGE_TEMPLATE, userId, "handle", oldValue, newValue,
                                          timestamp, "Failed to get and process the list of user audit records"
                                                     + e.getMessage()));
            this.log.error("Failed to get and process the list of user audit records", e);
        } catch (LDAPClientException e) {
            log.info(MessageFormat.format(ERROR_MESSAGE_TEMPLATE, userId, "handle", oldValue, newValue,
                                          timestamp, "Failed to update entry in LDAP directory" + e.getMessage()));
            this.log.error("Failed to update entry in LDAP directory", e);
        } finally {
            close(result);
            close(statement);
            close(connection);
            if (ldapClient.isConnected()) {
                try {
                    ldapClient.disconnect();
                } catch (LDAPClientException e) {
                    this.log.warn("Failed to disconnect from LDAP server successfully", e);
                }
            }
        }
        this.log.info("Finished task iteration.");
    }

    /**
     * <p>Closes the specified result set. Any SQL error which may occur is handled silently so it won't interrupt the
     * current logic flow.</p>
     *
     * @param resultSet a <code>ResultSet</code> to close.
     */
    private static void close(ResultSet resultSet) {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                // Ignore this error and do not fill the console output with unnecessary stack trace
            }
        }
    }

    /**
     * <p>Closes the specified SQL statement. Any SQL error which may occur is handled silently so it won't interrupt
     * the current logic flow.</p>
     *
     * @param statement a <code>Statement</code> to close.
     */
    private static void close(Statement statement) {
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                // Ignore this error and do not fill the console output with unnecessary stack trace
            }
        }
    }

    /**
     * <p>Closes the specified connection to database. Any SQL error which may occur is handled silently so it won't
     * interrupt the current logic flow.</p>
     *
     * @param connection a <code>Connection</code> to close.
     */
    private static void close(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                // Ignore this error and do not fill the console output with unnecessary stack trace
            }
        }
    }

    /**
     * <p>Gets the reference to <code>OLTP</code> database.</p>
     *
     * @return a <code>DataSource </code> to be used for establishing connections to <code>OLTP</code> database.
     * @throws NamingException if an unexpected error occurs while accessing JNDI context.
     */
    private DataSource getDataSource() throws NamingException {
        Context ctx = new InitialContext();
        return (DataSource) ctx.lookup(this.dataSourceJNDIName);
    }
}
