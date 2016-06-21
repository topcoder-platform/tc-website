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
import java.sql.Statement;
import java.util.Calendar;

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
    
    private static final int PARTICIPATION_METRICS_REPORT_MEMBERS_LOAD_SQL_DATE_NUM = 6;
    
    private static final int PARTICIPATION_METRICS_REPORT_COPILOT_LOAD_SQL_DATE_NUM = 3;

    private static final int USER_PERMISSION_GRANT_LOAD_DATE_NUM = 0;
    
    /**
     * <p>A <code>String</code> providing the SQL statement to be used for inserting records to 
     * <code>tcs_dw:participation_metrics_report_member</code> database table.</p>
     */
    private static final String PARTICIPATION_METRICS_REPORT_MEMBERS_INSERT_SQL 
        = "INSERT INTO participation_metrics_report_member(contest_id, registrant_id, is_submitter, " +
          "is_milestone_winner, is_final_winner, country_code, country, num_of_milestone_subs, num_of_final_subs, num_of_milestone_wins, num_of_final_wins) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

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
    
    private static final String SINGLE_PARTICIPATION_METRICS_REPORT_MEMBERS_DELETE_SQL 
        = "delete from participation_metrics_report_member where contest_id = ? and registrant_id = ?";
    
    private static final String SINGLE_PARTICIPATION_METRICS_REPORT_COPILOT_DELETE_SQL
        = "delete from participation_metrics_report_copilot where contest_id = ? and copilot_id = ?";
    
    protected java.sql.Timestamp fStartTime = null;
    
    protected java.sql.Timestamp fLastLogTime = null;
    
    private int PARTICIPATION_LOG_TYPE = 5;
    
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
            fStartTime = new java.sql.Timestamp(System.currentTimeMillis());
            
            getLastUpdateTime();
            
            // Load data for members
            loadWarehouseData(PARTICIPATION_METRICS_REPORT_MEMBERS_LOAD_SQL_FILE, "members",
                              null,
                              PARTICIPATION_METRICS_REPORT_MEMBERS_INSERT_SQL, 
                              new MemberDataStatementInitializer(), 
                              PARTICIPATION_METRICS_REPORT_MEMBERS_LOAD_SQL_DATE_NUM,
                              SINGLE_PARTICIPATION_METRICS_REPORT_MEMBERS_DELETE_SQL);

            // Load data for copilots
            loadWarehouseData(PARTICIPATION_METRICS_REPORT_COPILOT_LOAD_SQL_FILE, "copilots", 
                              null, 
                              PARTICIPATION_METRICS_REPORT_COPILOT_INSERT_SQL, 
                              new CopilotDataStatementInitializer(),
                              PARTICIPATION_METRICS_REPORT_COPILOT_LOAD_SQL_DATE_NUM,
                              SINGLE_PARTICIPATION_METRICS_REPORT_COPILOT_DELETE_SQL);

            // Load data for user permission grants
            loadWarehouseData(USER_PERMISSION_GRANT_LOAD_SQL_FILE, "user permission grants",
                              USER_PERMISSION_GRANT_DELETE_SQL, USER_PERMISSION_GRANT_INSERT_SQL, 
                              new UserPermissionGrantDataStatementInitializer(),
                              USER_PERMISSION_GRANT_LOAD_DATE_NUM,
                              null);
            
            setLastUpdateTime();

        } catch (SQLException e) {
            log.error(e.getMessage());
            DBMS.printSqlException(true, e);
        } catch (IOException e) {
            log.error(e.getMessage());
            DBMS.printException(e);
        } catch (Exception e) {
            log.error(e.getMessage());
            DBMS.printException(e);
        } finally {
            log.info("Participation Metrics Report data loading has finished");
        }
    }

    protected void getLastUpdateTime() throws Exception {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        StringBuffer query;

        query = new StringBuffer(100);
        query.append("select timestamp from update_log where log_id = ");
        query.append("(select max(log_id) from update_log where log_type_id = " + PARTICIPATION_LOG_TYPE + ")");

        try {
            stmt = prepareStatement(WAREHOUSE_DATA_SOURCE, query.toString());
            rs = stmt.executeQuery();
            if (rs.next()) {
                fLastLogTime = rs.getTimestamp(1);
                log.info("Date is " + fLastLogTime.toString());
            } else {
				// A little misleading here as we really didn't hit a SQL
                // set to a very early time.
                fLastLogTime = java.sql.Timestamp.valueOf("2001-01-01 00:00:00");
                log.info("Last log time not found in " +
                        "update_log table.");
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Failed to retrieve last log time.\n" +
                    sqle.getMessage());
        } finally {
            DBMS.close(rs);
            DBMS.close(stmt);
        }
    }

    private void setLastUpdateTime() throws Exception {
        PreparedStatement psUpd = null;
        StringBuffer query;

        try {
            int retVal;
            query = new StringBuffer(100);
            query.append("INSERT INTO update_log ");
            query.append("      (log_id ");        // 1
            query.append("       ,calendar_id ");  // 2
            query.append("       ,timestamp ");   // 3
            query.append("       ,log_type_id) ");   // 4
            query.append("VALUES (0, ?, ?, ").append(PARTICIPATION_LOG_TYPE).append(")");
            psUpd = prepareStatement(WAREHOUSE_DATA_SOURCE, query.toString());

            int calendar_id = lookupCalendarId(fStartTime, WAREHOUSE_DATA_SOURCE);
            psUpd.setInt(1, calendar_id);
            psUpd.setTimestamp(2, fStartTime);

            retVal = psUpd.executeUpdate();
            if (retVal != 1) {
                throw new SQLException("SetLastUpdateTime " +
                        " modified " + retVal + " rows, not one.");
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Failed to set last log time.\n" +
                    sqle.getMessage());
        } finally {
            DBMS.close(psUpd);
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
                                   InsertStatementInitializer insertStatementInitializer, int dateNum,
                                   String singleDeleteSQL)
        throws SQLException, IOException {
        log.info("Participation Metrics Report data loading for " + dataType + " has started");
        
        ResultSet result = null;
        PreparedStatement selectStatement = null;
        PreparedStatement deleteStatement = null;
        PreparedStatement insertStatement = null;
        PreparedStatement singleDeleteStatement = null;
		Connection sourceConn = null;
        try {
            // Retrieve all records from transactional database table
            String selectSQL = loadSQLFromFile(loadSqlFileName);
            log.info("Running SQL statement: " + selectSQL);
            sourceConn = getDBConnection(TRANSACTIONAL_DATA_SOURCE);
			sourceConn.setTransactionIsolation(Connection.TRANSACTION_READ_UNCOMMITTED);
			
            selectStatement = prepareStatement(selectSQL, sourceConn);
            
            for (int i = 1; i <= dateNum; i++) {
                selectStatement.setTimestamp(i, fLastLogTime);
            }
            
            selectStatement.setFetchSize(DATA_FETCH_SIZE);
            result = selectStatement.executeQuery();
            log.info("Retrieved transactional records for " + dataType + " from database");

            // Delete all existing records from related warehouse database table
            if (deleteSQL != null) {
                deleteStatement = prepareStatement(WAREHOUSE_DATA_SOURCE, deleteSQL);
                log.info("Running SQL statement: " + deleteSQL);
                deleteStatement.executeUpdate();
                DBMS.close(deleteStatement);
                log.info("Removed records for " + dataType + " from warehouse database");                
            }

            // Prepare the statement for inserting records into 
            log.info("Running multiple SQL statements: " + insertSQL);
            insertStatement = prepareStatement(WAREHOUSE_DATA_SOURCE, insertSQL);
            
            if (singleDeleteSQL != null) {
                singleDeleteStatement = prepareStatement(WAREHOUSE_DATA_SOURCE, singleDeleteSQL);
            }

            // Iterate over all records from transactional database and insert respective record into warehouse database
            // table
            while (result.next()) {
                try {
                    log.info(insertStatementInitializer.printData(result));
                    insertStatementInitializer.initialize(result, insertStatement, singleDeleteStatement);
                    
                    if (singleDeleteStatement != null) {
                        singleDeleteStatement.executeUpdate();
                    }
                    
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
            if (singleDeleteStatement != null) {
                DBMS.close(singleDeleteStatement);
            }
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
        void initialize(ResultSet selectedData, PreparedStatement insertStatement, PreparedStatement deleteStatement) throws SQLException;

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
        public void initialize(ResultSet selectedData, PreparedStatement insertStatement, PreparedStatement deleteStatement) throws SQLException {
            long contestId = selectedData.getLong("contest_id");
            long registrantId = selectedData.getLong("registrant_id");
            boolean isSubmitter = selectedData.getBoolean("is_submitter");
            boolean isMilestoneWinner = selectedData.getBoolean("is_milestone_winner");
            boolean isFinalWinner = selectedData.getBoolean("is_final_winner");
            String countryId = selectedData.getString("country_id");
            String countryName = selectedData.getString("country_name");
			long numberOfMilestoneSubmissions = selectedData.getLong("number_of_milestone_submissions");
			long numberOfFinalSubmissions = selectedData.getLong("number_of_final_submissions");
			long numberOfMilestoneWins = selectedData.getLong("number_of_milestone_wins");
			long numberOfFinalWins = selectedData.getLong("number_of_final_wins");

            insertStatement.setLong(1, contestId);
            insertStatement.setLong(2, registrantId);
            insertStatement.setBoolean(3, isSubmitter);
            insertStatement.setBoolean(4, isMilestoneWinner);
            insertStatement.setBoolean(5, isFinalWinner);
            insertStatement.setString(6, countryId);
            insertStatement.setString(7, countryName);
            insertStatement.setLong(8, numberOfMilestoneSubmissions);
            insertStatement.setLong(9, numberOfFinalSubmissions);
            insertStatement.setLong(10, numberOfMilestoneWins);
            insertStatement.setLong(11, numberOfFinalWins);
            
            deleteStatement.setLong(1, contestId);
            deleteStatement.setLong(2, registrantId);
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
            b.append(selectedData.getString("country_name")).append(", ");
			b.append(selectedData.getLong("number_of_milestone_submissions")).append(", ");
			b.append(selectedData.getLong("number_of_final_submissions")).append(", ");
			b.append(selectedData.getLong("number_of_milestone_wins")).append(", ");
			b.append(selectedData.getLong("number_of_final_wins"));
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
        public void initialize(ResultSet selectedData, PreparedStatement insertStatement, PreparedStatement deleteStatement) throws SQLException {
            long contestId = selectedData.getLong("contest_id");
            long copilotId = selectedData.getLong("copilot_id");
            String countryId = selectedData.getString("country_id");
            String countryName = selectedData.getString("country_name");

            insertStatement.setLong(1, contestId);
            insertStatement.setLong(2, copilotId);
            insertStatement.setString(3, countryId);
            insertStatement.setString(4, countryName);
            
            deleteStatement.setLong(1, contestId);
            deleteStatement.setLong(2, copilotId);
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
        public void initialize(ResultSet selectedData, PreparedStatement insertStatement, PreparedStatement deleteStatement) throws SQLException {
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
	
    /**
     * Call this method to lookup a calendar_id from the calendar table
     * based on the Timestamp passed in. This assumes that a calendar
     * table exists in the database represented by the Connection object
     * corresponding to the connection index passed in.
     */
    protected int lookupCalendarId(java.sql.Timestamp date, String db)
            throws SQLException {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        StringBuffer query = null;

        int year = cal.get(Calendar.YEAR);

        // The month is based on 0 for January so we need to add 1 to get
        // the right lookup value
        int month_of_year = cal.get(Calendar.MONTH) + 1;

        int day_of_month = cal.get(Calendar.DAY_OF_MONTH);

        PreparedStatement psSel = null;
        ResultSet rs = null;

        query = new StringBuffer(100);
        query.append("SELECT calendar_id ");
        query.append("  FROM calendar ");
        query.append(" WHERE year = ? ");
        query.append("   AND month_numeric = ? ");
        query.append("   AND day_of_month = ? ");
        psSel = prepareStatement(db, query.toString());

        psSel.setInt(1, year);
        psSel.setInt(2, month_of_year);
        psSel.setInt(3, day_of_month);

        try {
            rs = psSel.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            } else {
                throw new SQLException("Unable to locate calendar_id for " +
                        date.toString());
            }
        } catch (SQLException sqle) {
            throw sqle;
        } finally {
            DBMS.close(rs);
            DBMS.close(psSel);
        }
    }
    	
}
