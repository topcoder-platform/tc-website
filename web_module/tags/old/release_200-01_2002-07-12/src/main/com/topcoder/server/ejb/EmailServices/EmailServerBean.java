package com.topcoder.server.ejb.EmailServices;

import java.util.*;
import org.apache.log4j.Category;
import com.topcoder.server.ejb.BaseEJB;
import java.rmi.RemoteException;

/**
 * @see    EmailJob
 *
 * @author   Eric Ellingson
 * @version  $Revision$
 * @internal Log of Changes:
 *           $Log$
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

    public void ejbCreate () { }
    
    private static Category trace = Category.getInstance( EmailServerBean.class.getName() );

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

        trace.debug("getJobs based on status=" + status);
           
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
            sqlStmt.append(" AND");
            sqlStmt.append(" (sched_job_type_id = ?");
            sqlStmt.append(" OR");
            sqlStmt.append(" sched_job_type_id = ?)");
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
            ps.setInt(2, EmailServer.EMAIL_JOB_TYPE_PRE);
            ps.setInt(3, EmailServer.EMAIL_JOB_TYPE_POST);
/*            switch (dateRange) {
                case EmailServer.ANYRANGE: 
                        break;
                case EmailServer.BEFORERANGE:
                        ps.setTimestamp(4, now);
                        break;
                case EmailServer.INRANGE: {
                        Date tmp = new Date();
                        ps.setTimestamp(4, now);
                        ps.setTimestamp(5, now); 
                        } break;
                case EmailServer.AFTERRANGE: 
                        ps.setTimestamp(4, now);
                        break;
            } */
            rs = ps.executeQuery();
            for ( ; rs.next(); ) {
                ret.add(new Integer(rs.getInt(1)));
            }
            rs.close();
        } catch ( Exception dberr ) {
            String err = "Failed to get job ids"; 
            trace.error(err, dberr);
            throw new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                trace.error("Failed to close database context", ctxerr); } 
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                trace.error("Failed to close database connection", connerr); }
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

        trace.debug("setJobStatus (jobId " + jobId + ", status " + status + ")");
           
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
                trace.debug("The update had no effect."
                        + " Most likely the job does not exist.");
                throw new Exception("The update command affected " 
                        + rows + " rows.");
            }
        } catch ( Exception dberr ) {
            String err = "Failed to update job status";
            trace.error(err, dberr);
            throw new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                trace.error("Failed to close database context", ctxerr); } 
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                trace.error("Failed to close database connection", connerr); }
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

        trace.debug("clearDetailRecords jobId " + jobId);
           
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
                trace.info("clearDetailRecords removed " + rows + " records from job " + jobId);
            }
        } catch ( Exception dberr ) {
            String err = "Failed to clearDetailRecords"; 
            trace.error(err, dberr);
            throw new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                trace.error("Failed to close database context", ctxerr); } 
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                trace.error("Failed to close database connection", connerr); }
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

        trace.debug("addDetailRecord (jobId " + jobId + ")");
           
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
            trace.error(err, dberr);
            throw new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                trace.error("Failed to close database context", ctxerr); } 
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                trace.error("Failed to close database connection", connerr); }
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

        trace.debug("setDetailStatus (jobId " + jobId + ", detailId " + detailId + ", status " + status + ":" + reason + ")");
           
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
                trace.debug("The update had no effect."
                        + " Most likely the job detail record does not exist.");
                throw new Exception("The update command affected " 
                        + rows + " rows.");
            }
        } catch ( Exception dberr ) {
            String err = "Failed to update job status";
            trace.error(err, dberr);
            throw new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                trace.error("Failed to close database context", ctxerr); } 
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                trace.error("Failed to close database connection", connerr); }
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

        trace.debug("setJobBuilt (jobId " + jobId + ")");
           
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
                trace.debug("The update had no effect."
                        + " Most likely the job detail record does not exist"
                        + " or the job was already built.");
                throw new Exception("The update command affected " 
                        + rows + " rows.");
            }
        } catch ( Exception dberr ) {
            String err = "Failed to update job type";
            trace.error(err, dberr);
            throw new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                trace.error("Failed to close database context", ctxerr); } 
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                trace.error("Failed to close database connection", connerr); }
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

        trace.debug("archiveDetail (jobId " + jobId + ")");
           
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
                trace.debug("The update had no effect."
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
                trace.debug("The delete did not modify the same number of rows"
                        + " that the insert added (" + rows + " inserted, "
                        + drows + " deleted). Transaction rolled back.");
                throw new Exception("Mismatched insert/delete count."
                        + " Transaction rolled back (" + rows + " inserted, "
                        + drows + " deleted)");
            }
            conn.commit();
        } catch ( Exception dberr ) {
            String err = "Failed to archive detail records";
            trace.error(err, dberr);
            throw new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                trace.error("Failed to close database context", ctxerr); } 
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                trace.error("Failed to close database connection", connerr); }
            }
        }
    }
}


