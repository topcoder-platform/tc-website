package com.topcoder.shared.ejb.EmailServices;

import com.topcoder.shared.ejb.BaseEJB;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;

import java.rmi.RemoteException;
import java.util.*;

/**
 *
 * @author   Eric Ellingson
 * @version  $Revision$
 * @see    EmailJob
 */
public class EmailJobBean extends BaseEJB {

    // TODO the following need to come from the config file, not hardcoded!
    /**
     *
     */
    public static final int JOB_TYPE_EMAIL_PRE = 1;
    /**
     *
     */
    public static final int JOB_TYPE_EMAIL_POST = 2;
    /**
     *
     */
    public static final int JOB_TYPE_EMAIL_REPORT = 3;
    /**
     *
     */
    public static final int JOB_STATUS_CREATING = 0;
    /**
     *
     */
    public static final int JOB_STATUS_READY = 1;
    /**
     *
     */
    public static final int JOB_STATUS_ACTIVE = 2;
    /**
     *
     */
    public static final int JOB_STATUS_COMPLETE = 3;
    /**
     *
     */
    public static final int JOB_STATUS_INCOMPLETE = 4;
    /**
     *
     */
    public static final int JOB_STATUS_CANCELED = 5;
    /**
     *
     */
    public static final int JOB_SEQUENCE_ID = 70;
    /**
     *
     */
    public static final int JOB_DETAIL_SEQUENCE_ID = 71;
    /**
     *
     */
    public static final int EMAIL_TEMPLATE_SEQUENCE_ID = 72;
    /**
     *
     */
    public static final int EMAIL_LIST_SEQUENCE_ID = 73;

    /**
     *
     */
    public void ejbCreate() {
    }

    private static Logger log = Logger.getLogger(EmailJobBean.class);


    /**
     *
     * @param templateId
     * @param listId
     * @param commandId
     * @param startAfter
     * @param stopBefore
     * @param fromAddress
     * @param fromPersonal
     * @param subject
     * @return
     * @throws RemoteException
     */
    public int createEmailJob(int templateId,
                              int listId,
                              int commandId,
                              Date startAfter,
                              Date stopBefore,
                              String fromAddress,
                              String fromPersonal,
                              String subject) throws RemoteException {
        return createJob(templateId, listId, commandId, startAfter, stopBefore, fromAddress, fromPersonal, subject, JOB_TYPE_EMAIL_PRE);
    }

    /**
     *
     * @param templateId
     * @param listId
     * @param commandId
     * @param startAfter
     * @param stopBefore
     * @param fromAddress
     * @param fromPersonal
     * @param subject
     * @param jobType
     * @return
     * @throws RemoteException
     */
    public int createJob(int templateId,
                         int listId,
                         int commandId,
                         Date startAfter,
                         Date stopBefore,
                         String fromAddress,
                         String fromPersonal,
                         String subject,
                         int jobType) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps1 = null;
        java.sql.PreparedStatement ps2 = null;
        java.sql.PreparedStatement ps3 = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int jobId = 0;
        int rowsAdded;
        int rowsUpdated;

        log.debug("New email job requested (template_id " + templateId
                + ", list_id " + listId + ", command_id " + commandId
                + ", start " + startAfter + ", stop " + stopBefore
                + ", from " + fromAddress + " (" + fromPersonal + ")"
                + ", subject " + subject + ")");

        /*
         * open a connection to the database
         * prepare the 3 sql statements
         * ps1 is the statement to find the next jobId to use
         * ps2 is the statement to insert a record into the sched_job table
         * ps3 is the statement to insert a record into sched_email_job table
         * after the statements are prepared, execute them in order
         * first find the next jobId
         * second fill in the blanks (including the jobId) and insert
         * the sched_job record
         * third fill in the balnks and insert the sched_email_job record
         * any problems with the process result in an exception that is
         * caught and a RemoteException is prepared
         * the database connection is always closed and then any errors
         * are rethrown (repackaged in a RemoteException)
         *
         * There is an issue with timing of the ps1 and ps2 statements
         * If multiple processes attempt to insert records and both
         * processes calculate their jobId before either inserts the
         * new job record, they will both attempt to insert the same
         * jobId. The database will cause one of the two inserts to fail.
         * For the email project, this is not going to be a problem as
         * it is not going to happen that two people will simultaneously
         * add jobs. However, even in the unlikely case that they do, the
         * failed result will get returned to one of the users and they
         * can retry.
         */
        try {
            conn = DBMS.getConnection("TC_EMAIL_JTS");
            conn.setAutoCommit(false);

            // create ps1
            sqlStmt.setLength(0);
            sqlStmt.append(" EXECUTE PROCEDURE nextval(?)");
            ps1 = conn.prepareStatement(sqlStmt.toString());
            ps1.setInt(1, JOB_SEQUENCE_ID);

            // create ps2
            sqlStmt.setLength(0);
            sqlStmt.append(" INSERT INTO");
            sqlStmt.append(" sched_job (");
            sqlStmt.append(" sched_job_id");
            sqlStmt.append(",");
            sqlStmt.append(" sched_job_type_id");
            sqlStmt.append(",");
            sqlStmt.append(" sched_job_status_id");
            sqlStmt.append(",");
            sqlStmt.append(" start_after_date");
            sqlStmt.append(",");
            sqlStmt.append(" end_before_date");
            sqlStmt.append(") VALUES (?,?,?,?,?)");
            ps2 = conn.prepareStatement(sqlStmt.toString());

            // create ps3
            sqlStmt.setLength(0);
            sqlStmt.append(" INSERT INTO");
            sqlStmt.append(" sched_email_job (");
            sqlStmt.append(" sched_email_job_id");
            sqlStmt.append(",");
            sqlStmt.append(" email_template_id");
            sqlStmt.append(",");
            sqlStmt.append(" email_list_id");
            sqlStmt.append(",");
            sqlStmt.append(" command_id");
            sqlStmt.append(",");
            sqlStmt.append(" from_address");
            sqlStmt.append(",");
            sqlStmt.append(" from_personal");
            sqlStmt.append(",");
            sqlStmt.append(" subject");
            sqlStmt.append(") VALUES (?,?,?,?,?,?,?)");
            ps3 = conn.prepareStatement(sqlStmt.toString());

            // run ps1
            rs = ps1.executeQuery();
            rs.next();
            jobId = rs.getInt(1);
            rs.close();
            conn.commit();

            // run ps2
            ps2.setInt(1, jobId);
            ps2.setInt(2, jobType);
            ps2.setInt(3, JOB_STATUS_CREATING);
            ps2.setTimestamp(4, new java.sql.Timestamp(startAfter.getTime()));
            ps2.setTimestamp(5, new java.sql.Timestamp(stopBefore.getTime()));
            rowsAdded = ps2.executeUpdate();
            if (rowsAdded != 1) {
                conn.rollback();
                throw new Exception("insert sched_job record failed ("
                        + rowsAdded + " rows added)");
            }

            // run ps3
            ps3.setInt(1, jobId);
            ps3.setInt(2, templateId);
            ps3.setInt(3, listId);
            ps3.setInt(4, commandId);
            ps3.setString(5, fromAddress);
            ps3.setString(6, fromPersonal);
            ps3.setString(7, subject);
            rowsAdded = ps3.executeUpdate();
            if (rowsAdded != 1) {
                conn.rollback();
                throw new Exception("insert sched_email_job record failed ("
                        + rowsAdded + " rows added)");
            }

            // create ps2 (reuse ps2)
            sqlStmt.setLength(0);
            sqlStmt.append(" UPDATE");
            sqlStmt.append(" sched_job");
            sqlStmt.append(" SET");
            sqlStmt.append(" sched_job_status_id = ?");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" sched_job_id = ?");
            ps2 = conn.prepareStatement(sqlStmt.toString());
            ps2.setInt(1, JOB_STATUS_READY);
            ps2.setInt(2, jobId);
            rowsUpdated = ps2.executeUpdate();
            if (rowsUpdated != 1) {
                conn.rollback();
                throw new Exception("update of sched_job record failed ("
                        + rowsUpdated + " rows updated)");
            }
            conn.commit();
        } catch (Exception dberr) {
            log.error("Failed to create email job", dberr);
            throw new RemoteException("Failed to create email job", dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            try { if (ps1 != null) ps1.close(); } catch (Exception ignore) { log.error("prepared statement close problem", ignore); }
            try { if (ps2 != null) ps2.close(); } catch (Exception ignore) { log.error("prepared statement close problem", ignore); }
            try { if (ps3 != null) ps3.close(); } catch (Exception ignore) { log.error("prepared statement close problem", ignore); }
            try { if (conn != null) conn.close(); } catch (Exception ignore) { log.error("connection close problem", ignore); }
            try { if (ctx != null) ctx.close(); } catch (Exception ignore) { log.error("contet close problem", ignore); }
            ps1 = null;
            ps2 = null;
            ps3 = null;
            conn = null;
            ctx = null;
        }
        return jobId;
    }

    /**
     *
     * @param sourceJobId
     * @param templateId
     * @param listId
     * @param commandId
     * @param startAfter
     * @param stopBefore
     * @param fromAddress
     * @param fromPersonal
     * @param subject
     * @return
     * @throws RemoteException
     */
    public int createEmailReportJob(
            int sourceJobId,
            int templateId,
            int listId,
            int commandId,
            Date startAfter,
            Date stopBefore,
            String fromAddress,
            String fromPersonal,
            String subject) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;
        int id = 0;

        log.debug("createEmailReportJob(" + sourceJobId + ", ...)");

        int jobId = createJob(templateId, listId, commandId,
                startAfter, stopBefore, fromAddress,
                fromPersonal, subject, JOB_TYPE_EMAIL_REPORT);

        try {
            conn = DBMS.getConnection("TC_EMAIL");

            sqlStmt.setLength(0);
            sqlStmt.append(" EXECUTE PROCEDURE nextval(?)");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, EmailJobBean.JOB_DETAIL_SEQUENCE_ID);
            rs = ps.executeQuery();
            rs.next();
            id = rs.getInt(1);
            rs.close();
            String data = "" + sourceJobId;

            sqlStmt.setLength(0);
            sqlStmt.append(" INSERT INTO");
            sqlStmt.append(" sched_job_detail (");
            sqlStmt.append(" sched_job_id");
            sqlStmt.append(",");
            sqlStmt.append(" sched_job_detail_id");
            sqlStmt.append(",");
            sqlStmt.append(" sched_job_detail_status_id");
            sqlStmt.append(",");
            sqlStmt.append(" data");
            sqlStmt.append(") VALUES (?,?,?,?)");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, jobId);
            ps.setInt(2, id);
            ps.setInt(3, EmailServer.MSG_NONE);
            ps.setBytes(4, data.getBytes());
            rows = ps.executeUpdate();
            if (rows != 1) {
                throw new Exception("insert command affected " + rows + " rows.");
            }
        } catch (Exception dberr) {
            String err = "Failed to add job detail record";
            log.error(err, dberr);
            throw new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            try { if (rs != null) rs.close(); } catch (Exception ignore) { log.error("resultset close problem", ignore); }
            try { if (ps != null) ps.close(); } catch (Exception ignore) { log.error("prepared statement close problem", ignore); }
            try { if (conn != null) conn.close(); } catch (Exception ignore) { log.error("connection close problem", ignore); }
            try { if (ctx != null) ctx.close(); } catch (Exception ignore) { log.error("contet close problem", ignore); }
            rs = null;
            ps = null;
            conn = null;
            ctx = null;
        }

        return jobId;
    }

    /**
     *
     * @param jobId
     * @throws RemoteException
     */
    public void cancelEmailJob(int jobId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rowsUpdated;

        log.debug("Cancel email job requested (job_id " + jobId + ")");

        /*
         * Change the job's status to canceled if the current status
         * is ACTIVE or READY.
         */
        try {
            conn = DBMS.getConnection("TC_EMAIL");

            // create ps
            sqlStmt.setLength(0);
            sqlStmt.append(" UPDATE");
            sqlStmt.append(" sched_job");
            sqlStmt.append(" SET");
            sqlStmt.append(" sched_job_status_id = ?");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" sched_job_id = ?");
            sqlStmt.append(" AND");
            sqlStmt.append(" (sched_job_status_id = ?");
            sqlStmt.append(" OR");
            sqlStmt.append(" sched_job_status_id = ?)");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, JOB_STATUS_CANCELED);
            ps.setInt(2, jobId);
            ps.setInt(3, JOB_STATUS_READY);
            ps.setInt(4, JOB_STATUS_ACTIVE);
            rowsUpdated = ps.executeUpdate();
            if (rowsUpdated == 0) {
                log.debug("Cancel request for job_id " + jobId
                        + " had no effect."
                        + " Either the job is not ready or active,"
                        + " or the job does not exist.");
            } else {
                if (rowsUpdated != 1) {
                    log.warn("Cancel request did not update just a single"
                            + " record (job_id " + jobId + " " + rowsUpdated
                            + " records updated).");
                }
            }
        } catch (Exception dberr) {
            log.error("Failed to cancel email job", dberr);
            throw new RemoteException("Failed to cancel email job", dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            try { if (rs != null) rs.close(); } catch (Exception ignore) { log.error("resultset close problem", ignore); }
            try { if (ps != null) ps.close(); } catch (Exception ignore) { log.error("prepared statement close problem", ignore); }
            try { if (conn != null) conn.close(); } catch (Exception ignore) { log.error("connection close problem", ignore); }
            try { if (ctx != null) ctx.close(); } catch (Exception ignore) { log.error("contet close problem", ignore); }
            rs = null;
            ps = null;
            conn = null;
            ctx = null;
        }
    }

    /**
     *
     * @param jobId
     * @throws RemoteException
     */
    public void resumeEmailJob(int jobId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rowsUpdated;

        log.debug("Resume email job requested (job_id " + jobId + ")");

        /*
         * Change the job's status to READY if the current status
         * is CANCELED.
         */
        try {
            conn = DBMS.getConnection("TC_EMAIL");

            // create ps
            sqlStmt.setLength(0);
            sqlStmt.append(" UPDATE");
            sqlStmt.append(" sched_job");
            sqlStmt.append(" SET");
            sqlStmt.append(" sched_job_status_id = ?");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" sched_job_id = ?");
            sqlStmt.append(" AND");
            sqlStmt.append(" sched_job_status_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, JOB_STATUS_READY);
            ps.setInt(2, jobId);
            ps.setInt(3, JOB_STATUS_CANCELED);
            rowsUpdated = ps.executeUpdate();
            if (rowsUpdated == 0) {
                log.debug("Resume request for job_id " + jobId
                        + " had no effect."
                        + " Either the job has not been canceled,"
                        + " or the job does not exist.");
            } else {
                if (rowsUpdated != 1) {
                    log.warn("Resume request did not update just a single"
                            + " record (job_id " + jobId + ", " + rowsUpdated
                            + " records updated).");
                }
            }
        } catch (Exception dberr) {
            log.error("Failed to resume email job", dberr);
            throw new RemoteException("Failed to resume email job", dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            try { if (rs != null) rs.close(); } catch (Exception ignore) { log.error("resultset close problem", ignore); }
            try { if (ps != null) ps.close(); } catch (Exception ignore) { log.error("prepared statement close problem", ignore); }
            try { if (conn != null) conn.close(); } catch (Exception ignore) { log.error("connection close problem", ignore); }
            try { if (ctx != null) ctx.close(); } catch (Exception ignore) { log.error("contet close problem", ignore); }
            rs = null;
            ps = null;
            conn = null;
            ctx = null;
        }
    }

    /**
     *
     * @param jobId
     * @return
     * @throws RemoteException
     */
    public int getJobTypeId(int jobId) throws RemoteException {
        return getIntField(jobId, "sched_job_type_id");
    }

    /**
     *
     * @param jobId
     * @return
     * @throws RemoteException
     */
    public String getJobTypeText(int jobId) throws RemoteException {
        return getJobTypeIdText(getJobTypeId(jobId));
    }

    /**
     *
     * @param typeId
     * @return
     * @throws RemoteException
     */
    public String getJobTypeIdText(int typeId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;
        String ret = null;

        log.debug("getJobTypeIdText requested for typeId " + typeId);

        try {
            conn = DBMS.getConnection("TC_EMAIL");

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT");
            sqlStmt.append(" job_type_name");
            sqlStmt.append(" FROM");
            sqlStmt.append(" sched_job_type_lu");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" sched_job_type_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, typeId);
            rs = ps.executeQuery();
            if (!rs.next()) {
                throw new Exception("No records returned");
            }
            ret = rs.getString(1);
            rs.close();
        } catch (Exception dberr) {
            String err = "Failed to get name for typeId " + typeId;
            log.error(err, dberr);
            throw new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            try { if (rs != null) rs.close(); } catch (Exception ignore) { log.error("resultset close problem", ignore); }
            try { if (ps != null) ps.close(); } catch (Exception ignore) { log.error("prepared statement close problem", ignore); }
            try { if (conn != null) conn.close(); } catch (Exception ignore) { log.error("connection close problem", ignore); }
            try { if (ctx != null) ctx.close(); } catch (Exception ignore) { log.error("contet close problem", ignore); }
            rs = null;
            ps = null;
            conn = null;
            ctx = null;
        }

        return ret;
    }

    /**
     *
     * @param jobId
     * @return
     * @throws RemoteException
     */
    public int getStatusId(int jobId) throws RemoteException {
        return getIntField(jobId, "sched_job_status_id");
    }

    /**
     *
     * @param jobId
     * @return
     * @throws RemoteException
     */
    public String getStatusText(int jobId) throws RemoteException {
        return getStatusIdText(getStatusId(jobId));
    }

    /**
     *
     * @param statusId
     * @return
     * @throws RemoteException
     */
    public String getStatusIdText(int statusId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;
        String ret = null;

        log.debug("getStatusIdText requested for statusId " + statusId);

        try {
            conn = DBMS.getConnection("TC_EMAIL");

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT ");
            sqlStmt.append("sched_job_status_name");
            sqlStmt.append(" FROM");
            sqlStmt.append(" sched_job_status_lu");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" sched_job_status_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, statusId);
            rs = ps.executeQuery();
            if (!rs.next()) {
                throw new Exception("No records returned");
            }
            ret = rs.getString(1);
            rs.close();
        } catch (Exception dberr) {
            String err = "Failed to get data for statusId " + statusId;
            log.error(err, dberr);
            throw new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            try { if (rs != null) rs.close(); } catch (Exception ignore) { log.error("resultset close problem", ignore); }
            try { if (ps != null) ps.close(); } catch (Exception ignore) { log.error("prepared statement close problem", ignore); }
            try { if (conn != null) conn.close(); } catch (Exception ignore) { log.error("connection close problem", ignore); }
            try { if (ctx != null) ctx.close(); } catch (Exception ignore) { log.error("contet close problem", ignore); }
            rs = null;
            ps = null;
            conn = null;
            ctx = null;
        }

        return ret;
    }

    /**
     *
     * @param jobId
     * @return
     * @throws RemoteException
     */
    public Map getJobDetailResults(int jobId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;
        Map ret = new HashMap();

        log.debug("getJobDetailResults requested for jobId " + jobId);

        try {
            conn = DBMS.getConnection("TC_EMAIL");

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT");
            sqlStmt.append(" sched_job_detail_id");
            sqlStmt.append(",");
            sqlStmt.append(" sched_job_detail_status_id");
            sqlStmt.append(" FROM");
            sqlStmt.append(" sched_job_detail");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" sched_job_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, jobId);
            rs = ps.executeQuery();
            for (; rs.next();) {
                ret.put(new Integer(rs.getInt(1)), new Integer(rs.getInt(2)));
            }
            rs.close();

            if (ret.size() == 0) {
                // maybe the job has been archived, check there...
                sqlStmt.setLength(0);
                sqlStmt.append(" SELECT");
                sqlStmt.append(" sched_job_detail_id");
                sqlStmt.append(",");
                sqlStmt.append(" sched_job_detail_status_id");
                sqlStmt.append(" FROM");
                sqlStmt.append(" archive_sched_job_detail");
                sqlStmt.append(" WHERE");
                sqlStmt.append(" sched_job_id = ?");
                ps = conn.prepareStatement(sqlStmt.toString());
                ps.setInt(1, jobId);
                rs = ps.executeQuery();
                for (; rs.next();) {
                    ret.put(new Integer(rs.getInt(1)), new Integer(rs.getInt(2)));
                }
                rs.close();
            }
        } catch (Exception dberr) {
            String err = "Failed to getJobDetailResults for jobId " + jobId;
            log.error(err, dberr);
            throw new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            try { if (rs != null) rs.close(); } catch (Exception ignore) { log.error("resultset close problem", ignore); }
            try { if (ps != null) ps.close(); } catch (Exception ignore) { log.error("prepared statement close problem", ignore); }
            try { if (conn != null) conn.close(); } catch (Exception ignore) { log.error("connection close problem", ignore); }
            try { if (ctx != null) ctx.close(); } catch (Exception ignore) { log.error("contet close problem", ignore); }
            rs = null;
            ps = null;
            conn = null;
            ctx = null;
        }

        return ret;
    }

    /**
     *
     * @param jobId
     * @param firstRecordOffset
     * @param lastRecordOffset
     * @return
     * @throws RemoteException
     */
    public Object[] getJobDetailResults(int jobId, int firstRecordOffset, int lastRecordOffset) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;
        Object[] arrRet = new Object[3];
        Map ret = new HashMap();
        arrRet[0] = ret;
        arrRet[1] = new Integer(0);
        arrRet[2] = new Integer(0);

        log.debug("getJobDetailResults requested for jobId " + jobId
                + " range (" + firstRecordOffset + "," + lastRecordOffset + ")");

        try {
            conn = DBMS.getConnection("TC_EMAIL");

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT");
            sqlStmt.append(" sched_job_detail_id");
            sqlStmt.append(",");
            sqlStmt.append(" sched_job_detail_status_id");
            sqlStmt.append(" FROM");
            sqlStmt.append(" sched_job_detail");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" sched_job_id = ?");
            sqlStmt.append(" ORDER BY");
            sqlStmt.append(" sched_job_detail_id");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, jobId);
            rs = ps.executeQuery();
            int count = 0;
            for (; rs.next(); count++) {
                if (count < firstRecordOffset) {
                    if (count == 0) arrRet[1] = new Integer(1);
                } else if (count <= lastRecordOffset) {
                    ret.put(new Integer(rs.getInt(1)), new Integer(rs.getInt(2)));
                } else {
                    // there are more results, but we don't need them right now.
                    arrRet[2] = new Integer(1);
                    break;
                }
            }
            rs.close();

            if (count == 0) {
                // maybe the job has been archived, check there...
                sqlStmt.setLength(0);
                sqlStmt.append(" SELECT");
                sqlStmt.append(" sched_job_detail_id");
                sqlStmt.append(",");
                sqlStmt.append(" sched_job_detail_status_id");
                sqlStmt.append(" FROM");
                sqlStmt.append(" archive_sched_job_detail");
                sqlStmt.append(" WHERE");
                sqlStmt.append(" sched_job_id = ?");
                sqlStmt.append(" ORDER BY");
                sqlStmt.append(" sched_job_detail_id");
                ps = conn.prepareStatement(sqlStmt.toString());
                ps.setInt(1, jobId);
                rs = ps.executeQuery();
                for (; rs.next(); count++) {
                    if (count < firstRecordOffset) {
                        if (count == 0) arrRet[1] = new Integer(1);
                    } else if (count <= lastRecordOffset) {
                        ret.put(new Integer(rs.getInt(1)), new Integer(rs.getInt(2)));
                    } else {
                        // there are more results, but we don't need them right now.
                        arrRet[2] = new Integer(1);
                        break;
                    }
                }
                rs.close();
            }
        } catch (Exception dberr) {
            String err = "Failed to getJobDetailResults for jobId " + jobId
                    + " range (" + firstRecordOffset + "," + lastRecordOffset + ")";
            log.error(err, dberr);
            throw new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            try { if (rs != null) rs.close(); } catch (Exception ignore) { log.error("resultset close problem", ignore); }
            try { if (ps != null) ps.close(); } catch (Exception ignore) { log.error("prepared statement close problem", ignore); }
            try { if (conn != null) conn.close(); } catch (Exception ignore) { log.error("connection close problem", ignore); }
            try { if (ctx != null) ctx.close(); } catch (Exception ignore) { log.error("contet close problem", ignore); }
            rs = null;
            ps = null;
            conn = null;
            ctx = null;
        }

        return arrRet;
    }

    /**
     *
     * @param jobId
     * @param jobDetailId
     * @return
     * @throws RemoteException
     */
    public String getJobDetailReason(int jobId, int jobDetailId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;
        String ret = null;

        log.debug("getJobDetailReason requested for jobId " + jobId + ", jobDetailId " + jobDetailId);

        try {
            conn = DBMS.getConnection("TC_EMAIL");

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT");
            sqlStmt.append(" reason");
            sqlStmt.append(" FROM");
            sqlStmt.append(" sched_job_detail");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" sched_job_id = ?");
            sqlStmt.append(" AND");
            sqlStmt.append(" sched_job_detail_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, jobId);
            ps.setInt(2, jobDetailId);
            rs = ps.executeQuery();
            if (!rs.next()) {
                // maybe the job has been archived, check there...
                rs.close();
                sqlStmt.setLength(0);
                sqlStmt.append(" SELECT");
                sqlStmt.append(" reason");
                sqlStmt.append(" FROM");
                sqlStmt.append(" archive_sched_job_detail");
                sqlStmt.append(" WHERE");
                sqlStmt.append(" sched_job_id = ?");
                sqlStmt.append(" AND");
                sqlStmt.append(" sched_job_detail_id = ?");
                ps = conn.prepareStatement(sqlStmt.toString());
                ps.setInt(1, jobId);
                ps.setInt(2, jobDetailId);
                rs = ps.executeQuery();
                if (!rs.next()) {
                    throw new Exception("No records returned");
                }
            }
            ret = rs.getString(1);
            rs.close();
        } catch (Exception dberr) {
            String err = "Failed to get data for job " + jobId;
            log.error(err, dberr);
            throw  new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            try { if (rs != null) rs.close(); } catch (Exception ignore) { log.error("resultset close problem", ignore); }
            try { if (ps != null) ps.close(); } catch (Exception ignore) { log.error("prepared statement close problem", ignore); }
            try { if (conn != null) conn.close(); } catch (Exception ignore) { log.error("connection close problem", ignore); }
            try { if (ctx != null) ctx.close(); } catch (Exception ignore) { log.error("contet close problem", ignore); }
            rs = null;
            ps = null;
            conn = null;
            ctx = null;
        }

        return ret;
    }

    /**
     *
     * @param jobId
     * @param jobDetailId
     * @return
     * @throws RemoteException
     */
    public String getJobDetailData(int jobId, int jobDetailId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;
        String ret = null;

        log.debug("getJobDetailData requested for jobId " + jobId + ", jobDetailId " + jobDetailId);

        try {
            conn = DBMS.getConnection("TC_EMAIL");

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT");
            sqlStmt.append(" data");
            sqlStmt.append(" FROM");
            sqlStmt.append(" sched_job_detail");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" sched_job_id = ?");
            sqlStmt.append(" AND");
            sqlStmt.append(" sched_job_detail_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, jobId);
            ps.setInt(2, jobDetailId);
            rs = ps.executeQuery();
            if (!rs.next()) {
                // didn't find it, maybe it has been archived.
                rs.close();
                sqlStmt.setLength(0);
                sqlStmt.append(" SELECT");
                sqlStmt.append(" data");
                sqlStmt.append(" FROM");
                sqlStmt.append(" archive_sched_job_detail");
                sqlStmt.append(" WHERE");
                sqlStmt.append(" sched_job_id = ?");
                sqlStmt.append(" AND");
                sqlStmt.append(" sched_job_detail_id = ?");
                ps = conn.prepareStatement(sqlStmt.toString());
                ps.setInt(1, jobId);
                ps.setInt(2, jobDetailId);
                rs = ps.executeQuery();
                if (!rs.next()) {
                    throw new Exception("No records returned");
                }
            }
            byte[] bytes = rs.getBytes(1);
            if (bytes != null)
                ret = new String(bytes);
            rs.close();
        } catch (Exception dberr) {
            String err = "Failed to get data for job " + jobId;
            log.error(err, dberr);
            throw  new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            try { if (rs != null) rs.close(); } catch (Exception ignore) { log.error("resultset close problem", ignore); }
            try { if (ps != null) ps.close(); } catch (Exception ignore) { log.error("prepared statement close problem", ignore); }
            try { if (conn != null) conn.close(); } catch (Exception ignore) { log.error("connection close problem", ignore); }
            try { if (ctx != null) ctx.close(); } catch (Exception ignore) { log.error("contet close problem", ignore); }
            rs = null;
            ps = null;
            conn = null;
            ctx = null;
        }

        return ret;
    }

    /**
     *
     * @param jobId
     * @return
     * @throws RemoteException
     */
    public boolean isJobDetailArchived(int jobId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;
        boolean ret = false;

        log.debug("isJobDetailArchived requested for jobId " + jobId);

        try {
            conn = DBMS.getConnection("TC_EMAIL");

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT");
            sqlStmt.append(" count(*)");
            sqlStmt.append(" FROM");
            sqlStmt.append(" archive_sched_job_detail");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" sched_job_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, jobId);
            rs = ps.executeQuery();
            rs.next();
            int count = rs.getInt(1);
            rs.close();
            if (count > 0) ret = true;
        } catch (Exception dberr) {
            String err = "Failed to get archive count for job " + jobId;
            log.error(err, dberr);
            throw  new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            try { if (rs != null) rs.close(); } catch (Exception ignore) { log.error("resultset close problem", ignore); }
            try { if (ps != null) ps.close(); } catch (Exception ignore) { log.error("prepared statement close problem", ignore); }
            try { if (conn != null) conn.close(); } catch (Exception ignore) { log.error("connection close problem", ignore); }
            try { if (ctx != null) ctx.close(); } catch (Exception ignore) { log.error("contet close problem", ignore); }
            rs = null;
            ps = null;
            conn = null;
            ctx = null;
        }

        return ret;
    }

    /**
     *
     * @param jobDetailStatusId
     * @return
     * @throws RemoteException
     */
    public String getDetailStatusIdText(int jobDetailStatusId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;
        String ret = null;

        log.debug("getDetailStatusIdText requested for jobDetailStatusId "
                + jobDetailStatusId);

        try {
            conn = DBMS.getConnection("TC_EMAIL");

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT");
            sqlStmt.append(" sched_job_detail_status_name");
            sqlStmt.append(" FROM");
            sqlStmt.append(" sched_job_detail_status_lu");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" sched_job_detail_status_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, jobDetailStatusId);
            rs = ps.executeQuery();
            if (!rs.next()) {
                throw new Exception("No records returned");
            }
            ret = rs.getString(1);
            rs.close();
        } catch (Exception dberr) {
            String err = "Failed to get data for jobDetailStatusId " + jobDetailStatusId;
            log.error(err, dberr);
            throw new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            try { if (rs != null) rs.close(); } catch (Exception ignore) { log.error("resultset close problem", ignore); }
            try { if (ps != null) ps.close(); } catch (Exception ignore) { log.error("prepared statement close problem", ignore); }
            try { if (conn != null) conn.close(); } catch (Exception ignore) { log.error("connection close problem", ignore); }
            try { if (ctx != null) ctx.close(); } catch (Exception ignore) { log.error("contet close problem", ignore); }
            rs = null;
            ps = null;
            conn = null;
            ctx = null;
        }

        return ret;
    }

    /**
     *
     * @param jobId
     * @return
     * @throws RemoteException
     */
    public int getTemplateId(int jobId) throws RemoteException {
        return getIntField(jobId, "email_template_id");
    }

    /**
     *
     * @param jobId
     * @return
     * @throws RemoteException
     */
    public int getListId(int jobId) throws RemoteException {
        return getIntField(jobId, "email_list_id");
    }

    /**
     *
     * @param jobId
     * @return
     * @throws RemoteException
     */
    public int getCommandId(int jobId) throws RemoteException {
        return getIntField(jobId, "command_id");
    }

    /**
     *
     * @param jobId
     * @return
     * @throws RemoteException
     */
    public String getCommandName(int jobId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;
        String ret = null;

        log.debug("getCommandName requested for jobId " + jobId);

        int commandId = getCommandId(jobId);

        try {
            conn = DBMS.getConnection("TC_EMAIL");

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT");
            sqlStmt.append(" command_desc");
            sqlStmt.append(" FROM");
            sqlStmt.append(" command");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" command_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, commandId);
            rs = ps.executeQuery();
            if (!rs.next()) {
                throw new Exception("No records returned");
            }
            ret = rs.getString(1);
            rs.close();
        } catch (Exception dberr) {
            String err = "Failed to get data for jobId " + jobId;
            log.error(err, dberr);
            throw new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            try { if (rs != null) rs.close(); } catch (Exception ignore) { log.error("resultset close problem", ignore); }
            try { if (ps != null) ps.close(); } catch (Exception ignore) { log.error("prepared statement close problem", ignore); }
            try { if (conn != null) conn.close(); } catch (Exception ignore) { log.error("connection close problem", ignore); }
            try { if (ctx != null) ctx.close(); } catch (Exception ignore) { log.error("contet close problem", ignore); }
            rs = null;
            ps = null;
            conn = null;
            ctx = null;
        }

        return ret;
    }

    /**
     *
     * @param jobId
     * @return
     * @throws RemoteException
     */
    public Date getStartAfterDate(int jobId) throws RemoteException {
        return getDateField(jobId, "start_after_date");
    }

    /**
     *
     * @param jobId
     * @return
     * @throws RemoteException
     */
    public Date getStopBeforeDate(int jobId) throws RemoteException {
        return getDateField(jobId, "end_before_date");
    }

    /**
     *
     * @param jobId
     * @return
     * @throws RemoteException
     */
    public String getFromAddress(int jobId) throws RemoteException {
        return getStringField(jobId, "from_address");
    }

    /**
     *
     * @param jobId
     * @return
     * @throws RemoteException
     */
    public String getFromPersonal(int jobId) throws RemoteException {
        return getStringField(jobId, "from_personal");
    }

    /**
     *
     * @param jobId
     * @return
     * @throws RemoteException
     */
    public String getSubject(int jobId) throws RemoteException {
        return getStringField(jobId, "subject");
    }

    /**
     *
     * @param jobId
     * @param fieldName
     * @return
     * @throws RemoteException
     */
    private int getIntField(int jobId, String fieldName) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;
        int ret = 0;

        log.debug("getIntField requested for jobId " + jobId + ", field=" + fieldName);

        try {
            conn = DBMS.getConnection("TC_EMAIL");

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT ");
            sqlStmt.append(fieldName);
            sqlStmt.append(" FROM");
            sqlStmt.append(" sched_job,");
            sqlStmt.append(" sched_email_job");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" sched_job_id = sched_email_job_id");
            sqlStmt.append(" AND");
            sqlStmt.append(" sched_job_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, jobId);
            rs = ps.executeQuery();
            if (!rs.next()) {
                throw new Exception("No records returned");
            }
            ret = rs.getInt(1);
            rs.close();
        } catch (Exception dberr) {
            String err = "Failed to get data for job " + jobId;
            log.error(err, dberr);
            throw new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            try { if (rs != null) rs.close(); } catch (Exception ignore) { log.error("resultset close problem", ignore); }
            try { if (ps != null) ps.close(); } catch (Exception ignore) { log.error("prepared statement close problem", ignore); }
            try { if (conn != null) conn.close(); } catch (Exception ignore) { log.error("connection close problem", ignore); }
            try { if (ctx != null) ctx.close(); } catch (Exception ignore) { log.error("contet close problem", ignore); }
            rs = null;
            ps = null;
            conn = null;
            ctx = null;
        }

        return ret;
    }

    /**
     *
     * @param jobId
     * @param fieldName
     * @return
     * @throws RemoteException
     */
    private Date getDateField(int jobId, String fieldName) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;
        Date ret = null;

        log.debug("getDateField requested for jobId " + jobId + ", field=" + fieldName);

        try {
            conn = DBMS.getConnection("TC_EMAIL");

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT ");
            sqlStmt.append(fieldName);
            sqlStmt.append(" FROM");
            sqlStmt.append(" sched_job,");
            sqlStmt.append(" sched_email_job");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" sched_job_id = sched_email_job_id");
            sqlStmt.append(" AND");
            sqlStmt.append(" sched_job_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, jobId);
            rs = ps.executeQuery();
            if (!rs.next()) {
                throw new Exception("No records returned");
            }
            ret = rs.getDate(1);
            rs.close();
        } catch (Exception dberr) {
            String err = "Failed to get data for job " + jobId;
            log.error(err, dberr);
            throw new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            try { if (rs != null) rs.close(); } catch (Exception ignore) { log.error("resultset close problem", ignore); }
            try { if (ps != null) ps.close(); } catch (Exception ignore) { log.error("prepared statement close problem", ignore); }
            try { if (conn != null) conn.close(); } catch (Exception ignore) { log.error("connection close problem", ignore); }
            try { if (ctx != null) ctx.close(); } catch (Exception ignore) { log.error("contet close problem", ignore); }
            rs = null;
            ps = null;
            conn = null;
            ctx = null;
        }

        return ret;
    }

    /**
     *
     * @param jobId
     * @param fieldName
     * @return
     * @throws RemoteException
     */
    private String getStringField(int jobId, String fieldName) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;
        String ret = null;

        log.debug("getStringField requested for jobId " + jobId + ", field=" + fieldName);

        try {
            conn = DBMS.getConnection("TC_EMAIL");

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT ");
            sqlStmt.append(fieldName);
            sqlStmt.append(" FROM");
            sqlStmt.append(" sched_job,");
            sqlStmt.append(" sched_email_job");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" sched_job_id = sched_email_job_id");
            sqlStmt.append(" AND");
            sqlStmt.append(" sched_job_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, jobId);
            rs = ps.executeQuery();
            if (!rs.next()) {
                throw new Exception("No records returned");
            }
            ret = rs.getString(1);
            rs.close();
        } catch (Exception dberr) {
            String err = "Failed to get data for job " + jobId;
            log.error(err, dberr);
            throw  new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            try { if (rs != null) rs.close(); } catch (Exception ignore) { log.error("resultset close problem", ignore); }
            try { if (ps != null) ps.close(); } catch (Exception ignore) { log.error("prepared statement close problem", ignore); }
            try { if (conn != null) conn.close(); } catch (Exception ignore) { log.error("connection close problem", ignore); }
            try { if (ctx != null) ctx.close(); } catch (Exception ignore) { log.error("contet close problem", ignore); }
            rs = null;
            ps = null;
            conn = null;
            ctx = null;
        }

        return ret;
    }

    /**
     *
     * @param jobId
     * @throws RemoteException
     */
    private void validateJobIsUpdatable(int jobId) throws RemoteException {
        try {
            int status = getStatusId(jobId);

            if (status != JOB_STATUS_CREATING
                    && status != JOB_STATUS_READY
                    && status != JOB_STATUS_CANCELED) {
                throw new Exception("The job must be in the CREATING, READY, or CANCELLED state");
            }
        } catch (Exception e) {
            throw new RemoteException("Unable to update job " + jobId, e);
        }
    }

    /**
     *
     * @param jobId
     * @param templateId
     * @throws RemoteException
     */
    public void setTemplateId(int jobId, int templateId) throws RemoteException {
        validateJobIsUpdatable(jobId);
        setField("sched_email_job", "sched_email_job_id", jobId,
                "email_template_id", templateId, null, null);
    }

    /**
     *
     * @param jobId
     * @param listId
     * @throws RemoteException
     */
    public void setListId(int jobId, int listId) throws RemoteException {
        if (listId != 0)
            validateJobIsUpdatable(jobId);
        setField("sched_email_job", "sched_email_job_id", jobId,
                "email_list_id", listId, null, null);
    }

    /**
     *
     * @param jobId
     * @param commandId
     * @throws RemoteException
     */
    public void setCommandId(int jobId, int commandId) throws RemoteException {
        if (commandId != 0)
            validateJobIsUpdatable(jobId);
        setField("sched_email_job", "sched_email_job_id", jobId,
                "command_id", commandId, null, null);
    }

    /**
     *
     * @param jobId
     * @param startAfterDate
     * @throws RemoteException
     */
    public void setStartAfterDate(int jobId, Date startAfterDate) throws RemoteException {
        validateJobIsUpdatable(jobId);
        setField("sched_job", "sched_job_id", jobId,
                "start_after_date", 0, null, startAfterDate);
    }

    /**
     *
     * @param jobId
     * @param stopBeforeDate
     * @throws RemoteException
     */
    public void setStopBeforeDate(int jobId, Date stopBeforeDate) throws RemoteException {
        validateJobIsUpdatable(jobId);
        setField("sched_job", "sched_job_id", jobId,
                "end_before_date", 0, null, stopBeforeDate);
    }

    /**
     *
     * @param jobId
     * @param fromAddress
     * @throws RemoteException
     */
    public void setFromAddress(int jobId, String fromAddress) throws RemoteException {
        validateJobIsUpdatable(jobId);
        setField("sched_email_job", "sched_email_job_id", jobId,
                "from_address", 0, fromAddress, null);
    }

    /**
     *
     * @param jobId
     * @param fromPersonal
     * @throws RemoteException
     */
    public void setFromPersonal(int jobId, String fromPersonal) throws RemoteException {
        validateJobIsUpdatable(jobId);
        setField("sched_email_job", "sched_email_job_id", jobId,
                "from_personal", 0, fromPersonal, null);
    }

    /**
     *
     * @param jobId
     * @param subject
     * @throws RemoteException
     */
    public void setSubject(int jobId, String subject) throws RemoteException {
        validateJobIsUpdatable(jobId);
        setField("sched_email_job", "sched_email_job_id", jobId,
                "subject", 0, subject, null);
    }

    /**
     * Updates a single field on a table with a primary key.
     * @param tableName
     * @param idName
     * @param id
     * @param fieldName
     * @param valueI
     * @param valueS
     * @param valueD
     * @throws RemoteException
     */
    private void setField(String tableName, String idName, int id,
                          String fieldName, int valueI, String valueS,
                          Date valueD) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;

        log.debug("setField requested for table " + tableName + ", "
                + idName + " " + id + ", " + fieldName + " (" + valueI
                + ", " + valueS + ", " + valueD + ")");

        try {
            conn = DBMS.getConnection("TC_EMAIL");

            sqlStmt.setLength(0);
            sqlStmt.append(" UPDATE ");
            sqlStmt.append(tableName);
            sqlStmt.append(" SET ");
            sqlStmt.append(fieldName);
            sqlStmt.append(" = ?");
            sqlStmt.append(" WHERE ");
            sqlStmt.append(idName);
            sqlStmt.append(" = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            if (valueD != null)
                ps.setTimestamp(1, new java.sql.Timestamp(valueD.getTime()));
            else if (valueS != null)
                ps.setString(1, valueS);
            else
                ps.setInt(1, valueI);
            ps.setInt(2, id);
            rows = ps.executeUpdate();
            if (rows == 0) {
                log.debug("The update had no effect."
                        + " Most likely the job does not exist.");
                throw new Exception("The update command affected "
                        + rows + " rows.");
            } else {
                if (rows != 1) {
                    log.warn("The update request did not update just a single"
                            + " record (table " + tableName + ", " + idName +
                            " " + id + ", " + rows + " records updated).");
                }
            }
        } catch (Exception dberr) {
            String err = "Failed to update table " + tableName + ", "
                    + idName + " " + id + ")";
            log.error(err, dberr);
            throw new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            try { if (rs != null) rs.close(); } catch (Exception ignore) { log.error("resultset close problem", ignore); }
            try { if (ps != null) ps.close(); } catch (Exception ignore) { log.error("prepared statement close problem", ignore); }
            try { if (conn != null) conn.close(); } catch (Exception ignore) { log.error("connection close problem", ignore); }
            try { if (ctx != null) ctx.close(); } catch (Exception ignore) { log.error("contet close problem", ignore); }
            rs = null;
            ps = null;
            conn = null;
            ctx = null;
        }
    }

    /**
     *
     * @param jobId
     * @param inputId
     * @param param
     * @throws RemoteException
     */
    public void setCommandParam(int jobId, int inputId, String param) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;

        log.debug("setCommandParam requested for jobId " + jobId);

        try {
            conn = DBMS.getConnection("TC_EMAIL");

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT");
            sqlStmt.append(" command_param_id");
            sqlStmt.append(" FROM");
            sqlStmt.append(" command_param");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" sched_email_job_id = ?");
            sqlStmt.append(" AND");
            sqlStmt.append(" input_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, jobId);
            ps.setInt(2, inputId);
            rs = ps.executeQuery();
            if (!rs.next()) {
                // parameter doesn't exist, need to add it
                rs.close();

                int paramId = 0;

                sqlStmt.setLength(0);
                sqlStmt.append(" SELECT");
                sqlStmt.append(" MAX(command_param_id)");
                sqlStmt.append(" FROM");
                sqlStmt.append(" command_param");
                ps = conn.prepareStatement(sqlStmt.toString());
                rs = ps.executeQuery();
                if (rs.next())
                    paramId = rs.getInt(1) + 1;
                else
                    log.warn("Failed to get max command_param_id,"
                            + " using default value of 1.");
                rs.close();

                sqlStmt.setLength(0);
                sqlStmt.append(" INSERT INTO");
                sqlStmt.append(" command_param (");
                sqlStmt.append(" command_param_id");
                sqlStmt.append(",");
                sqlStmt.append(" sched_email_job_id");
                sqlStmt.append(",");
                sqlStmt.append(" input_id");
                sqlStmt.append(",");
                sqlStmt.append(" param");
                sqlStmt.append(") VALUES (?,?,?,?)");
                ps = conn.prepareStatement(sqlStmt.toString());
                ps.setInt(1, paramId);
                ps.setInt(2, jobId);
                ps.setInt(3, inputId);
                ps.setString(4, param);
                rows = ps.executeUpdate();
                if (rows != 1) {
                    throw new Exception("insert command affected " + rows + " rows.");
                }
            } else {
                // parameter exists, update it
                int paramId = rs.getInt(1);
                rs.close();

                sqlStmt.setLength(0);
                sqlStmt.append(" UPDATE");
                sqlStmt.append(" command_param");
                sqlStmt.append(" SET");
                sqlStmt.append(" param = ?");
                sqlStmt.append(" WHERE ");
                sqlStmt.append(" command_param_id = ?");
                ps = conn.prepareStatement(sqlStmt.toString());
                ps.setString(1, param);
                ps.setInt(2, paramId);
                rows = ps.executeUpdate();
                if (rows == 0) {
                    log.debug("The update had no effect. Was the record removed?");
                    throw new Exception("The update command affected " + rows + " rows.");
                } else {
                    if (rows != 1) {
                        log.warn("The update request did not update just a single"
                                + " record (" + rows + " records updated).");
                    }
                }
            }
        } catch (Exception dberr) {
            String err = "Failed to add/update commandParam";
            log.error(err, dberr);
            throw new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            try { if (rs != null) rs.close(); } catch (Exception ignore) { log.error("resultset close problem", ignore); }
            try { if (ps != null) ps.close(); } catch (Exception ignore) { log.error("prepared statement close problem", ignore); }
            try { if (conn != null) conn.close(); } catch (Exception ignore) { log.error("connection close problem", ignore); }
            try { if (ctx != null) ctx.close(); } catch (Exception ignore) { log.error("contet close problem", ignore); }
            rs = null;
            ps = null;
            conn = null;
            ctx = null;
        }
    }

    /**
     *
     * @param jobId
     * @return
     * @throws RemoteException
     */
    public Map getCommandParams(int jobId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;
        Map ret = new HashMap();

        log.debug("getCommandParams requested for jobId " + jobId);

        try {
            conn = DBMS.getConnection("TC_EMAIL");

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT");
            sqlStmt.append(" input_id");
            sqlStmt.append(",");
            sqlStmt.append(" param");
            sqlStmt.append(" FROM");
            sqlStmt.append(" command_param");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" sched_email_job_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, jobId);
            rs = ps.executeQuery();
            for (; rs.next();) {
                ret.put(new Integer(rs.getInt(1)), rs.getString(2));
            }
        } catch (Exception dberr) {
            String err = "Failed to add/update commandParam";
            log.error(err, dberr);
            throw new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            try { if (rs != null) rs.close(); } catch (Exception ignore) { log.error("resultset close problem", ignore); }
            try { if (ps != null) ps.close(); } catch (Exception ignore) { log.error("prepared statement close problem", ignore); }
            try { if (conn != null) conn.close(); } catch (Exception ignore) { log.error("connection close problem", ignore); }
            try { if (ctx != null) ctx.close(); } catch (Exception ignore) { log.error("contet close problem", ignore); }
            rs = null;
            ps = null;
            conn = null;
            ctx = null;
        }

        return ret;
    }

    /**
     *
     * @param inputId
     * @return
     * @throws RemoteException
     */
    public String getCommandParamName(int inputId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;
        String ret = null;

        log.debug("getCommandParamName requested for inputId " + inputId);

        try {
            conn = DBMS.getConnection("TC_EMAIL");

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT");
            sqlStmt.append(" input_code");
            sqlStmt.append(" FROM");
            sqlStmt.append(" input_lu");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" input_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, inputId);
            rs = ps.executeQuery();
            if (!rs.next())
                throw new Exception("inputId not found in input_lu table");
            ret = rs.getString(1);
        } catch (Exception dberr) {
            String err = "Failed to lookup inputId " + inputId;
            log.error(err, dberr);
            throw new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            try { if (rs != null) rs.close(); } catch (Exception ignore) { log.error("resultset close problem", ignore); }
            try { if (ps != null) ps.close(); } catch (Exception ignore) { log.error("prepared statement close problem", ignore); }
            try { if (conn != null) conn.close(); } catch (Exception ignore) { log.error("connection close problem", ignore); }
            try { if (ctx != null) ctx.close(); } catch (Exception ignore) { log.error("contet close problem", ignore); }
            rs = null;
            ps = null;
            conn = null;
            ctx = null;
        }

        return ret;
    }
}


