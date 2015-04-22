/*
 * Copyright (C) 2011 - 2015 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.utilities.dwload;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.sql.DBUtility;

/**
 * <p>
 * A DB utility which is intended to load data for JIRA Tickets from MySQL
 * database to warehouse database.
 * </p>
 *
 * <p>
 * Version 1.1: Add the loading of jira issue TCo points.
 * </p>
 *
 * <p>
 * <strong>Thread Safety: </strong> It's a data utility tool and will not run in
 * parallel.
 * </p>
 * 
 * @version 1.1 (Module Assembly - JIRA issues loading update and report creation)
 *
 * <p>
 *     Version 1.2 Release Assembly - TC Cockpit JIRA Report Update changes log:
 *     <ul>
 *         <li>Updated {@link #SQL_QUERY_JIRA} to support project level issues</li>
 *         <li>Updated {@link #SQL_INSERT_JIRA_ISSUE} to insert project_id for project level issues</li>
 *         <li>Updated {@link #loadJiraData()} to load project level issues</li>
 *     </ul>
 * </p>
 *
 *
 * <p>
 *     Version 1.3 (TopCoder Data Warehouse Loading Update 1)
 *     <ul>
 *         <li>Updated the JiraDataLoadUtility to load data
 *         for new column jira_issue:payment_status and issue_type.</li>
 *     </ul>
 * </p>
 *
 * @author Veve
 */
public class JiraDataLoadUtility extends DBUtility {

    /**
     * This field represents the qualified name of this class.
     */
    private static final String CLASS_NAME = JiraDataLoadUtility.class.getName();

    /**
     * <p>
     * Instance of {@link SimpleDateFormat} to better format time while logging.
     * </p>
     */
    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss S");

    /**
     * Represents the MySQL database driver class name.
     */
    private static final String MYSQL_DRIVER_CLASS = "com.mysql.jdbc.Driver";

    /**
     * The TCS Warehouse DB name.
     */
    private static final String TCS_DW = "tcs_dw";

    /**
     * The JIRA database connection name.
     */
    private static final String JIRA = "jira";

    /**
     * Start time stamp.
     */
    protected java.sql.Timestamp fStartTime = null;

    /**
     * Last log time stamp.
     */
    protected java.sql.Timestamp fLastLogTime = null;

    /**
     * SQL to retrieve all JIRA records.
     *
     * <p>
     * Update in version 1.1 - select TCO points from customfield 10080
     * </p>
     *
     * <p>
     * Update in version 1.2 - add join to customfield 10190 which is Cockpit Project ID
     * </p>
     *
     * <p>
     * Update in version 1.3 - add payment_status and issue_type data
     * </p>
     */
    private static final String SQL_QUERY_JIRA_FIRST = "SELECT i.pkey AS ticket_id, i.reporter, i.assignee, i.summary, "
            + "i.description, i.created, i.updated, i.duedate AS due_date, i.resolutiondate AS resolution_date, i.votes, "
            + "IFNULL(TRIM(payee.stringvalue),'N/A') AS winner, payment.numbervalue AS payment_amount, "
            + "IFNULL(payment_status.stringvalue, 'Not Paid') AS payment_status, CAST(IFNULL(tcopoints.STRINGVALUE, '0') AS SIGNED INTEGER) AS  tco_points,"
            + "CAST(contest.stringvalue AS SIGNED INTEGER) AS contest_id, contest.numbervalue as project_id, st.pname as status, payment_status.stringvalue as payment_status, i.issuetype AS issue_type "
            + "FROM jiraissue AS i "
            + "JOIN customfieldvalue contest ON contest.customfield = 10093  AND contest.issue = i.id " 
            + "and contest.ID = IF(contest.customfield=10093,(select max(id) from customfieldvalue where customfield = 10093 AND issue = i.id),"
            + "(select max(id) from customfieldvalue where customfield = 10190 AND issue = i.id)) "
			+ "JOIN issuestatus st on st.id = i.issuestatus "
            + "LEFT JOIN customfieldvalue payment ON payment.customfield = 10012 AND payment.issue = i.id "
            + "LEFT JOIN customfieldvalue payee ON payee.customfield = 10040 AND payee.issue = i.id "
            + "LEFT JOIN customfieldvalue payment_status ON payment_status.customfield = 10030 AND payment_status.issue = i.id "
            + "LEFT JOIN customfieldvalue tcopoints ON tcopoints.customfield = 10080 AND tcopoints.issue = i.id ";
			
   private static final String SQL_QUERY_JIRA_LAST = " UNION ALL "		
			+ " SELECT i.pkey AS ticket_id, i.reporter, i.assignee, i.summary, "
            + "i.description, i.created, i.updated, i.duedate AS due_date, i.resolutiondate AS resolution_date, i.votes, "
            + "IFNULL(TRIM(payee.stringvalue),'N/A') AS winner, payment.numbervalue AS payment_amount, "
            + "IFNULL(payment_status.stringvalue, 'Not Paid') AS payment_status, CAST(IFNULL(tcopoints.STRINGVALUE, '0') AS SIGNED INTEGER) AS  tco_points,"
            + "CAST(contest.stringvalue AS SIGNED INTEGER) AS contest_id, contest.numbervalue as project_id, st.pname as status, payment_status.stringvalue as payment_status, i.issuetype AS issue_type "
            + "FROM jiraissue AS i "
            + "JOIN customfieldvalue contest ON contest.customfield = 10190  AND contest.issue = i.id " 
            + "and contest.ID = IF(contest.customfield=10093,(select max(id) from customfieldvalue where customfield = 10093 AND issue = i.id),"
            + "(select max(id) from customfieldvalue where customfield = 10190 AND issue = i.id)) "
			+ "JOIN issuestatus st on st.id = i.issuestatus "
            + "LEFT JOIN customfieldvalue payment ON payment.customfield = 10012 AND payment.issue = i.id "
            + "LEFT JOIN customfieldvalue payee ON payee.customfield = 10040 AND payee.issue = i.id "
            + "LEFT JOIN customfieldvalue payment_status ON payment_status.customfield = 10030 AND payment_status.issue = i.id "
            + "LEFT JOIN customfieldvalue tcopoints ON tcopoints.customfield = 10080 AND tcopoints.issue = i.id "
            + " WHERE not exists (select * from  customfieldvalue where customfield = 10093  AND issue = i.id )	";

    /**
     * SQL to insert JIRA Tickets into tcs_dw:jira_issue.
     *
     * <p>
     * Update in version 1.2 - add column project_id into INSERT statement
     * </p>
     *
     * <p>
     * Update in version 1.3 - add columns payment_status and issue_type into INSERT statement
     * </p>
     */
    private static final String SQL_INSERT_JIRA_ISSUE = "INSERT INTO 'informix'.jira_issue(jira_issue_id, ticket_id, "
            + "reporter, assignee, summary, description, created, updated, due_date, resolution_date, votes, winner, "
            + "payment_amount, tco_points, contest_id, project_id, status, payment_status, issue_type) VALUES(jira_issue_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    /**
     * SQL to delete existing JIRA Tickets.
     */
    private static final String SQL_DELETE_EXISTING_JIRA_ISSUES = "DELETE FROM 'informix'.jira_issue ";

    /**
     * SQL to delete a single JIRA Ticket.
     */
    private static final String SQL_DELETE_SINGLE_JIRA_TICKET = "DELETE FROM 'informix'.jira_issue WHERE ticket_id = ?";

    /**
     * JIRA log type.
     */
    private static final long JIRA_LOG_TYPE = 6;

    /**
     * <p>
     * This is the main entry of this utility.
     * </p>
     */
    @Override
    protected void runUtility() throws Exception {
        final String signature = CLASS_NAME + "#runUtility()";
        logEntrance(signature);
        long start = logStart(signature);
        fStartTime = new java.sql.Timestamp(System.currentTimeMillis());
        getLastUpdateTime();
        loadJiraData();
        setLastUpdateTime();
        logEnd(signature, start);
        logExit(signature);
    }

    /**
     * <p>
     * This method would print out utility usage and potential error message.
     * </p>
     */
    @Override
    protected void setUsageError(String msg) {
        sErrorMsg.setLength(0);
        sErrorMsg.append(msg).append("\n");
        sErrorMsg.append("JiraDataLoadUtility:\n");
        sErrorMsg.append("   The following parameters should be included in the XML or the command line\n");
        sErrorMsg
                .append("   -sourcesList : Configuration for data sources referencing the bugs_oltp (MySQL) and tcs_dw databases with ");
        sErrorMsg.append("data to be loaded from and to\n");
        fatal_error();
    }

    /**
     * This method would delete all existing JIRA Tickets for case of first
     * load.
     */
    private void deleteExistingJiraTickets() {
        final String signature = CLASS_NAME + "#deleteExistingJiraTickets()";
        logEntrance(signature);
        long start = logStart(signature);
        PreparedStatement pst = null;
        try {
            log.debug("It seems this is the first time JIRA Tickets loading...\n"
                    + "All potential test data in tcs_dw:jira_issue would be deleted");
            logSQL(SQL_DELETE_EXISTING_JIRA_ISSUES);
            pst = prepareStatement(TCS_DW, SQL_DELETE_EXISTING_JIRA_ISSUES);
            pst.executeUpdate();
        } catch (SQLException e) {
            log.error(e.getMessage(), e);
            DBMS.printSqlException(true, e);
        } finally {
            DBMS.close(pst);
        }
        logEnd(signature, start);
        logExit(signature);
    }

    /**
     * This method would delete a single ticket before insertion.
     * 
     * @param ticketId
     *            the ID of the ticket to delete.
     */
    private void deleteSingleTicket(String ticketId) {
        final String signature = CLASS_NAME + "#deleteSingleTicket(String ticketId)";
        logEntrance(signature);
        
            log.info("The ID of the ticket to delete is: " + ticketId);
       
        long start = logStart(signature);
        if (null == ticketId || ticketId.trim().length() == 0) {
            log.error("Provided ticket ID is null or empty. Won't delete");
            return;
        }
        PreparedStatement pst = null;
        try {
            pst = prepareStatement(TCS_DW, SQL_DELETE_SINGLE_JIRA_TICKET);
            pst.setString(1, ticketId);
            pst.executeUpdate();
        } catch (SQLException e) {
            log.error(e.getMessage());
            DBMS.printSqlException(true, e);
        } finally {
            DBMS.close(pst);
        }
        logEnd(signature, start);
        logExit(signature);
    }

    /**
     * Load new columns (issue_type, payment_status) data for the existing jira_issue records in tcs_dw.
     *
     * @throws SQLException if any error occurs.
     * @since 1.3
     */
    private void loadNewColumnsDataFirstTime() throws SQLException {
        PreparedStatement countIssueTypeColumnPS = null;
        PreparedStatement selectExistingJiraIssueToUpdatePS = null;
        PreparedStatement selectNewColumnsDataPS = null;
        PreparedStatement updateJiraIssuePS = null;


        ResultSet rs = null;
        ResultSet newDataRS = null;

        StringBuffer query = null;
        int totalCount = 0;
        String ticketID = "";


        try {

            query = new StringBuffer(100);
            // check if there existing any records with value set for column issue_type in tcs_dw:issue_type
            query.append("SELECT count(*) from jira_issue WHERE issue_type IS NOT NULL");
            countIssueTypeColumnPS = prepareStatement(TCS_DW, query.toString());

            rs = countIssueTypeColumnPS.executeQuery();
            rs.next();

            boolean firstRun = (rs.getInt(1) == 0);

            if(firstRun) {

                log.info("Start to do the first full load of payment_status and issue_type for the existing DW jira_issue records");

                // load ticket_id for the existing jira_issue records in tcs_dw
                query.delete(0, query.length());
                query.append("SELECT ticket_id FROM jira_issue");
                selectExistingJiraIssueToUpdatePS = prepareStatement(TCS_DW, query.toString());
                rs = selectExistingJiraIssueToUpdatePS.executeQuery();

                // query to get issue type and payment status data from jiraissue in mysql db
                String selectDataSQL = "SELECT i.issuetype as issue_type, payment_status.stringvalue as payment_status FROM jiraissue AS i\n" +
                        "LEFT JOIN customfieldvalue payment_status ON payment_status.customfield = 10030 AND payment_status.issue = i.id\n" +
                        "WHERE i.pkey = ?";
                selectNewColumnsDataPS = prepareStatement(JIRA, selectDataSQL);

                // query to update the existing jira_issue records in tcs_dw
                query.delete(0, query.length());
                query.append("UPDATE jira_issue SET issue_type = ?, payment_status = ? WHERE ticket_id = ?");
                updateJiraIssuePS = prepareStatement(TCS_DW, query.toString());

                while (rs.next()) {
                    ticketID = rs.getString(1);

                    selectNewColumnsDataPS.clearParameters();
                    selectNewColumnsDataPS.setString(1, ticketID);
                    newDataRS = selectNewColumnsDataPS.executeQuery();
                    newDataRS.next();

                    updateJiraIssuePS.clearParameters();
                    updateJiraIssuePS.setString(1, newDataRS.getString("issue_type"));
                    updateJiraIssuePS.setString(2, newDataRS.getString("payment_status"));
                    updateJiraIssuePS.setString(3, ticketID);

                    int count = updateJiraIssuePS.executeUpdate();

                    if (count == 1) {
                        log.info(String.format("Update jira_ticket:%s with new columns data", ticketID));
                        totalCount++;
                    }

                }
            }

            log.info("total jira_issue records updated with issue_type and payment_status = " + totalCount);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new SQLException("Full Load of issue_type and payment_status data for existing records in 'jira_issue' table failed.\n"
                    + "ticket_id = " + ticketID + "\n" + sqle.getMessage());
        } finally {
            DBMS.close(newDataRS);
            DBMS.close(rs);
            DBMS.close(countIssueTypeColumnPS);
            DBMS.close(selectExistingJiraIssueToUpdatePS);
            DBMS.close(selectNewColumnsDataPS);
            DBMS.close(updateJiraIssuePS);
        }
    }


    /**
     * This is the method that would do the real loading work.
     *
     * <p>
     * Update in version 1.1 - insert tco points to the jira_issue int tcs_dw
     * </p>
     *
     * <p>
     * Update in version 1.3 - insert new columns (issue_type, payment_status) data for the
     * jira_issue records in tcs_dw.
     * </p>
     */
    private void loadJiraData() throws SQLException {
        final String signature = CLASS_NAME + "#loadJiraData()";
        logEntrance(signature);
        long start = logStart(signature);
        PreparedStatement mySQLPST = null;
        ResultSet rs = null;
        PreparedStatement pst = null;

        try {

            loadNewColumnsDataFirstTime();

            boolean needDeleteBeforeEachInsertion = true;
            if (null == fLastLogTime) {
                log.debug("It seems this is the first time to load JIRA, all JIRA Tickets would be loaded");
                String SQL_QUERY_JIRA = SQL_QUERY_JIRA_FIRST + SQL_QUERY_JIRA_LAST;
                logSQL(SQL_QUERY_JIRA);
                mySQLPST = prepareStatement(JIRA, SQL_QUERY_JIRA);
                deleteExistingJiraTickets();
                needDeleteBeforeEachInsertion = false;
            } else {
                log.debug("Incremental load would be performed, JIRA Tickets that updated later than " + fLastLogTime
                        + " would be loaded");
                StringBuilder sb = new StringBuilder(SQL_QUERY_JIRA_FIRST);
                sb.append("WHERE i.updated >= ?");
                sb.append(SQL_QUERY_JIRA_LAST);
                sb.append("and i.updated >= ?");
                logSQL(sb.toString());
                mySQLPST = prepareStatement(JIRA, sb.toString());
                mySQLPST.setTimestamp(1, fLastLogTime);
                mySQLPST.setTimestamp(2, fLastLogTime);
            }
            rs = mySQLPST.executeQuery();
            logSQL(SQL_INSERT_JIRA_ISSUE);
            pst = prepareStatement(TCS_DW, SQL_INSERT_JIRA_ISSUE);
            int row = 0;
            while (rs.next()) {
                row++;
                String ticketId = rs.getString("ticket_id");  

                if (needDeleteBeforeEachInsertion) {
                    deleteSingleTicket(ticketId);
                }

                pst.setString(1, ticketId);
                pst.setString(2, rs.getString("reporter"));
                pst.setString(3, rs.getString("assignee"));
                pst.setString(4, rs.getString("summary"));
                pst.setObject(5, rs.getString("description"));
                pst.setDate(6, rs.getDate("created"));
                pst.setDate(7, rs.getDate("updated"));
                pst.setDate(8, rs.getDate("due_date"));
                pst.setDate(9, rs.getDate("resolution_date"));
                pst.setInt(10, rs.getInt("votes"));
                pst.setString(11, rs.getString("winner"));
                pst.setDouble(12, rs.getDouble("payment_amount"));
                pst.setInt(13, rs.getInt("tco_points"));
                Long contest_id = rs.getLong("contest_id");
                if (!rs.wasNull() && contest_id > 0){
                    pst.setLong(14, contest_id);
                    pst.setNull(15, java.sql.Types.INTEGER);
                }else{
                    pst.setNull(14, java.sql.Types.INTEGER);
                    pst.setLong(15, rs.getLong("project_id"));
                }
                pst.setString(16, rs.getString("status"));
                pst.setString(17, rs.getString("payment_status"));
                pst.setString(18, rs.getString("issue_type"));
                pst.executeUpdate();
            }
            log.debug(row + " row(s) loaded into tcs_dw:jira_issue");
        } catch (SQLException e) {
            log.error(e.getMessage(), e);
            DBMS.printSqlException(true, e);
            throw e;
        } finally {
            DBMS.close(rs);
            DBMS.close(mySQLPST);
            DBMS.close(pst);
        }
        logEnd(signature, start);
        logExit(signature);
    }

    /**
     * <p>
     * This method would log the entrance of a method.
     * </p>
     * 
     * @param signature
     *            method signature
     */
    private void logEntrance(String signature) {
        log.info("Enter " + signature);
    }

    /**
     * <p>
     * This method would log the exit of a method.
     * </p>
     * 
     * @param signature
     * @param ret
     *            Return value of the method.
     */
    private void logExit(String signature) {
        log.info("Exit " + signature);
    }

    /**
     * <p>
     * This method would log down SQL statements executed/will be executed.
     * </p>
     * 
     * @param sql
     *            The SQL statement.
     */
    private void logSQL(String sql) {
      
            log.info("Executing: " + sql);
       
    }

    /**
     * <p>
     * This method would log down the start time in milliseconds.
     * </p>
     * 
     * @param signature
     *            Signature of the method.
     * @return time in milliseconds.
     */
    private long logStart(String signature) {
        final long start = System.currentTimeMillis();

       
            log.info(signature + " starts at: " + DATE_FORMAT.format(new Date(start)));
        

        return start;
    }

    /**
     * <p>
     * This method would log down the ending time of the execution, as well as
     * rough cost time.
     * </p>
     * 
     * @param signature
     *            method signature.
     * @param start
     *            The start of the execution.
     */
    private void logEnd(String signature, long start) {
        final long end = System.currentTimeMillis();
        
            log.info(signature + " ends at: " + DATE_FORMAT.format(new Date(end)) + ".\n It approximately costs "
                    + (end - start) + " ms");
        
    }

    /**
     * This method retrieves the last update time.
     * 
     * @throws Exception
     *             If there is any error.
     */
    protected void getLastUpdateTime() throws Exception {
        PreparedStatement pst = null;
        ResultSet rs = null;
        StringBuffer query = new StringBuffer(100);
        query.append("SELECT timestamp AS last_update_time FROM update_log WHERE log_id = ").append(
                "(SELECT MAX(log_id) FROM update_log WHERE log_type_id = " + JIRA_LOG_TYPE + ")");

        try {
            logSQL(query.toString());
            pst = prepareStatement(TCS_DW, query.toString());
            rs = pst.executeQuery();
            if (rs.next()) {
                fLastLogTime = rs.getTimestamp("last_update_time");
                log.info("Date is " + fLastLogTime.toString());
            } else {
                log.debug("Last log time not found in update_log table.");
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Failed to retrieve last log time.\n" + sqle.getMessage());
        } finally {
            DBMS.close(rs);
            DBMS.close(pst);
        }
    }

    /**
     * This method would update the last update log.
     * 
     * @throws Exception
     *             if there is any error.
     */
    private void setLastUpdateTime() throws Exception {
        PreparedStatement psUpd = null;
        StringBuffer query = new StringBuffer(100);
        try {
            int retVal;
            query.append("INSERT INTO update_log ");
            query.append("      (log_id "); // 1
            query.append("       ,calendar_id "); // 2
            query.append("       ,timestamp "); // 3
            query.append("       ,log_type_id) "); // 4
            query.append("VALUES (0, ?, ?, ").append(JIRA_LOG_TYPE).append(")");
            logSQL(query.toString());
            psUpd = prepareStatement(TCS_DW, query.toString());

            int calendar_id = lookupCalendarId(fStartTime);
            psUpd.setInt(1, calendar_id);
            psUpd.setTimestamp(2, fStartTime);

            retVal = psUpd.executeUpdate();
            if (retVal != 1) {
                throw new SQLException("SetLastUpdateTime " + " modified " + retVal + " rows, not one.");
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Failed to set last log time.\n" + sqle.getMessage());
        } finally {
            DBMS.close(psUpd);
        }
    }

    /**
     * Call this method to lookup a calendar_id from the calendar table based on
     * the Time-stamp passed in. This assumes that a calendar table exists in
     * the database represented by the Connection object corresponding to the
     * connection index passed in.
     * 
     * @param date
     *            The {@link Date} to query.
     * @return the calendar ID; 0 if not found.
     */
    protected int lookupCalendarId(java.sql.Timestamp date) throws SQLException {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        StringBuffer query = new StringBuffer(100);

        int year = cal.get(Calendar.YEAR);

        // The month is based on 0 for January so we need to add 1 to get
        // the right lookup value
        int month_of_year = cal.get(Calendar.MONTH) + 1;

        int day_of_month = cal.get(Calendar.DAY_OF_MONTH);

        PreparedStatement psSel = null;
        ResultSet rs = null;

        query.append("SELECT calendar_id ");
        query.append("  FROM calendar ");
        query.append(" WHERE year = ? ");
        query.append("   AND month_numeric = ? ");
        query.append("   AND day_of_month = ? ");

        logSQL(query.toString());
        psSel = prepareStatement(TCS_DW, query.toString());

        psSel.setInt(1, year);
        psSel.setInt(2, month_of_year);
        psSel.setInt(3, day_of_month);

        try {
            rs = psSel.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            } else {
                throw new SQLException("Calendar id cannot be found.");
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw sqle;
        } finally {
            DBMS.close(rs);
            DBMS.close(psSel);
        }
    }

    /**
     * <p>
     * Checks whether the database drivers are available. It invokes the same
     * method in parent class to check Informix database driver and itself
     * checks MySQL database driver.
     * </p>
     */
    @Override
    protected void checkDriver() {
        super.checkDriver();

        try {
            Class.forName(MYSQL_DRIVER_CLASS);
        } catch (Exception ex) {
            sErrorMsg.setLength(0);
            sErrorMsg.append("Unable to load driver ");
            sErrorMsg.append(MYSQL_DRIVER_CLASS);
            sErrorMsg.append(". Cannot continue.");
            fatal_error();
        }
    }

}
