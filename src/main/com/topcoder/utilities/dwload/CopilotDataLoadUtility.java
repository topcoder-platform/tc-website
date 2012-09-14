/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.utilities.dwload;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.sql.DBUtility;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>A DB utility which is intended to load data for co-pilots from transactional database to warehouse database.</p>
 *
 * <p>Below is the sample configuration for this tool:</p>
 *
 * <pre>
 * &lt;copilotDataLoadingTool&gt;
 *      &lt;sourcesList&gt;
 *          &lt;source name="TransactionalData"
 *                  value="jdbc:informix-sqli://DBHOST:DBPORT/tcs_catalog:INFORMIXSERVER=informixoltp_tcp;
 *                         user=DBUSERNAME;password=DBPASSWORD"/&gt;
 *          &lt;source name="WarehouseData"
 *                  value="jdbc:informix-sqli://DBHOST:DBPORT/tcs_dw:INFORMIXSERVER=informixoltp_tcp;
 *                         user=DBUSERNAME;password=DBPASSWORD"/&gt;
 *      &lt;/sourcesList&gt;
 *      &lt;parameterList&gt;
 *          &lt;parameter name="copilot_data_selection_file" value="/home/tc/web/scripts/sql/load_copilot_stats.sql"/&gt;
 *          &lt;parameter name="copilot_bugs_selection_file" value="/home/tc/web/scripts/sql/load_copilot_bug_races.sql"/&gt;
 *      &lt;/parameterList&gt;
 * &lt;/copilotDataLoadingTool&gt;
 * </pre>
 * 
 * @author isv
 * @version 1.0
 */
public class CopilotDataLoadUtility extends DBUtility {

    /**
     * <p>A <code>String</code> providing the SQL statement to be used for inserting records to
     * <code>tcs_dw:copilot_statistics</code> database table.</p>
     */
    private static final String COPILOT_STATS_INSERT_SQL
        = "INSERT INTO copilot_statistics (copilot_profile_id, user_id, projects_count, contests_count, " +
          "reposts_count, failures_count, current_projects_count, current_contests_count, " +
          "fulfillment, submission_rate, total_earnings) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    /**
     * <p>A <code>String</code> providing the SQL statement to be used for deleting single record from
     * <code>tcs_dw:copilot_statistics</code> database table.</p>
     */
    private static final String SINGLE_COPILOT_STATS_DELETE_SQL
        = "DELETE FROM copilot_statistics WHERE copilot_profile_id = ? AND user_id = ?";

    /**
     * <p>A <code>String</code> providing the SQL statement to be used for updating records in
     * <code>tcs_dw:copilot_statistics</code> database table to set the number of bug races.</p>
     */
    private static final String COPILOT_BUGS_UPDATE_SQL
        = "UPDATE copilot_statistics SET bug_races_count = ? WHERE user_id = ?";

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
     * <p>A <code>Timestamp</code> providing the start time of the tool.</p>
     */
    private java.sql.Timestamp fStartTime = null;

    /**
     * <p>A <code>Timestamp</code> providing the start time of the last run of the tool.</p>
     */
    private java.sql.Timestamp fLastLogTime = null;

    /**
     * <p>An <code>int</code> specifying the ID for the update log for this tool.</p>
     */
    private int LOG_TYPE = 7;

    /**
     * <p>Constructs new <code>CopilotDataLoadUtility</code> instance. This implementation does nothing.</p>
     */
    public CopilotDataLoadUtility() {
    }

    /**
     * <p>Shows the usage message for this tool.</p>
     *
     * @param msg The error message.
     */
    @Override
    protected void setUsageError(String msg) {
        sErrorMsg.setLength(0);
        sErrorMsg.append(msg).append("\n");
        sErrorMsg.append("CopilotDataLoadUtility:\n");
        sErrorMsg.append("   The following parameters should be included in the XML or the command line\n");
        sErrorMsg.append(
            "   -sourcesList : Configuration for data sources referencing the tcs_catalog and tcs_dw databases with ");
        sErrorMsg.append("data to be loaded from and to\n");
        fatal_error();
    }

    /**
     * <p>Runs this utility. Reads contents of SQL statements for selecting transactional data from files and loads
     * selected data into warehouse database tables.</p>
     */
    @Override
    protected void runUtility() {
        log.info("Co-Pilots data loading has started");

        try {
            fStartTime = new java.sql.Timestamp(System.currentTimeMillis());

            getLastUpdateTime();

            ResultSet result = null;
            PreparedStatement selectStatement = null;
            PreparedStatement insertStatement = null;
            PreparedStatement singleDeleteStatement = null;
            PreparedStatement updateBugRaceStatement = null;
            
            Connection sourceConn = null;
            try {
                // Retrieve all records from transactional database table
                String selectSQL = loadSQLFromFile("copilot_data_selection_file");
                log.info("Running SQL statement: " + selectSQL);
                sourceConn = getDBConnection(TRANSACTIONAL_DATA_SOURCE);
                sourceConn.setTransactionIsolation(Connection.TRANSACTION_READ_UNCOMMITTED);

                selectStatement = prepareStatement(selectSQL, sourceConn);

                selectStatement.setFetchSize(DATA_FETCH_SIZE);
                result = selectStatement.executeQuery();
                log.info("Retrieved transactional records for co-pilots from database");

                // Prepare the statement for inserting records into 
                insertStatement = prepareStatement(WAREHOUSE_DATA_SOURCE, COPILOT_STATS_INSERT_SQL);
                singleDeleteStatement = prepareStatement(WAREHOUSE_DATA_SOURCE, SINGLE_COPILOT_STATS_DELETE_SQL);

                // A mapping from user handles to IDs
                Map<String, Long> handleIdMap = new HashMap<String, Long>();
                
                // Iterate over all records from transactional database and insert respective record into warehouse 
                // database table
                while (result.next()) {
                    try {
                        // Get data for single co-pilot
                        long copilotProfileId = result.getLong("copilot_profile_id");
                        long userId = result.getLong("user_id");
                        String handle = result.getString("copilot_handle");
                        long projectsCount = result.getLong("projects_count");
                        long contestsCount = result.getLong("contests_count");
                        long repostsCount = result.getLong("reposts_count");
                        long failuresCount = result.getLong("failures_count");
                        long currentProjectsCount = result.getLong("current_projects_count");
                        long currentContestsCount = result.getLong("current_contests_count");
                        double totalEarnings = result.getDouble("total_earnings");
                        long registrationsCount = result.getLong("registrations_count");
                        long submissionsCount = result.getLong("submissions_count");
                        double submissionRate;
                        if (registrationsCount == 0) {
                            submissionRate = 0;
                        } else {
                            submissionRate = submissionsCount * 100D / registrationsCount;
                        }
                        double fulfillment;
                        if (contestsCount == 0) {
                            fulfillment = 0;
                        } else {
                            fulfillment = (contestsCount - failuresCount) * 100D / contestsCount;
                        }
                        handleIdMap.put(handle, userId);

                        // Delete respective record for co-pilot from tcs_dw
                        log.info("Running SQL statement: " + SINGLE_COPILOT_STATS_DELETE_SQL + " with parameters: " 
                                 + copilotProfileId + ", " + userId);
                        singleDeleteStatement.clearParameters();
                        singleDeleteStatement.setLong(1, copilotProfileId);
                        singleDeleteStatement.setLong(2, userId);
                        singleDeleteStatement.executeUpdate();
                        
                        // Insert record for co-pilot into tcs_dw
                        log.info("Running SQL statement: " + COPILOT_STATS_INSERT_SQL + " with parameters:");
                        // Output data for debugging
                        StringBuilder b = new StringBuilder();
                        b.append(copilotProfileId).append(", ");
                        b.append(userId).append(", ");
                        b.append(projectsCount).append(", ");
                        b.append(contestsCount).append(", ");
                        b.append(repostsCount).append(", ");
                        b.append(failuresCount).append(", ");
                        b.append(currentProjectsCount).append(", ");
                        b.append(currentContestsCount).append(", ");
                        b.append(fulfillment).append(", ");
                        b.append(submissionRate).append(", ");
                        b.append(totalEarnings);
                        log.info(b.toString());

                        insertStatement.setLong(1, copilotProfileId);
                        insertStatement.setLong(2, userId);
                        insertStatement.setLong(3, projectsCount);
                        insertStatement.setLong(4, contestsCount);
                        insertStatement.setLong(5, repostsCount);
                        insertStatement.setLong(6, failuresCount);
                        insertStatement.setLong(7, currentProjectsCount);
                        insertStatement.setLong(8, currentContestsCount);
                        insertStatement.setDouble(9, fulfillment);
                        insertStatement.setDouble(10, submissionRate);
                        insertStatement.setDouble(11, totalEarnings);

                        int insertedRecordsCount = insertStatement.executeUpdate();
                        if (insertedRecordsCount != 1) {
                            throw new SQLException(
                                "Wrong number of records inserted (expected 1): " + insertedRecordsCount);
                        }
                    } catch (SQLException e) {
                        log.error("Failed to insert record for co-pilots", e);
                    }
                }
                result.close();
                selectStatement.close();

                // Now update the number of bug races for copilots based on data in warehouse database
                selectSQL = loadSQLFromFile("copilot_bugs_selection_file");
                selectStatement = prepareStatement(WAREHOUSE_DATA_SOURCE, selectSQL);
                selectStatement.setFetchSize(DATA_FETCH_SIZE);
                updateBugRaceStatement = prepareStatement(WAREHOUSE_DATA_SOURCE, COPILOT_BUGS_UPDATE_SQL);

                log.info("Running SQL statement: " + selectSQL);
                result = selectStatement.executeQuery();
                log.info("Retrieved warehouse records for co-pilots' bug races from database");

                log.info("Running SQL statement: " + COPILOT_BUGS_UPDATE_SQL + " with parameters:");
                while (result.next()) {
                    // Get data for single bug race reporter 
                    String bugRaceReporter = result.getString("bug_race_reporter");
                    long bugRacesCount = result.getLong("bug_races_count");

                    // If reporter is a co-pilot then update it's bug races count in database
                    if (handleIdMap.containsKey(bugRaceReporter)) {
                        // Output data for debugging
                        long copilotUserId = handleIdMap.get(bugRaceReporter);
                        StringBuilder b = new StringBuilder();
                        b.append(copilotUserId).append(", ");
                        b.append(bugRacesCount);
                        log.info(b.toString());

                        // Update bug races count for co-pilot in database
                        updateBugRaceStatement.clearParameters();
                        updateBugRaceStatement.setLong(1, bugRacesCount);
                        updateBugRaceStatement.setLong(2, copilotUserId);

                        int updatedRecordsCount = updateBugRaceStatement.executeUpdate();
                        if (updatedRecordsCount != 1) {
                            throw new SQLException("Wrong number of records updated (expected 1): " 
                                                   + updatedRecordsCount);
                        }
                    }
                }
            } finally {
                DBMS.close(updateBugRaceStatement);
                DBMS.close(insertStatement);
                DBMS.close(selectStatement, result);
                if (singleDeleteStatement != null) {
                    DBMS.close(singleDeleteStatement);
                }
                if (sourceConn != null) {
                    sourceConn.close();
                }
                log.info("Co-pilots data loading for co-pilots has finished");
            }
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
            log.info("Co-Pilot data loading has finished");
        }
    }

    /**
     * <p>Gets the last time of running this tool.</p>
     * 
     * @throws Exception if an unexpected error occurs.
     */
    private void getLastUpdateTime() throws Exception {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        StringBuffer query;

        query = new StringBuffer(100);
        query.append("select timestamp from update_log where log_id = ");
        query.append("(select max(log_id) from update_log where log_type_id = ").append(LOG_TYPE).append(")");

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

    /**
     * <p>Sets the last time of running this tool.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
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
            query.append("VALUES (0, ?, ?, ").append(LOG_TYPE).append(")");
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
     * <p>Loads teh content of SQL statement from the specified file.</p>
     *
     * @param fileNameParameter a <code>String</code> providing the name of configuration property with path to the 
     *        target file.
     * @return a <code>String</code> providing the content of the file.
     * @throws IOException if an I/O error occurs while reading content of file.
     */
    private String loadSQLFromFile(String fileNameParameter) throws IOException {
        String fileName = (String) params.get(fileNameParameter);
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
     * <p>Call this method to lookup a calendar_id from the calendar table based on the Timestamp passed in. This assumes
     * that a calendar table exists in the database represented by the Connection object corresponding to the connection
     * index passed in.</p>
     */
    protected int lookupCalendarId(java.sql.Timestamp date, String db)
        throws SQLException {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);

        int year = cal.get(Calendar.YEAR);

        // The month is based on 0 for January so we need to add 1 to get
        // the right lookup value
        int month_of_year = cal.get(Calendar.MONTH) + 1;

        int day_of_month = cal.get(Calendar.DAY_OF_MONTH);

        PreparedStatement psSel;
        ResultSet rs = null;

        StringBuilder query = new StringBuilder(100);
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
                throw new SQLException("Unable to locate calendar_id for " + date.toString());
            }
        } finally {
            DBMS.close(rs);
            DBMS.close(psSel);
        }
    }

    /**
     * <p>Establishes a connection to target database using specified datasource.</p>
     * 
     * @param source a <code>String</code> referencing the datasource to be used for obtaining connection to database.
     * @return a <code>Connection</code> providing connection to target database. 
     * @throws SQLException if an unexpected error occurs.
     */
    private Connection getDBConnection(String source) throws SQLException {
        return DriverManager.getConnection((String) sources.get(source));
    }

    /**
     * <p>Call this method to create a PreparedStatement for a given sql.</p>
     *
     * @param sqlStr The sql query.
     * @param conn The reference to target database.
     * @return a statement to be executed for specified query.
     * @throws SQLException if an SQL error occurs while communicating to database.
     */
    private PreparedStatement prepareStatement(String sqlStr, Connection conn) throws SQLException {
        PreparedStatement ps;
        ps = conn.prepareStatement(sqlStr);
        return ps;
    }
}
