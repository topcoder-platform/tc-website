package com.topcoder.shared.ejb.EmailServices;

import java.util.*;
import com.topcoder.shared.ejb.BaseEJB;
import com.topcoder.shared.util.logging.Logger;
import java.rmi.RemoteException;

/**
 * @see    EmailJob
 *
 * @author   Eric Ellingson
 * @version  $Revision$
 * @internal Log of Changes:
 *           $Log$
 *           Revision 1.1.2.20  2002/07/10 04:05:32  sord
 *           Get all job types in getJobs()
 *
 *           Revision 1.1.2.19  2002/07/07 23:53:48  sord
 *           Added functions related to creating reports for EmailJobs
 *
 *           Revision 1.1.2.18  2002/06/13 06:14:13  email
 *           Fixed scope of SQLException so compiler can find it.
 *
 *           Revision 1.1.2.17  2002/06/13 06:10:56  email
 *           Catch multiple job insertion SQLException.  It is ok, it just means the job
 *           wasn't acquired (return false).
 *
 *           Revision 1.1.2.16  2002/06/12 06:44:35  sord
 *           Added functions required for the multiple scheduler feature.
 *
 *           Revision 1.1.2.15  2002/05/06 05:36:00  sord
 *           Implemented archive_sched_job_detail related functions.
 *
 *           Revision 1.1.2.14  2002/05/03 09:04:17  sord
 *           Added functions to update jobType and check a job's type. The job type
 *           will be used to determine if a job is pre-detail-build or post-detail-build.
 *
 *           Revision 1.1.2.13  2002/05/03 08:14:31  sord
 *           Replace timestamp parameters with inline string to see if I can avoid the timezone problem.
 *
 *           Revision 1.1.2.12  2002/05/03 07:52:37  sord
 *           Converted sql.Date to sql.Timestamp because we are really storing timestamps, not just dates.
 *
 *           Revision 1.1.2.11  2002/05/02 20:17:37  sord
 *           Added getDate function so we can tell what time it is on the ejb server.
 *
 *           Revision 1.1.2.10  2002/05/01 08:05:14  sord
 *           Fixed bug where reason wasn't being saved to the database.
 *
 *           Revision 1.1.2.9  2002/04/27 08:07:57  sord
 *           Fixed column name (adding detail record)
 *
 *           Revision 1.1.2.8  2002/04/27 02:54:13  sord
 *           Fixed typo
 *
 *           Revision 1.1.2.7  2002/04/27 01:40:56  sord
 *           Fixed bug in getJobs that was returning the wrong jobId
 *
 *           Revision 1.1.2.6  2002/04/25 08:40:31  sord
 *           Added additional functions required for working with job detail records.
 *
 *           Revision 1.1.2.5  2002/04/25 07:33:52  sord
 *           Fixed column name.
 *
 *           Revision 1.1.2.4  2002/04/25 06:05:33  sord
 *           Added setStatus function.
 *
 *           Revision 1.1.2.3  2002/04/25 05:57:01  sord
 *           Fixed some Date type issues.
 *
 *           Revision 1.1.2.2  2002/04/25 05:52:59  sord
 *           Added EmailServer bean.
 *
 *           Revision 1.1.2.1  2002/04/25 04:52:35  sord
 *           Initial version.
 *
 */
public class EmailServerBean extends BaseEJB {
    public static final int SCHEDULER_SEQUENCE_ID = 74;

    public void ejbCreate () { }
    
    private static Logger log = Logger.getLogger(EmailServerBean.class);

    public Date getDate() throws RemoteException {
        try {
            return new Date();
	} catch (Exception e) {
            throw new RemoteException("Failed to get date", e);
        }
    }

    public Set getJobs(int status, int dateRange) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
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
            for ( ; rs.next(); ) {
                ret.add(new Integer(rs.getInt(1)));
            }
            rs.close();
        } catch ( Exception dberr ) {
            String err = "Failed to get job ids"; 
            log.error(err, dberr);
            throw new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                log.error("Failed to close database context", ctxerr); } 
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                log.error("Failed to close database connection", connerr); }
            }
        }
        
        return ret;
    }

    public void setJobStatus(int jobId, int status) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
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
        } catch ( Exception dberr ) {
            String err = "Failed to update job status";
            log.error(err, dberr);
            throw new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                log.error("Failed to close database context", ctxerr); } 
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                log.error("Failed to close database connection", connerr); }
            }
        }
    }

    public void setJobType(int jobId, int type) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
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
        } catch ( Exception dberr ) {
            String err = "Failed to update job type";
            log.error(err, dberr);
            throw new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                log.error("Failed to close database context", ctxerr); } 
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                log.error("Failed to close database connection", connerr); }
            }
        }
    }

    public void clearDetailRecords(int jobId) throws RemoteException{
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
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
        } catch ( Exception dberr ) {
            String err = "Failed to clearDetailRecords"; 
            log.error(err, dberr);
            throw new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                log.error("Failed to close database context", ctxerr); } 
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                log.error("Failed to close database connection", connerr); }
            }
        }
    }

    public int addDetailRecord(int jobId, String data) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
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
        } catch ( Exception dberr ) {
            String err = "Failed to update job status";
            log.error(err, dberr);
            throw new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                log.error("Failed to close database context", ctxerr); } 
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                log.error("Failed to close database connection", connerr); }
            }
        }
        
        return id;
    }

    public void setDetailStatus(int jobId, int detailId, int status, String reason) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
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
            ps.setBytes(2, reason.getBytes());
            ps.setInt(3, jobId);
            ps.setInt(4, detailId);
            rows = ps.executeUpdate();
            if (rows == 0) {
                log.debug("The update had no effect."
                        + " Most likely the job detail record does not exist.");
                throw new Exception("The update command affected " 
                        + rows + " rows.");
            }
        } catch ( Exception dberr ) {
            String err = "Failed to update job status";
            log.error(err, dberr);
            throw new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                log.error("Failed to close database context", ctxerr); } 
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                log.error("Failed to close database connection", connerr); }
            }
        }
    }

    public void setJobBuilt(int jobId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
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
        } catch ( Exception dberr ) {
            String err = "Failed to update job type";
            log.error(err, dberr);
            throw new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                log.error("Failed to close database context", ctxerr); } 
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                log.error("Failed to close database connection", connerr); }
            }
        }
    }

    public void archiveDetail(int jobId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
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
            sqlStmt.append(" archive_sched_job_detail");
            sqlStmt.append(" SELECT *, '" + now.toString() + "' as insert_date");
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
        } catch ( Exception dberr ) {
            String err = "Failed to archive detail records";
            log.error(err, dberr);
            throw new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                log.error("Failed to close database context", ctxerr); } 
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                log.error("Failed to close database connection", connerr); }
            }
        }
    }

    public long getSchedulerId() throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );

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
        } catch ( Exception dberr ) {
            log.error("Failed to get schedulerId", dberr);
            throw new RemoteException("Failed to get schedulerId", dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                log.error("Failed to close database context", ctxerr); } 
            }
            if ( rs != null ) { try { rs.close(); } catch (Exception rserr) {
                log.error("Failed to close recordset", rserr); }
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                log.error("Failed to close database connection", connerr); }
            }
        }
    }
    
    public boolean acquireJob(int jobId, long controlId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );

        log.debug("acquireJob("+jobId+","+controlId+") requested");

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
        } catch ( Exception dberr ) {
            throw new RemoteException("Error while attempting to acquireJob", dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                log.error("Failed to close database context", ctxerr); } 
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                log.error("Failed to close database connection", connerr); }
            }
        }
    }
    
    public boolean acquireJob(int jobId, long controlId, long oldId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );

        log.debug("acquireJob("+jobId+","+controlId+","+oldId+") requested");
        
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
        } catch ( Exception dberr ) {
            throw new RemoteException("Error while attempting to acquireJob", dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                log.error("Failed to close database context", ctxerr); } 
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                log.error("Failed to close database connection", connerr); }
            }
        }
    }
    
    public long getJobControlId(int jobId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );

        log.debug("getJobControlId("+jobId+") requested");
        
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
        } catch ( Exception dberr ) {
            throw new RemoteException("Error while attempting to getJobControlId", dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                log.error("Failed to close database context", ctxerr); } 
            }
            if ( rs != null ) { try { rs.close(); } catch (Exception rserr) {
                log.error("Failed to close recordset", rserr); }
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                log.error("Failed to close database connection", connerr); }
            }
        }
    }
    
    public void clearJobControlIds(long controlId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );

        log.debug("clearJobControlIds("+controlId+") requested");
        
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
        } catch ( Exception dberr ) {
            throw new RemoteException("Error while attempting to clearJobControlIds", dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                log.error("Failed to close database context", ctxerr); } 
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                log.error("Failed to close database connection", connerr); }
            }
        }
    }
}


