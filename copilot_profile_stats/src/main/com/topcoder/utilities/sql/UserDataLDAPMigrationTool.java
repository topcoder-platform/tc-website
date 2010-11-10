/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.utilities.sql;

import com.topcoder.security.ldap.LDAPClient;
import com.topcoder.security.ldap.LDAPClientException;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.sql.DBUtility;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * <p>A DB utility which is intended to migrate basic data for <code>TopCoder</code> member accounts from database to
 * <code>LDAP</code> repository.</p>
 *
 * <p>The purpose of this tool is to read the data for <code>TopCoder</code> member accounts from database table and
 * create respective entry in <code>LDAP</code> directory for each account. As of current version the following
 * migration strategy is implemented:</p>
 *
 * <p>
 *     <table>
 *        <tr>
 *            <th>Table</th>
 *            <th>Column</th>
 *            <th>LDAP Attribute</th>
 *        </tr>
 *        <tr>
 *            <td>security_user</td>
 *            <td>login_id</td>
 *            <td>uid</td>
 *        </tr>
 *        <tr>
 *            <td>security_user</td>
 *            <td>password</td>
 *            <td>userPassword</td>
 *        </tr>
 *        <tr>
 *            <td>user</td>
 *            <td>handle</td>
 *            <td>handle</td>
 *        </tr>
 *        <tr>
 *            <td>user</td>
 *            <td>status</td>
 *            <td>status</td>
 *        </tr>
 *     </table>
 * </p>
 *
 * <p>Below is the sample configuration for this tool:</p>
 *
 * <pre>
 * &lt;userDataLDAPMigrationTool&gt;
 *      &lt;sourcesList&gt;
 *          &lt;source name="MemberData"
 *                  value="jdbc:informix-sqli://DBHOST:DBPORT/common_oltp:INFORMIXSERVER=informixoltp_tcp;
 *                         user=DBUSERNAME;password=DBPASSWORD"/&gt;
 *      &lt;/sourcesList&gt;
 *      &lt;parameterList&gt;
 *      &lt;/parameterList&gt;
 * &lt;/userDataLDAPMigrationTool&gt;
 * </pre>
 *
 * @author isv
 * @version 1.0 (LDAP Authentication Assembly v1.0)
 */
public class UserDataLDAPMigrationTool extends DBUtility {

    /**
     * <p>A <code>String</code> providing the SQL statement to be used for retrieving basic data for
     * <code>TopCoder</code> member accounts to be migrated into <code>LDAP</code> directory.</p>
     */
    private static final String MEMBER_DATA_SQL = "SELECT s.login_id, u.handle, s.password, u.status "
        + "FROM security_user s, user u WHERE s.login_id = u.user_id ORDER BY u.handle";

    /**
     * <p>A <code>String</code> providing the name for pre-configured data source to be used for obtaining connections
     * to target database.</p>
     */
    private static final String MEMBER_DATA_SOURCE = "MemberData";

    /**
     * <p>An <code>int</code> providing the number of rows with <code>TopCoder</code> member profile data that should be
     * fetched from the database when more rows are needed.</p>
     */
    private static final int MEMBER_DATA_FETCH_SIZE = 100;

    /**
     * <p>Constructs new <code>UserDataLDAPMigrationTool</code> instance. This implementation does nothing.</p>
     */
    public UserDataLDAPMigrationTool() {
    }

    /**
     * <p>Runs this DB utility.<p/>
     *
     * <p>Reads the data for <code>TopCoder</code> member accounts from joined <code>security_user</code> and
     * <code>user</code> database tables and creates respective entry in <code>LDAP</code> directory for each migrated
     * user account. The details for each processed user account are logged.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    @Override
    protected void runUtility() throws Exception {
        log.info("TopCoder member profile migration to LDAP directory started");

        // Connect and authenticate to LDAP directory
        LDAPClient ldapClient = new LDAPClient();
        ldapClient.connect();
        log.debug("Connected and authenticated to LDAP server");

        // Migrate TopCoder member profile data to LDAP directory
        ResultSet result = null;
        PreparedStatement statement = null;
        try {
            statement = prepareStatement(MEMBER_DATA_SOURCE, MEMBER_DATA_SQL);
            statement.setFetchSize(MEMBER_DATA_FETCH_SIZE);
            result = statement.executeQuery();
            log.debug("Retrieved TopCoder member profile records from database");
            while (result.next()) {
                // Get basic profile data from database
                String handle = result.getString("handle");
                String status = result.getString("status");
                char[] password = result.getString("password").toCharArray();
                long userId = result.getLong("login_id");

                // Migrate single member profile. If an error occurs then log it and continue migrating next profiles
                try {
                    // Add entry to LDAP directory and log the result
                    ldapClient.addTopCoderMemberProfile(userId, handle, new String(password), status);
                    logMigrationResult(userId, handle, status);
                } catch (Exception e) {
                    logMigrationErrorResult(userId, handle, status, e.getMessage());
                    log.error("Failed to migrate TopCoder member profile " + handle, e);
                }
            }
        } finally {
            DBMS.close(statement, result);
            try {
                ldapClient.disconnect();
            } catch (LDAPClientException e) {
                log.warn("Failed to disconnect from LDAP server successfully");
            }
            log.info("TopCoder member profile migration to LDAP directory finished");
        }
    }

    /**
     * <p>Shows the help on usage of this DB utility.</p>
     *
     * @param msg a <code>String</code> providing error message.
     */
    @Override
    protected void setUsageError(String msg) {
        sErrorMsg.setLength(0);
        sErrorMsg.append(msg).append("\n");
        sErrorMsg.append("UserDataLDAPMigrationTool:\n");
        sErrorMsg.append("   The following parameters should be included in the XML or the command line\n");
        sErrorMsg.append("   -sourcesList : Configuration for data source referencing the common_oltp database with ")
                 .append("user accounts to be migrated\n");
        fatal_error();
    }

    /**
     * <p>Logs the details on user profile which is going to be migrated to <code>LDAP</code> directory. The details are
     * logged at <code>DEBUG</code> level.</p>
     *
     * @param userId a <code>long</code> providing the user ID.
     * @param handle a <code>String</code> providing the user handle.
     * @param status a <code>String</code> providing the user status.
     */
    private void logMigrationResult(long userId, String handle, String status) {
        if (log.isDebugEnabled()) {
            StringBuilder b = new StringBuilder();
            b.append("Migrated TopCoder member account: ");
            b.append("ID = ").append(userId).append(", ");
            b.append("handle = ").append(handle).append(", ");
            b.append("status = ").append(status);
            b.append(" to LDAP directory");
            log.debug(b.toString());
        }
    }

    /**
     * <p>Logs the details on user profile which had failed to be migrated to <code>LDAP</code> directory due to some
     * error. The details are logged at <code>DEBUG</code> level.</p>
     *
     * @param userId a <code>long</code> providing the user ID.
     * @param handle a <code>String</code> providing the user handle.
     * @param status a <code>String</code> providing the user status.
     * @param errorMessage a <code>String</code> providing the description of the error which prevented the profile from
     *        successful migration to <code>LDAP</code> directory. 
     */
    private void logMigrationErrorResult(long userId, String handle, String status, String errorMessage) {
        if (log.isDebugEnabled()) {
            StringBuilder b = new StringBuilder();
            b.append("Failed to migrate TopCoder member account account: ");
            b.append("ID = ").append(userId).append(", ");
            b.append("handle = ").append(handle).append(", ");
            b.append("status = ").append(status);
            b.append(" to LDAP directory due to error: ").append(errorMessage);
            log.debug(b.toString());
        }
    }
}
