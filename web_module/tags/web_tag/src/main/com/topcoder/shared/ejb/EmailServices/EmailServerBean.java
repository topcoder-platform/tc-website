package com.topcoder.shared.ejb.EmailServices;

import com.topcoder.shared.ejb.BaseEJB;
import com.topcoder.shared.util.logging.Logger;

import java.rmi.RemoteException;
import java.util.*;

/**
 *
 * @see    EmailJob
 *
 * @author   Eric Ellingson
 * @version  $Revision$
 */
public class EmailServerBean extends BaseEJB {
    /**
     *
     */
    public static final int SCHEDULER_SEQUENCE_ID = 74;

    /**
     *
     */
    public void ejbCreate() {
    }

    private static Logger log = Logger.getLogger(EmailServerBean.class);

    /**
     *
     * @return
     * @throws RemoteException
     */
    public Date getDate() throws RemoteException {
        try {
            return new Date();
        } catch (Exception e) {
            throw new RemoteException("Failed to get date", e);
        }
    }

    /**
     *
     * @param status
     * @param dateRange
     * @return
     * @throws RemoteException
     */
    public Set getJobs(int status, int dateRange) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;
        Set ret = new HashSet();

        log.debug("getJobs based on status=" + status);

        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            java.sql.Timestamp now = new java.sql.Timestamp(new Date().getTime());

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT");
            sqlStmt.append(" sched_job_id");
            sqlStmt.append(" FROM");
            sqlStmt.append(" sched_job");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" sched_job_status_id = ?");
            switch (dateRange) {
                case EmailServer.ANYRANGE:
                    break;
                case EmailServer.BEFORERANGE:
                    sqlStmt.append(" AND start_after_date > '" + now.toString() + "'");
                    break;
                case EmailServer.INRANGE:
                    sqlStmt.append(" AND start_after_date <= '" + now.toString() + "'");
                    sqlStmt.append(" AND end_before_date > '" + now.toString() + "'");
                    break;
                case EmailServer.AFTERRANGE:
                    sqlStmt.append(" AND end_before_date <= '" + now.toString() + "'");
                    break;
            }
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, status);
            rs = ps.executeQuery();
            for (; rs.next();) {
                ret.add(new Integer(rs.getInt(1)));
            }
            rs.close();
        } catch (Exception dberr) {
            String err = "Failed to get job ids";
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
     * @param status
     * @throws RemoteException
     */
    public void setJobStatus(int jobId, int status) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;

        log.debug("setJobStatus (jobId " + jobId + ", status " + status + ")");

        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" UPDATE");
            sqlStmt.append(" sched_job");
            sqlStmt.append(" SET");
            sqlStmt.append(" sched_job_status_id");
            sqlStmt.append(" = ?");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" sched_job_id");
            sqlStmt.append(" = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, status);
            ps.setInt(2, jobId);
            rows = ps.executeUpdate();
            if (rows == 0) {
                log.debug("The update had no effect."
                        + " Most likely the job does not exist.");
                throw new Exception("The update command affected "
                        + rows + " rows.");
            }
        } catch (Exception dberr) {
            String err = "Failed to update job status";
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
     * @param type
     * @throws RemoteException
     */
    public void setJobType(int jobId, int type) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;

        log.debug("setJobType (jobId " + jobId + ", type " + type + ")");

        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" UPDATE");
            sqlStmt.append(" sched_job");
            sqlStmt.append(" SET");
            sqlStmt.append(" sched_job_type_id");
            sqlStmt.append(" = ?");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" sched_job_id");
            sqlStmt.append(" = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, type);
            ps.setInt(2, jobId);
            rows = ps.executeUpdate();
            if (rows == 0) {
                log.debug("The update had no effect."
                        + " Most likely the job does not exist.");
                throw new Exception("The update command affected "
                        + rows + " rows.");
            }
        } catch (Exception dberr) {
            String err = "Failed to update job type";
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
     * @throws RemoteException
     */
    public void clearDetailRecords(int jobId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;

        log.debug("clearDetailRecords jobId " + jobId);

        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" DELETE");
            sqlStmt.append(" FROM");
            sqlStmt.append(" sched_job_detail");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" sched_job_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, jobId);
            rows = ps.executeUpdate();
            if (rows == 0) {
                //normal result
            } else {
                // must have been an aborted job
                log.info("clearDetailRecords removed " + rows + " records from job " + jobId);
            }
        } catch (Exception dberr) {
            String err = "Failed to clearDetailRecords";
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
     * @param data
     * @return
     * @throws RemoteException
     */
    public int addDetailRecord(int jobId, String data) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;
        int id = 0;

        log.debug("addDetailRecord (jobId " + jobId + ")");

        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" EXECUTE PROCEDURE nextval(?)");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, EmailJobBean.JOB_DETAIL_SEQUENCE_ID);
            rs = ps.executeQuery();
            rs.next();
            id = rs.getInt(1);
            rs.close();

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
            String err = "Failed to update job status";
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

        return id;
    }

    /**
     *
     * @param jobId
     * @param detailId
     * @param status
     * @param reason
     * @throws RemoteException
     */
    public void setDetailStatus(int jobId, int detailId, int status, String reason) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;

        log.debug("setDetailStatus (jobId " + jobId + ", detailId " + detailId + ", status " + status + ":" + reason + ")");

        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" UPDATE");
            sqlStmt.append(" sched_job_detail");
            sqlStmt.append(" SET");
            sqlStmt.append(" sched_job_detail_status_id = ?");
            sqlStmt.append(",");
            sqlStmt.append(" reason = ?");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" sched_job_id = ?");
            sqlStmt.append(" AND");
            sqlStmt.append(" sched_job_detail_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, status);
            ps.setString(2, reason);
            ps.setInt(3, jobId);
            ps.setInt(4, detailId);
            rows = ps.executeUpdate();
            if (rows == 0) {
                log.debug("The update had no effect."
                        + " Most likely the job detail record does not exist.");
                throw new Exception("The update command affected "
                        + rows + " rows.");
            }
        } catch (Exception dberr) {
            String err = "Failed to update job status";
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
     * @throws RemoteException
     */
    public void setJobBuilt(int jobId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;

        log.debug("setJobBuilt (jobId " + jobId + ")");

        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" UPDATE");
            sqlStmt.append(" sched_job");
            sqlStmt.append(" SET");
            sqlStmt.append(" sched_job_type_id = ?");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" sched_job_id = ?");
            sqlStmt.append(" AND");
            sqlStmt.append(" sched_job_type_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, EmailServer.EMAIL_JOB_TYPE_POST);
            ps.setInt(2, jobId);
            ps.setInt(3, EmailServer.EMAIL_JOB_TYPE_PRE);
            rows = ps.executeUpdate();
            if (rows == 0) {
                log.debug("The update had no effect."
                        + " Most likely the job detail record does not exist"
                        + " or the job was already built.");
                throw new Exception("The update command affected "
                        + rows + " rows.");
            }
        } catch (Exception dberr) {
            String err = "Failed to update job type";
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
     * @throws RemoteException
     */
    public void archiveDetail(int jobId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;

        log.debug("archiveDetail (jobId " + jobId + ")");

        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL_JTS");
            conn = ds.getConnection();
            conn.setAutoCommit(false);

            java.sql.Timestamp now = new java.sql.Timestamp(new Date().getTime());

            sqlStmt.setLength(0);
            sqlStmt.append(" INSERT INTO");
            sqlStmt.append(" archive_sched_job_detail (sched_job_id, sched_job_detail_id, sched_job_detail_status_id, data, reason, insert_date)");
            sqlStmt.append(" SELECT sched_job_id, sched_job_detail_id, sched_job_detail_status_id, data, reason, '" + now.toString() + "' as insert_date");
            sqlStmt.append(" FROM");
            sqlStmt.append(" sched_job_detail");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" sched_job_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, jobId);
            rows = ps.executeUpdate();
            if (rows == 0) {
                conn.rollback();  // not that this will do anything...
                log.debug("The update had no effect."
                        + " Most likely the job detail record do not exist or"
                        + " have already been archived.");
                throw new Exception("The update command affected "
                        + rows + " rows.");
            }
            sqlStmt.setLength(0);
            sqlStmt.append(" DELETE FROM");
            sqlStmt.append(" sched_job_detail");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" sched_job_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, jobId);
            int drows = ps.executeUpdate();
            if (drows != rows) {
                conn.rollback();
                log.debug("The delete did not modify the same number of rows"
                        + " that the insert added (" + rows + " inserted, "
                        + drows + " deleted). Transaction rolled back.");
                throw new Exception("Mismatched insert/delete count."
                        + " Transaction rolled back (" + rows + " inserted, "
                        + drows + " deleted)");
            }
            conn.commit();
        } catch (Exception dberr) {
            String err = "Failed to archive detail records";
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
     * @return
     * @throws RemoteException
     */
    public long getSchedulerId() throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);

        log.debug("getSchedulerId requested");

        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" EXECUTE PROCEDURE nextval(?)");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, SCHEDULER_SEQUENCE_ID);
            rs = ps.executeQuery();
            rs.next();
            long ret = rs.getLong(1);
            if (ret > 0L)
                return ret;
            sqlStmt.setLength(0);
            sqlStmt.append(" INSERT INTO");
            sqlStmt.append(" sequence_object (");
            sqlStmt.append(" id");
            sqlStmt.append(",");
            sqlStmt.append(" current_value");
            sqlStmt.append(",");
            sqlStmt.append(" name");
            sqlStmt.append(") VALUES (?,?,?)");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, SCHEDULER_SEQUENCE_ID);
            ps.setInt(2, 2);
            ps.setString(3, "SCHEDULER_ID_SEQ");
            int rows = ps.executeUpdate();
            if (rows != 1) {
                throw new Exception("insert command affected " + rows + " rows.");
            }
            return 1;
        } catch (Exception dberr) {
            log.error("Failed to get schedulerId", dberr);
            throw new RemoteException("Failed to get schedulerId", dberr);
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
     * @param controlId
     * @return
     * @throws RemoteException
     */
    public boolean acquireJob(int jobId, long controlId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        StringBuffer sqlStmt = new StringBuffer(500);

        log.debug("acquireJob(" + jobId + "," + controlId + ") requested");

        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" INSERT INTO");
            sqlStmt.append(" sched_control (");
            sqlStmt.append(" sched_control_id");
            sqlStmt.append(",");
            sqlStmt.append(" sched_job_id");
            sqlStmt.append(") VALUES (?,?)");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setLong(1, controlId);
            ps.setInt(2, jobId);
            try {
                int rows = ps.executeUpdate();
                if (rows == 1) {
                    return true;
                } else if (rows > 1) {
                    throw new Exception("insert command affected " + rows + " rows.");
                }
                return false;
            } catch (java.sql.SQLException e) {
                // this is probably an unique constraint exception caused
                // by two schedulers trying to acquire the same job.
                return false;
            }
        } catch (Exception dberr) {
            throw new RemoteException("Error while attempting to acquireJob", dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            try { if (ps != null) ps.close(); } catch (Exception ignore) { log.error("prepared statement close problem", ignore); }
            try { if (conn != null) conn.close(); } catch (Exception ignore) { log.error("connection close problem", ignore); }
            try { if (ctx != null) ctx.close(); } catch (Exception ignore) { log.error("contet close problem", ignore); }
            ps = null;
            conn = null;
            ctx = null;
        }
    }

    /**
     *
     * @param jobId
     * @param controlId
     * @param oldId
     * @return
     * @throws RemoteException
     */
    public boolean acquireJob(int jobId, long controlId, long oldId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        StringBuffer sqlStmt = new StringBuffer(500);

        log.debug("acquireJob(" + jobId + "," + controlId + "," + oldId + ") requested");

        if (oldId == 0 && acquireJob(jobId, controlId)) return true;

        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" UPDATE ");
            sqlStmt.append(" sched_control");
            sqlStmt.append(" SET");
            sqlStmt.append(" sched_control_id = ?");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" sched_job_id = ?");
            sqlStmt.append(" AND");
            sqlStmt.append(" sched_control_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setLong(1, controlId);
            ps.setInt(2, jobId);
            ps.setLong(3, oldId);
            int rows = ps.executeUpdate();
            if (rows >= 1) {
                return true;
            }
            return false;
        } catch (Exception dberr) {
            throw new RemoteException("Error while attempting to acquireJob", dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            try { if (ps != null) ps.close(); } catch (Exception ignore) { log.error("prepared statement close problem", ignore); }
            try { if (conn != null) conn.close(); } catch (Exception ignore) { log.error("connection close problem", ignore); }
            try { if (ctx != null) ctx.close(); } catch (Exception ignore) { log.error("contet close problem", ignore); }
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
    public long getJobControlId(int jobId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);

        log.debug("getJobControlId(" + jobId + ") requested");

        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT ");
            sqlStmt.append(" sched_control_id");
            sqlStmt.append(" FROM");
            sqlStmt.append(" sched_control");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" sched_job_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, jobId);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getLong(1);
            }
            return 0;
        } catch (Exception dberr) {
            throw new RemoteException("Error while attempting to getJobControlId", dberr);
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
     * @param controlId
     * @throws RemoteException
     */
    public void clearJobControlIds(long controlId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        StringBuffer sqlStmt = new StringBuffer(500);

        log.debug("clearJobControlIds(" + controlId + ") requested");

        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" DELETE");
            sqlStmt.append(" FROM");
            sqlStmt.append(" sched_control");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" sched_control_id < ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setLong(1, controlId);
            ps.executeUpdate();
        } catch (Exception dberr) {
            throw new RemoteException("Error while attempting to clearJobControlIds", dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            try { if (ps != null) ps.close(); } catch (Exception ignore) { log.error("prepared statement close problem", ignore); }
            try { if (conn != null) conn.close(); } catch (Exception ignore) { log.error("connection close problem", ignore); }
            try { if (ctx != null) ctx.close(); } catch (Exception ignore) { log.error("contet close problem", ignore); }
            ps = null;
            conn = null;
            ctx = null;
        }
    }
}


