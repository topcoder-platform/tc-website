/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.utilities.dwload;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.sql.DBUtility;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;

/**
 * <p>A DB utility which is intended to load data for <code>Participation Metrics Report</code> from transactional 
 * database to warehouse database.</p>
 *
 * <p>Below is the sample configuration for this tool:</p>
 *
 * <pre>
 * &lt;memberParticipationMetricsReportDataLoadingTool&gt;
 *      &lt;sourcesList&gt;
 *          &lt;source name="TransactionalData"
 *                  value="jdbc:informix-sqli://DBHOST:DBPORT/tcs_catalog:INFORMIXSERVER=informixoltp_tcp;
 *                         user=DBUSERNAME;password=DBPASSWORD"/&gt;
 *          &lt;source name="WarehouseData"
 *                  value="jdbc:informix-sqli://DBHOST:DBPORT/tcs_dw:INFORMIXSERVER=informixoltp_tcp;
 *                         user=DBUSERNAME;password=DBPASSWORD"/&gt;
 *      &lt;/sourcesList&gt;
 *      &lt;parameterList&gt;
 *      &lt;/parameterList&gt;
 * &lt;/memberParticipationMetricsReportDataLoadingTool&gt;
 * </pre>
 * 
 * @author isv
 * @version 1.0 (Release Assembly - TC Cockpit - Member Participation Metrics Report Performance Enhancement)
 */
public class MemberParticipationMetricsReportDataLoadUtility extends DBUtility {

    /**
     * <p>A <code>String</code> providing the name for pre-configured data source to be used for obtaining connections
     * to transactional database.</p>
     */
    private static final String TRANSACTIONAL_DATA_SOURCE = "TransactionalData";

    /**
     * <p>A <code>String</code> providing the name for pre-configured data source to be used for obtaining connections
     * to warehouse database.</p>
     */
    private static final String WAREHOUSE_DATA_SOURCE = "WarehouseData";

    /**
     * <p>An <code>int</code> providing the number of rows with transactional data that should be fetched from the 
     * database when more rows are needed.</p>
     */
    private static final int DATA_FETCH_SIZE = 20;

    /**
     * <p>A <code>String</code> providing the base ptah for files with SQL statements for selecting the records to be
     * loaded from transactional database to warehouse database.</p>
     */
    private static final String PARTICIPATION_METRICS_REPORT_SQL_FILES_BASE 
        = "/home/coder/web/scripts/sql";

    /**
     * <p>A <code>String</code> providing the SQL statement to be used for selecting records for loading to 
     * <code>tcs_dw:participation_metrics_report_member</code> database table.</p>
     */
    private static final String PARTICIPATION_METRICS_REPORT_MEMBERS_LOAD_SQL_FILE =
        PARTICIPATION_METRICS_REPORT_SQL_FILES_BASE + "/load_query_member.sql";

    /**
     * <p>A <code>String</code> providing the SQL statement to be used for selecting records for loading to 
     * <code>tcs_dw:participation_metrics_report_copilot</code> database table.</p>
     */
    private static final String PARTICIPATION_METRICS_REPORT_COPILOT_LOAD_SQL_FILE 
        = PARTICIPATION_METRICS_REPORT_SQL_FILES_BASE + "/load_query_copilot.sql";

    /**
     * <p>A <code>String</code> providing the SQL statement to be used for selecting records for loading to 
     * <code>tcs_dw:user_permission_grant</code> database table.</p>
     */
    private static final String USER_PERMISSION_GRANT_LOAD_SQL_FILE 
        = PARTICIPATION_METRICS_REPORT_SQL_FILES_BASE + "/load_query_upg.sql";

    /**
     * <p>A <code>String</code> providing the SQL statement to be used for inserting records to 
     * <code>tcs_dw:participation_metrics_report_member</code> database table.</p>
     */
    private static final String PARTICIPATION_METRICS_REPORT_MEMBERS_INSERT_SQL 
        = "INSERT INTO participation_metrics_report_member(contest_id, registrant_id, is_submitter, " +
          "is_milestone_winner, is_final_winner, country_code, country) VALUES (?, ?, ?, ?, ?, ?, ?)";

    /**
     * <p>A <code>String</code> providing the SQL statement to be used for inserting records to 
     * <code>tcs_dw:participation_metrics_report_copilot</code> database table.</p>
     */
    private static final String PARTICIPATION_METRICS_REPORT_COPILOT_INSERT_SQL 
        = "INSERT INTO participation_metrics_report_copilot(contest_id, copilot_id, country_code, country) " +
          "VALUES (?, ?, ?, ?)";

    /**
     * <p>A <code>String</code> providing the SQL statement to be used for inserting records to 
     * <code>tcs_dw:user_permission_grant</code> database table.</p>
     */
    private static final String USER_PERMISSION_GRANT_INSERT_SQL 
        = "INSERT INTO user_permission_grant (user_permission_grant_id, user_id, resource_id, permission_type_id, " +
          "is_studio) VALUES (?, ?, ?, ?, ?)";

    /**
     * <p>A <code>String</code> providing the SQL statement to be used for deleting records from 
     * <code>tcs_dw:participation_metrics_report_member</code> database table.</p>
     */
    private static final String PARTICIPATION_METRICS_REPORT_MEMBERS_DELETE_SQL 
        = "DELETE FROM participation_metrics_report_member";

    /**
     * <p>A <code>String</code> providing the SQL statement to be used for deleting records from 
     * <code>tcs_dw:participation_metrics_report_copilot</code> database table.</p>
     */
    private static final String PARTICIPATION_METRICS_REPORT_COPILOT_DELETE_SQL 
        = "DELETE FROM participation_metrics_report_copilot";

    /**
     * <p>A <code>String</code> providing the SQL statement to be used for deleting records from 
     * <code>tcs_dw:user_permission_grant</code> database table.</p>
     */
    private static final String USER_PERMISSION_GRANT_DELETE_SQL = "DELETE FROM user_permission_grant";
    
    /**
     * <p>Constructs new <code>MemberParticipationMetricsReportDataLoadUtility</code> instance. This implementation does
     * nothing.</p>
     */
    public MemberParticipationMetricsReportDataLoadUtility() {
    }

    /**
     * <p>Runs this utility. Reads contents of SQL statements for selecting transactional data from files and loads 
     * selected data into warehouse database tables.</p>
     */
    @Override
    protected void runUtility() {
        log.info("Participation Metrics Report data loading has started");

        try {
			// Load data for user permission grants
            loadWarehouseData(USER_PERMISSION_GRANT_LOAD_SQL_FILE, "user permission grants",
                              USER_PERMISSION_GRANT_DELETE_SQL, USER_PERMISSION_GRANT_INSERT_SQL, 
                              new UserPermissionGrantDataStatementInitializer()); 
							  
			// Load data for copilots
            loadWarehouseData(PARTICIPATION_METRICS_REPORT_COPILOT_LOAD_SQL_FILE, "copilots", 
                              PARTICIPATION_METRICS_REPORT_COPILOT_DELETE_SQL, 
                              PARTICIPATION_METRICS_REPORT_COPILOT_INSERT_SQL, new CopilotDataStatementInitializer()); 
							  
            // Load data for members
            loadWarehouseData(PARTICIPATION_METRICS_REPORT_MEMBERS_LOAD_SQL_FILE, "members",
                              PARTICIPATION_METRICS_REPORT_MEMBERS_DELETE_SQL,
                              PARTICIPATION_METRICS_REPORT_MEMBERS_INSERT_SQL, new MemberDataStatementInitializer()); 

            

            
        } catch (SQLException e) {
            log.error(e.getMessage());
            DBMS.printSqlException(true, e);
        } catch (IOException e) {
            log.error(e.getMessage());
            DBMS.printException(e);
        } finally {
            log.info("Participation Metrics Report data loading has finished");
        }
    }

    /**
     * Show usage of the DBUtility. <p/> Subclasses should implement this method to show how the final user should call
     * them.
     *
     * @param msg The error message.
     */
    @Override
    protected void setUsageError(String msg) {
        sErrorMsg.setLength(0);
        sErrorMsg.append(msg).append("\n");
        sErrorMsg.append("MemberParticipationMetricsReportDataLoadUtility:\n");
        sErrorMsg.append("   The following parameters should be included in the XML or the command line\n");
        sErrorMsg.append("   -sourcesList : Configuration for data sources referencing the tcs_catalog and tcs_dw databases with ");
        sErrorMsg.append("data to be loaded from and to\n");
        fatal_error();
    }

    /**
     * <p>Loads teh content of SQL statement from the specified file.</p>
     * 
     * @param fileName a <code>String</code> providing the path to the target file.
     * @return a <code>String</code> providing the content of the file.
     * @throws IOException if an I/O error occurs while reading content of file.
     */
    private static String loadSQLFromFile(String fileName) throws IOException {
        BufferedReader reader = new BufferedReader(new FileReader(fileName));
        String line;
        StringBuilder sql = new StringBuilder();
        try {
            while ((line = reader.readLine()) != null) {
                sql.append(line).append(" ");
            }
        } finally {
            reader.close();
        }

        return sql.toString();
    }

    /**
     * <p>Performs the loading of transactional data of specified type into respective warehouse database table.</p>
     *
     * @param loadSqlFileName            a <code>String</code> providing the path to file with SQL for selecting the
     *                                   data for loading.
     * @param dataType                   a <code>String</code> providing the description of data to be loaded.
     * @param deleteSQL                  a <code>String</code> providing the SQL statement for deleting the records from
     *                                   warehouse database table.
     * @param insertSQL                  a <code>String</code> providing the SQL statement for inserting records into
     *                                   warehouse database table.
     * @param insertStatementInitializer a <code>InsertStatementInitializer</code> to be used for initializing insert
     *                                   statements based on data loaded from the transactional database table.
     * @throws SQLException if an unexpected error occurs.
     * @throws IOException if an I/O error occurs while reading content of file.
     */
    private void loadWarehouseData(String loadSqlFileName, String dataType, String deleteSQL, String insertSQL,
                                   InsertStatementInitializer insertStatementInitializer)
        throws SQLException, IOException {
        log.info("Participation Metrics Report data loading for " + dataType + " has started");
        
        ResultSet result = null;

		PreparedStatement selectStatement = null;
        PreparedStatement deleteStatement = null;
        PreparedStatement insertStatement = null;
		Connection sourceConn = null;
        try {
            // Retrieve all records from transactional database table
            String selectSQL = loadSQLFromFile(loadSqlFileName);
            log.info("Running SQL statement: " + selectSQL);
			sourceConn = getDBConnection(TRANSACTIONAL_DATA_SOURCE);
			sourceConn.setTransactionIsolation(Connection.TRANSACTION_READ_UNCOMMITTED);
			
            selectStatement = prepareStatement(selectSQL, sourceConn);
            selectStatement.setFetchSize(DATA_FETCH_SIZE);
			
            result = selectStatement.executeQuery();
            log.info("Retrieved transactional records for " + dataType + " from database");

            // Delete all existing records from related warehouse database table
            deleteStatement = prepareStatement(WAREHOUSE_DATA_SOURCE, deleteSQL);
            log.info("Running SQL statement: " + deleteSQL);
            deleteStatement.executeUpdate();
            DBMS.close(deleteStatement);
            log.info("Removed records for " + dataType + " from warehouse database");

            // Prepare the statement for inserting records into 
            log.info("Running multiple SQL statements: " + insertSQL);
            insertStatement = prepareStatement(WAREHOUSE_DATA_SOURCE, insertSQL);

            // Iterate over all records from transactional database and insert respective record into warehouse database
            // table
            while (result.next()) {
                try {
                    log.info(insertStatementInitializer.printData(result));
                    insertStatementInitializer.initialize(result, insertStatement);
                    int insertedRecordsCount = insertStatement.executeUpdate();
                    if (insertedRecordsCount != 1) {
                        throw new SQLException("Wrong number of records inserted (expected 1): " + insertedRecordsCount);
                    }
                } catch (SQLException e) {
                    log.error("Failed to insert record for " + dataType, e);
                }
            }
        } finally {
			
            DBMS.close(deleteStatement);
            DBMS.close(insertStatement);
            DBMS.close(selectStatement, result);
			if (sourceConn != null) 
			{ sourceConn.close(); }
            log.info("Participation Metrics Report data loading for " + dataType + " has finished");
        }
    }
	
	private Connection getDBConnection(String source) throws SQLException {
				Connection connection = DriverManager.getConnection((String)sources.get(source));
			
			return connection;
		}
		
		/**
     * Call this method to create a PreparedStatement for a given sql.
     *
     * @param source The reference to target database.
     * @param sqlStr The sql query.
     * @return a statement to be executed for specified query.
     * @throws SQLException if an SQL error occurs while communicating to database.
     */
    private PreparedStatement prepareStatement(String sqlStr, Connection conn) throws SQLException {
       
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement(sqlStr);
        } catch (SQLException sqle) {
            throw sqle;
        }
        return ps;
    }

    /**
     * <p>An interface for initializer of the INSERT SQL statements based on the data provided by the current row from
     * selected result set.</p>
     */
    private static interface InsertStatementInitializer {

        /**
         * <p>Initializes the parameters for specified insert statement with data taken from the current row of 
         * specified result set.</p>
         * 
         * @param selectedData a <code>ResultSet</code> providing the selected data. 
         * @param insertStatement a <code>PreparedStatement</code> providing the SQL statement for inserting record.
         * @throws SQLException if an SQL error occurs while retrieving data for specified record.
         */
        void initialize(ResultSet selectedData, PreparedStatement insertStatement) throws SQLException;

        /**
         * <p>Gets the textual presentation of the date for the current row from the specified result set.</p>
         * 
         * @param selectedData a a <code>ResultSet</code> providing the selected data.
         * @return a <code>String</code> providing the textual presentation of the inserting record.
         * @throws SQLException if an SQL error occurs while retrieving data for specified record.
         */
        String printData(ResultSet selectedData) throws SQLException;
    }

    /**
     * <p>A SQL statement initializer for <code>tcs_dw:participation_metrics_report_member</code> database table.</p>
     */
    private static class MemberDataStatementInitializer implements InsertStatementInitializer {

        /**
         * <p>Constructs new <code>MemberDataStatementInitializer</code> instance. This implementation does nothing.</p>
         */
        private MemberDataStatementInitializer() {
        }

        /**
         * <p>Initializes the parameters for specified insert statement with data taken from the current row of 
         * specified result set.</p>
         *
         * @param selectedData    a <code>ResultSet</code> providing the selected data.
         * @param insertStatement a <code>PreparedStatement</code> providing the SQL statement for inserting record.
         * @throws SQLException if an SQL error occurs while retrieving data for specified record.
         */
        public void initialize(ResultSet selectedData, PreparedStatement insertStatement) throws SQLException {
            long contestId = selectedData.getLong("contest_id");
            long registrantId = selectedData.getLong("registrant_id");
            boolean isSubmitter = selectedData.getBoolean("is_submitter");
            boolean isMilestoneWinner = selectedData.getBoolean("is_milestone_winner");
            boolean isFinalWinner = selectedData.getBoolean("is_final_winner");
            String countryId = selectedData.getString("country_id");
            String countryName = selectedData.getString("country_name");

            insertStatement.setLong(1, contestId);
            insertStatement.setLong(2, registrantId);
            insertStatement.setBoolean(3, isSubmitter);
            insertStatement.setBoolean(4, isMilestoneWinner);
            insertStatement.setBoolean(5, isFinalWinner);
            insertStatement.setString(6, countryId);
            insertStatement.setString(7, countryName);
        }

        /**
         * <p>Gets the textual presentation of the date for the current row from the specified result set.</p>
         *
         * @param selectedData a a <code>ResultSet</code> providing the selected data.
         * @return a <code>String</code> providing the textual presentation of the inserting record.
         * @throws SQLException if an SQL error occurs while retrieving data for specified record.
         */
        public String printData(ResultSet selectedData) throws SQLException {
            StringBuilder b = new StringBuilder();
            b.append(selectedData.getLong("contest_id")).append(", ");
            b.append(selectedData.getLong("registrant_id")).append(", ");
            b.append(selectedData.getBoolean("is_submitter")).append(", ");
            b.append(selectedData.getBoolean("is_milestone_winner")).append(", ");
            b.append(selectedData.getBoolean("is_final_winner")).append(", ");
            b.append(selectedData.getString("country_id")).append(", ");
            b.append(selectedData.getString("country_name"));
            return b.toString();
        }
    }

    /**
     * <p>A SQL statement initializer for <code>tcs_dw:participation_metrics_report_copilot</code> database table.</p>
     */
    private static class CopilotDataStatementInitializer implements InsertStatementInitializer {

        /**
         * <p>Constructs new <code>CopilotDataStatementInitializer</code> instance. This implementation does nothing.
         * </p>
         */
        private CopilotDataStatementInitializer() {
        }

        /**
         * <p>Initializes the parameters for specified insert statement with data taken from the current row of
         * specified result set.</p>
         *
         * @param selectedData    a <code>ResultSet</code> providing the selected data.
         * @param insertStatement a <code>PreparedStatement</code> providing the SQL statement for inserting record.
         * @throws SQLException if an unexpected error occurs.
         */
        public void initialize(ResultSet selectedData, PreparedStatement insertStatement) throws SQLException {
            long contestId = selectedData.getLong("contest_id");
            long copilotId = selectedData.getLong("copilot_id");
            String countryId = selectedData.getString("country_id");
            String countryName = selectedData.getString("country_name");

            insertStatement.setLong(1, contestId);
            insertStatement.setLong(2, copilotId);
            insertStatement.setString(3, countryId);
            insertStatement.setString(4, countryName);
        }

        /**
         * <p>Gets the textual presentation of the date for the current row from the specified result set.</p>
         *
         * @param selectedData a a <code>ResultSet</code> providing the selected data.
         * @return a <code>String</code> providing the textual presentation of the inserting record.
         * @throws SQLException if an SQL error occurs while retrieving data for specified record.
         */
        public String printData(ResultSet selectedData) throws SQLException {
            StringBuilder b = new StringBuilder();
            b.append(selectedData.getLong("contest_id")).append(", ");
            b.append(selectedData.getLong("copilot_id")).append(", ");
            b.append(selectedData.getString("country_id")).append(", ");
            b.append(selectedData.getString("country_name"));
            return b.toString();
        }
    }

    /**
     * <p>A SQL statement initializer for <code>tcs_dw:user_permission_grant</code> database table.</p>
     */
    private static class UserPermissionGrantDataStatementInitializer implements InsertStatementInitializer {

        /**
         *  <p>Constructs new <code>UserPermissionGrantDataStatementInitializer</code> instance. This implementation 
         *  does nothing.</p>
         */
        private UserPermissionGrantDataStatementInitializer() {
        }

        /**
         * <p>Initializes the parameters for specified insert statement with data taken from the current row of
         * specified result set.</p>
         *
         * @param selectedData    a <code>ResultSet</code> providing the selected data.
         * @param insertStatement a <code>PreparedStatement</code> providing the SQL statement for inserting record.
         * @throws SQLException if an unexpected error occurs.
         */
        public void initialize(ResultSet selectedData, PreparedStatement insertStatement) throws SQLException {
            long userPermissionGrantId = selectedData.getLong("user_permission_grant_id");
            long userId = selectedData.getLong("user_id");
            long resourceId = selectedData.getLong("resource_id");
            long permissionTypeId = selectedData.getLong("permission_type_id");
            int isStudio = selectedData.getInt("is_studio");

            insertStatement.setLong(1, userPermissionGrantId);
            insertStatement.setLong(2, userId);
            insertStatement.setLong(3, resourceId);
            insertStatement.setLong(4, permissionTypeId);
            insertStatement.setLong(5, isStudio);
        }

        /**
         * <p>Gets the textual presentation of the date for the current row from the specified result set.</p>
         *
         * @param selectedData a a <code>ResultSet</code> providing the selected data.
         * @return a <code>String</code> providing the textual presentation of the inserting record.
         * @throws SQLException if an SQL error occurs while retrieving data for specified record.
         */
        public String printData(ResultSet selectedData) throws SQLException {
            StringBuilder b = new StringBuilder();
            b.append(selectedData.getLong("user_permission_grant_id")).append(", ");
            b.append(selectedData.getLong("user_id")).append(", ");
            b.append(selectedData.getLong("resource_id")).append(", ");
            b.append(selectedData.getLong("permission_type_id")).append(", ");
            b.append(selectedData.getInt("is_studio"));
            return b.toString();
        }
		
		
    }
}
