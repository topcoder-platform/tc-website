/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.utilities.dwload;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.sql.DBUtility;

/**
 * <p>
 * A DB utility which is intended to load data for client user statistic from
 * transactional database to warehouse database.
 * </p>
 *
 * <p>
 * Below is the sample configuration for this tool:
 * </p>
 *
 * <pre>
 * &lt;clientUserStatsDataLoadingTool&gt;
 *      &lt;sourcesList&gt;
 *          &lt;source name="TransactionalData"
 *                  value="jdbc:informix-sqli://DBHOST:DBPORT/tcs_catalog:INFORMIXSERVER=informixoltp_tcp;
 *                         user=DBUSERNAME;password=DBPASSWORD"/&gt;
 *          &lt;source name="WarehouseData"
 *                  value="jdbc:informix-sqli://DBHOST:DBPORT/tcs_dw:INFORMIXSERVER=informixoltp_tcp;
 *                         user=DBUSERNAME;password=DBPASSWORD"/&gt;
 *      &lt;/sourcesList&gt;
 *      &lt;parameterList&gt;
 *          &lt;parameter name="client_user_stats_selection_file"
 *                        value="/home/tc/web/scripts/sql/load_client_user_stats.sql"/&gt;
 *      &lt;/parameterList&gt;
 * &lt;/clientUserStatsDataLoadingTool&gt;
 * </pre>
 *
 * @author ZPetrovich
 * @version 1.0
 */
public class ClientUserStatsLoadUtility extends DBUtility {

    /**
     * <p>A <code>String</code> providing the SQL statement to be used for inserting records to
     * <code>tcs_dw:client_user_stats</code> database table.</p>
     */
    private static final String CLIENT_USER_STATS_INSERT_SQL = "INSERT INTO client_user_stats (client_user_stats_id, "
        + "client_id, year, month, user_count) " + "VALUES (?, ?, ?, ?, ?)";

    /**
     * <p>A <code>String</code> providing the SQL statement to be used for updating records in
     * <code>tcs_dw:client_user_stats</code> database table.</p>
     */
    private static final String CLIENT_USER_STATS_UPDATE_SQL = "UPDATE client_user_stats SET client_id  = ?, "
        + "year = ?, month = ?, user_count = ? WHERE client_user_stats_id = ?";

    /**
     * <p>
     * A <code>String</code> providing the helpful SQL statement to be used for
     * selecting records from <code>tcs_dw:client_user_stats</code> database
     * table.
     * </p>
     */
    private static final String SELECT_MAX_ID = "SELECT MAX(client_user_stats_id) as max FROM client_user_stats";

    /**
     * <p>
     * A <code>String</code> providing the helpful SQL statement to be used for
     * selecting records from <code>tcs_dw:client_user_stats</code> database
     * table.
     * </p>
     */
    private static final String SELECT_USER_ID = "SELECT client_user_stats_id as id FROM client_user_stats"
        + " WHERE client_id = ? AND year = ? AND month = ?";

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
     * <p>
     * A <code>String</code> represented the most earlier time for load
     * statistics.
     * </p>
     */
    private static final String EARLIER_TIME_FOR_STATISTICS = "2001-01-01 00:00:00";

    /**
     * <p>An <code>int</code> specifying the ID for the update log for this tool.</p>
     */
    private static final int LOG_TYPE = 8;

    /**
     * <p>A <code>Timestamp</code> providing the start time of the tool.</p>
     */
    private java.sql.Timestamp fStartTime = null;

    /**
     * <p>A <code>Timestamp</code> providing the start time of the last run of the tool.</p>
     */
    private java.sql.Timestamp fLastLogTime = null;

    /**
     * <p>Constructs new <code>ClientUserStatsLoadUtility</code> instance. This implementation does nothing.</p>
     */
    public ClientUserStatsLoadUtility() {
    }

    /**
     * Runs this utility. Reads contents of SQL statements for selecting
     * transactional data from files and loads selected data into warehouse
     * database tables.
     */
    @Override
    protected void runUtility()
        throws Exception {
        log.info("Client user statistics loading has started");

        try {
            fStartTime = new java.sql.Timestamp(System.currentTimeMillis());

            getLastUpdateTime();

            ResultSet result = null;
            PreparedStatement selectStatement = null;
            PreparedStatement insertStatement = null;
            PreparedStatement updateStatement = null;
            PreparedStatement selectMaxIDStatement = null;
            PreparedStatement selectUserIDStatement = null;

            Connection sourceConn = null;
            try {
                // Retrieve all records from transactional database table
                String selectSQL = loadSQLFromFile("client_user_stats_selection_file");
                log.info("Running SQL statement: " + selectSQL);
                sourceConn = getDBConnection(TRANSACTIONAL_DATA_SOURCE);
                sourceConn.setTransactionIsolation(Connection.TRANSACTION_READ_UNCOMMITTED);

                // set select query parameters
                selectStatement = prepareStatement(selectSQL, sourceConn);
                java.sql.Date date = getStartDateRun();
                selectStatement.setDate(1, date);

                // execute select query
                selectStatement.setFetchSize(DATA_FETCH_SIZE);
                result = selectStatement.executeQuery();
                log.info("Retrieved transactional records for clients users from database");

                // Prepare the statement for inserting records
                insertStatement = prepareStatement(WAREHOUSE_DATA_SOURCE, CLIENT_USER_STATS_INSERT_SQL);

                // Prepare the statement for updating records
                updateStatement = prepareStatement(WAREHOUSE_DATA_SOURCE, CLIENT_USER_STATS_UPDATE_SQL);

                // Prepare the helpful statements for selecting records
                selectMaxIDStatement = prepareStatement(WAREHOUSE_DATA_SOURCE, SELECT_MAX_ID);
                selectUserIDStatement = prepareStatement(WAREHOUSE_DATA_SOURCE, SELECT_USER_ID);

                // Iterate over all records from transactional database and insert respective record into warehouse
                // database table
                long client_user_stats_id = getMaxClientUserStatsID(selectMaxIDStatement);
                while (result.next()) {
                    try {

                        // Get data for single statistics row
                        long clientId = result.getLong("client_id");
                        long year = result.getLong("year");
                        long month = result.getLong("month_number");
                        long userCount = result.getLong("users_number");

                        long existedID = getClientUserStatsID(selectUserIDStatement, clientId, year, month);
                        if (existedID > 0) {
                            // Update record for client user statistic at tcs_dw
                            log.info("Running SQL statement: " + CLIENT_USER_STATS_UPDATE_SQL + " with parameters:");
                            // Output data for debugging
                            StringBuilder b = new StringBuilder();
                            b.append(clientId).append(", ");
                            b.append(year).append(", ");
                            b.append(month).append(", ");
                            b.append(userCount).append(", ");
                            b.append(existedID);
                            log.info(b.toString());

                            updateStatement.setLong(1, clientId);
                            updateStatement.setLong(2, year);
                            updateStatement.setLong(3, month);
                            updateStatement.setLong(4, userCount);
                            updateStatement.setLong(5, existedID);

                            int updateRecordsCount = updateStatement.executeUpdate();
                            if (updateRecordsCount != 1) {
                                throw new SQLException("Wrong number of records updated (expected 1): "
                                    + updateRecordsCount);
                            }
                        } else {
                            // Insert record for client user statistic into tcs_dw
                            log.info("Running SQL statement: " + CLIENT_USER_STATS_INSERT_SQL + " with parameters:");

                            // increment primary key
                            client_user_stats_id++;

                            // Output data for debugging
                            StringBuilder b = new StringBuilder();
                            b.append(client_user_stats_id).append(", ");
                            b.append(clientId).append(", ");
                            b.append(year).append(", ");
                            b.append(month).append(", ");
                            b.append(userCount);
                            log.info(b.toString());

                            insertStatement.setLong(1, client_user_stats_id);
                            insertStatement.setLong(2, clientId);
                            insertStatement.setLong(3, year);
                            insertStatement.setLong(4, month);
                            insertStatement.setLong(5, userCount);

                            int insertedRecordsCount = insertStatement.executeUpdate();
                            if (insertedRecordsCount != 1) {
                                throw new SQLException(
                                    "Wrong number of records inserted (expected 1): " + insertedRecordsCount);
                            }
                        }
                    } catch (SQLException e) {
                        log.error("Failed to insert record for client users", e);
                    }
                }
            } finally {
                DBMS.close(updateStatement);
                DBMS.close(insertStatement);
                DBMS.close(selectMaxIDStatement);
                DBMS.close(selectUserIDStatement);
                DBMS.close(selectStatement, result);
                if (sourceConn != null) {
                    sourceConn.close();
                }
                log.info("Client user statistics loading has finished");
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
            log.info("Client users data loading has finished");
        }
    }

    /**
     * Returns <code>client_user_stats_id</code> value from
     * <code>tcs_dw:client_user_stats</code> table with specified
     * <code>clientId</code>, <code>year</code> and <code>month</code>.
     *
     * @param selectStatement
     *            the select statement to execute
     * @param clientId
     *            the <code>client_id</code> value from table
     * @param year
     *            the <code>year</code> value from table
     * @param month
     *            the <code>month</code> value from table
     * @return the <code>client_user_stats_id</code> value from
     *         <code>tcs_dw:client_user_stats</code> table
     * @throws SQLException
     *             if an unexpected error occurs
     */
    private long getClientUserStatsID(PreparedStatement selectStatement, long clientId, long year, long month)
        throws SQLException {
        ResultSet result = null;
        long id = -1;
        selectStatement.setLong(1, clientId);
        selectStatement.setLong(2, year);
        selectStatement.setLong(3, month);
        result = selectStatement.executeQuery();
        boolean hasRow = result.next();
        if (hasRow) {
            id = result.getLong("id");
        }
        return id;
    }

    /**
     * Returns max <code>client_user_stats_id</code> value from
     * <code>tcs_dw:client_user_stats</code> table.
     *
     * @param selectMaxIDStatement
     *            the select statement to execute
     *
     * @return the max <code>client_user_stats_id</code> value
     * @throws SQLException
     *             if an unexpected error occurs
     */
    private long getMaxClientUserStatsID(PreparedStatement selectMaxIDStatement)
        throws SQLException {
        ResultSet result = null;
        long maxId = 0;
        result = selectMaxIDStatement.executeQuery();
        result.next();
        maxId = result.getLong("max");
        return maxId;
    }

    /**
     * <p>
     * Returns date from what this utility should be run.
     * </p>
     * <p>
     * Depending on first/notFirst run this utility should be run based on
     * different time periods.
     *
     * @return the date from what this utility should be run
     */
    private java.sql.Date getStartDateRun() {
        java.sql.Timestamp lastLogTime = java.sql.Timestamp.valueOf(EARLIER_TIME_FOR_STATISTICS);
        java.sql.Date date = new java.sql.Date(lastLogTime.getTime());
        if (fLastLogTime.equals(lastLogTime)) {
            Calendar cal = Calendar.getInstance();
            cal.setTimeInMillis(System.currentTimeMillis());
            cal.set(Calendar.YEAR, cal.get(Calendar.YEAR) - 1);

            // set +1 here for avoiding run with date strictly equal to last
            // time run
            date = new java.sql.Date(cal.getTimeInMillis() + 1);
        }

        return date;
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
        sErrorMsg.append("ClientUserStatsLoadUtility:\n");
        sErrorMsg.append("   The following parameters should be included in the XML or the command line\n");
        sErrorMsg.append("   -sourcesList : Configuration for data sources referencing ");
        sErrorMsg.append("the tcs_catalog and tcs_dw databases with ");
        sErrorMsg.append("data to be loaded from and to\n");
        fatal_error();
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
                fLastLogTime = java.sql.Timestamp.valueOf(EARLIER_TIME_FOR_STATISTICS);
                log.info("Last log time not found in update_log table.");
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Failed to retrieve last log time.\n" + sqle.getMessage());
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
                throw new SQLException("SetLastUpdateTime modified " + retVal + " rows, not one.");
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Failed to set last log time.\n" + sqle.getMessage());
        } finally {
            DBMS.close(psUpd);
        }
    }

    /**
     * <p>
     * Call this method to lookup a calendar_id from the calendar table based on
     * the Timestamp passed in. This assumes that a calendar table exists in the
     * database represented by the Connection object corresponding to the
     * connection index passed in.
     * </p>
     *
     * @param date
     *            the date for lookup
     * @param db
     *            the database for <i>calendar</i> table
     * @return the <i>calendar_id</i> from <i>calendar</i> table
     * @throws SQLException
     *             if an unexpected error occurs.
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
     * <p>Loads the content of SQL statement from the specified file.</p>
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
