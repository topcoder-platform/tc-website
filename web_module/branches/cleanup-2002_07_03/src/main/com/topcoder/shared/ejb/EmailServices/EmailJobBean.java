package com.topcoder.shared.ejb.EmailServices;

import java.util.*;
import org.apache.log4j.Category;
import com.topcoder.shared.ejb.BaseEJB;
import java.rmi.RemoteException;

/**
 * @see    EmailJob
 *
 * @author   Eric Ellingson
 * @version  $Revision$
 * @internal Log of Changes:
 *           $Log$
 *           Revision 1.1  2002/05/21 15:45:15  steveb
 *           SB
 *
 *           Revision 1.5.2.23  2002/05/08 02:50:37  sord
 *           Added getJobDetailResults(job, first, last) function.
 *
 *           Revision 1.5.2.22  2002/05/06 05:46:05  sord
 *           Added isJobDetailArchived function.
 *
 *           Revision 1.5.2.21  2002/05/06 05:36:00  sord
 *           Implemented archive_sched_job_detail related functions.
 *
 *           Revision 1.5.2.20  2002/05/03 09:04:17  sord
 *           Added functions to update jobType and check a job's type. The job type
 *           will be used to determine if a job is pre-detail-build or post-detail-build.
 *
 *           Revision 1.5.2.19  2002/05/03 07:52:37  sord
 *           Converted sql.Date to sql.Timestamp because we are really storing timestamps, not just dates.
 *
 *           Revision 1.5.2.18  2002/04/28 22:56:24  sord
 *           Fixed return value type to String for the Map returned by
 *           the getCommandParams function.
 *
 *           Revision 1.5.2.17  2002/04/28 22:42:54  sord
 *           changed column command_name to command_desc
 *
 *           Revision 1.5.2.16  2002/04/28 22:31:40  sord
 *           Added getCommandParamName function
 *
 *           Revision 1.5.2.15  2002/04/28 03:23:14  sord
 *           Added getCommandParams function.
 *
 *           Revision 1.5.2.14  2002/04/27 07:43:36  sord
 *           Allow the listId and commandId to be cleared to 0 even if the job is active.
 *
 *           Revision 1.5.2.13  2002/04/27 07:25:35  sord
 *           Fixed so commandId of 0 can be inserted (to indication no command).
 *
 *           Revision 1.5.2.12  2002/04/25 08:40:31  sord
 *           Added additional functions required for working with job detail records.
 *
 *           Revision 1.5.2.11  2002/04/25 04:52:35  sord
 *           Initial version.
 *
 *           Revision 1.5.2.10  2002/04/22 02:07:04  apps
 *           Added functions for inserting/updating command parameters.
 *
 *           Revision 1.5.2.9  2002/04/21 23:22:05  apps
 *           Added functions to return jobDetail information
 *
 *           Revision 1.5.2.8  2002/04/21 22:21:58  apps
 *           Added functions to set job properties.
 *
 *           Revision 1.5.2.7  2002/04/15 06:31:55  apps
 *           Fixed column name in getCommandId
 *
 *           Revision 1.5.2.6  2002/04/15 06:12:24  apps
 *           Replaced tabs with spaces.
 *           Added data accessors to EmailList classes for name and groupId
 *
 *           Revision 1.5.2.5  2002/04/15 06:01:10  apps
 *           Added accessor functions to access more data info.
 *           Fixed problem in EmailJob where it wouldn't increment the seq_id if the
 *           job failed to create.
 *
 *           Revision 1.5.2.4  2002/04/15 05:21:14  apps
 *           Advance recordset before getting seqId.
 *
 *           Revision 1.5.2.3  2002/04/15 04:13:45  apps
 *           Made static references public and move all statics to EmailJobBean.
 *
 *           Revision 1.5.2.2  2002/04/15 04:06:05  apps
 *           Modified to use database sequences instead of queries to get ids.
 *           This is a more reliable method, should multiple users update at the
 *           same time and it also eliminates problems that can arise from
 *           removing a record and then re-adding a record with the same id.
 *
 *           Revision 1.5.2.1  2002/04/11 18:20:28  apps
 *           SB -- readded EmailServices
 *
 *           Revision 1.5  2002/04/11 08:06:04  apps
 *           Fix SQL INSERT statements (had double left parens '((')
 *
 *           Revision 1.4  2002/04/09 10:14:04  apps
 *           Initial implementation.
 *
 *           Revision 1.3  2002/04/05 04:23:38  apps
 *           Implemented createEmailJob function
 *
 *           Revision 1.2  2002/04/05 04:20:48  apps
 *           Fixed formatting by replacing tabs with spaces.
 *
 *           Revision 1.1.1.1  2002/04/02 10:42:29  apps
 *           no message
 *
 *           Revision 1.1.2.1  2002/04/02 10:34:32  apps
 *           Initial version.
 *           Interface declared.
 *
 */
public class EmailJobBean extends BaseEJB {

    // XXX the following need to come from the config file, not hardcoded!
    public static final int JOB_TYPE_EMAIL_PRE = 1;
    public static final int JOB_TYPE_EMAIL_POST = 2;
    public static final int JOB_STATUS_CREATING = 0;
    public static final int JOB_STATUS_READY = 1;
    public static final int JOB_STATUS_ACTIVE = 2;
    public static final int JOB_STATUS_COMPLETE = 3;
    public static final int JOB_STATUS_INCOMPLETE = 4;
    public static final int JOB_STATUS_CANCELED = 5;
    public static final int JOB_SEQUENCE_ID = 70;
    public static final int JOB_DETAIL_SEQUENCE_ID = 71;
    public static final int EMAIL_TEMPLATE_SEQUENCE_ID = 72;
    public static final int EMAIL_LIST_SEQUENCE_ID = 73;

    public void ejbCreate () { }
    
    private static Category trace = Category.getInstance( EmailJobBean.class.getName() );
    
    public int createEmailJob(    int templateId, 
                                int listId, 
                                int commandId, 
                                Date startAfter, 
                                Date stopBefore, 
                                String fromAddress,
                                String fromPersonal,
                                String subject ) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps1 = null;
        java.sql.PreparedStatement ps2 = null;
        java.sql.PreparedStatement ps3 = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int jobId = 0;
        int rowsAdded;
        int rowsUpdated;

        trace.debug("New email job requested (template_id " + templateId
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
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL_JTS");
            conn = ds.getConnection();
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
            ps2.setInt(2, JOB_TYPE_EMAIL_PRE);
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
        } catch ( Exception dberr ) {
            trace.error("Failed to create email job", dberr);
            throw new RemoteException("Failed to create email job", dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                trace.error("Failed to close database context", ctxerr); } 
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                trace.error("Failed to close database connection", connerr); }
            }
        }
        return jobId;
    }
    
    public void cancelEmailJob(    int jobId ) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rowsUpdated;

        trace.debug("Cancel email job requested (job_id " + jobId + ")");
           
        /* 
         * Change the job's status to canceled if the current status 
         * is ACTIVE or READY.
         */
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

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
                trace.debug("Cancel request for job_id " + jobId 
                        + " had no effect."
                        + " Either the job is not ready or active,"
                        + " or the job does not exist.");
            } else {
                if (rowsUpdated != 1) {
                    trace.warn("Cancel request did not update just a single"
                            + " record (job_id " + jobId + " " + rowsUpdated
                            + " records updated).");
                }
            }
        } catch ( Exception dberr ) {
            trace.error("Failed to cancel email job", dberr);
            throw new RemoteException("Failed to cancel email job", dberr);
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

    public void resumeEmailJob(    int jobId ) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rowsUpdated;

        trace.debug("Resume email job requested (job_id " + jobId + ")");
           
        /* 
         * Change the job's status to READY if the current status 
         * is CANCELED.
         */
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

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
                trace.debug("Resume request for job_id " + jobId 
                        + " had no effect."
                        + " Either the job has not been canceled,"
                        + " or the job does not exist.");
            } else {
                if (rowsUpdated != 1) {
                    trace.warn("Resume request did not update just a single"
                            + " record (job_id " + jobId + ", " + rowsUpdated
                            + " records updated).");
                }
            }
        } catch ( Exception dberr ) {
            trace.error("Failed to resume email job", dberr);
            throw new RemoteException("Failed to resume email job", dberr);
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
    
    public int getJobTypeId(int jobId) throws RemoteException {
        return getIntField(jobId, "sched_job_type_id");
    }

    public String getJobTypeText(int jobId) throws RemoteException {
        return getJobTypeIdText(getJobTypeId(jobId));
    }

    public String getJobTypeIdText(int typeId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;
        String ret = null;

        trace.debug("getJobTypeIdText requested for typeId " + typeId);
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

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
        } catch ( Exception dberr ) {
            String err = "Failed to get name for typeId " + typeId; 
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
    
    public int getStatusId(int jobId) throws RemoteException {
        return getIntField(jobId, "sched_job_status_id");
    }

    public String getStatusText(int jobId) throws RemoteException {
        return getStatusIdText(getStatusId(jobId));
    }

    public String getStatusIdText(int statusId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;
        String ret = null;

        trace.debug("getStatusIdText requested for statusId " + statusId);
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

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
        } catch ( Exception dberr ) {
            String err = "Failed to get data for statusId " + statusId; 
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
    
    public Map getJobDetailResults(int jobId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;
        Map ret = new HashMap();

        trace.debug("getJobDetailResults requested for jobId " + jobId);
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

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
            for ( ; rs.next(); ) {
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
                for ( ; rs.next(); ) {
                    ret.put(new Integer(rs.getInt(1)), new Integer(rs.getInt(2)));
                }
                rs.close();
            }
        } catch ( Exception dberr ) {
            String err = "Failed to getJobDetailResults for jobId " + jobId; 
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

    public Object [] getJobDetailResults(int jobId, int firstRecordOffset, int lastRecordOffset) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;
        Object [] arrRet = new Object [3];
        Map ret = new HashMap();
        arrRet[0] = ret;
        arrRet[1] = new Integer(0);
        arrRet[2] = new Integer(0);

        trace.debug("getJobDetailResults requested for jobId " + jobId 
            + " range (" + firstRecordOffset + "," + lastRecordOffset + ")");
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

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
        } catch ( Exception dberr ) {
            String err = "Failed to getJobDetailResults for jobId " + jobId 
                + " range (" + firstRecordOffset + "," + lastRecordOffset + ")";
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
        
        return arrRet;
    }

    public String getJobDetailReason(int jobId, int jobDetailId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;
        String ret = null;

        trace.debug("getJobDetailReason requested for jobId " + jobId + ", jobDetailId " + jobDetailId);
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

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
            byte [] bytes = rs.getBytes(1);
            if (bytes != null)
                ret = new String(bytes);
            rs.close();
        } catch ( Exception dberr ) {
            String err = "Failed to get data for job " + jobId; 
            trace.error(err, dberr);
            throw  new RemoteException(err, dberr);
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

    public String getJobDetailData(int jobId, int jobDetailId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;
        String ret = null;

        trace.debug("getJobDetailData requested for jobId " + jobId + ", jobDetailId " + jobDetailId);
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

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
            byte [] bytes = rs.getBytes(1);
            if (bytes != null)
                ret = new String(bytes);
            rs.close();
        } catch ( Exception dberr ) {
            String err = "Failed to get data for job " + jobId; 
            trace.error(err, dberr);
            throw  new RemoteException(err, dberr);
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
    
    public boolean isJobDetailArchived(int jobId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;
        boolean ret = false;

        trace.debug("isJobDetailArchived requested for jobId " + jobId);
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

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
        } catch ( Exception dberr ) {
            String err = "Failed to get archive count for job " + jobId; 
            trace.error(err, dberr);
            throw  new RemoteException(err, dberr);
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
    
    public String getDetailStatusIdText(int jobDetailStatusId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;
        String ret = null;

        trace.debug("getDetailStatusIdText requested for jobDetailStatusId " 
                + jobDetailStatusId);
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

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
        } catch ( Exception dberr ) {
            String err = "Failed to get data for jobDetailStatusId " + jobDetailStatusId; 
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

    public int getTemplateId(int jobId) throws RemoteException {
        return getIntField(jobId, "email_template_id");
    }

    public int getListId(int jobId) throws RemoteException {
        return getIntField(jobId, "email_list_id");
    }
    
    public int getCommandId(int jobId) throws RemoteException {
        return getIntField(jobId, "command_id");
    }
    
    public String getCommandName(int jobId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;
        String ret = null;

        trace.debug("getCommandName requested for jobId " + jobId);
           
        int commandId = getCommandId(jobId);
        
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

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
        } catch ( Exception dberr ) {
            String err = "Failed to get data for jobId " + jobId; 
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

    public Date getStartAfterDate(int jobId) throws RemoteException {
        return getDateField(jobId, "start_after_date");
    }
    
    public Date getStopBeforeDate(int jobId) throws RemoteException {
        return getDateField(jobId, "end_before_date");
    }
    
    public String getFromAddress(int jobId) throws RemoteException {
        return getStringField(jobId, "from_address");
    }
    
    public String getFromPersonal(int jobId) throws RemoteException {
        return getStringField(jobId, "from_personal");
    }
    
    public String getSubject(int jobId) throws RemoteException {
        return getStringField(jobId, "subject");
    }

    private int getIntField(int jobId, String fieldName) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;
        int ret = 0;

        trace.debug("getIntField requested for jobId " + jobId + ", field=" + fieldName);

        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

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
        } catch ( Exception dberr ) {
            String err = "Failed to get data for job " + jobId; 
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
    
    private Date getDateField(int jobId, String fieldName) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;
        Date ret = null;

        trace.debug("getDateField requested for jobId " + jobId + ", field=" + fieldName);
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

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
        } catch ( Exception dberr ) {
            String err = "Failed to get data for job " + jobId; 
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

    private String getStringField(int jobId, String fieldName) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;
        String ret = null;

        trace.debug("getStringField requested for jobId " + jobId + ", field=" + fieldName);
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

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
        } catch ( Exception dberr ) {
            String err = "Failed to get data for job " + jobId; 
            trace.error(err, dberr);
            throw  new RemoteException(err, dberr);
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
    
    public void setTemplateId(int jobId, int templateId) throws RemoteException {
        validateJobIsUpdatable(jobId);
        setField("sched_email_job", "sched_email_job_id", jobId,
                "email_template_id", templateId, null, null);
    }

    public void setListId(int jobId, int listId) throws RemoteException {
        if (listId != 0) 
            validateJobIsUpdatable(jobId);
        setField("sched_email_job", "sched_email_job_id", jobId,
                "email_list_id", listId, null, null);
    }
    
    public void setCommandId(int jobId, int commandId) throws RemoteException {
        if (commandId != 0) 
            validateJobIsUpdatable(jobId);
        setField("sched_email_job", "sched_email_job_id", jobId,
                "command_id", commandId, null, null);
    }
    
    public void setStartAfterDate(int jobId, Date startAfterDate) throws RemoteException {
        validateJobIsUpdatable(jobId);
        setField("sched_job", "sched_job_id", jobId,
                "start_after_date", 0, null, startAfterDate);
    }
    
    public void setStopBeforeDate(int jobId, Date stopBeforeDate) throws RemoteException {
        validateJobIsUpdatable(jobId);
        setField("sched_job", "sched_job_id", jobId,
                "end_before_date", 0, null, stopBeforeDate);
    }
    
    public void setFromAddress(int jobId, String fromAddress) throws RemoteException {
        validateJobIsUpdatable(jobId);
        setField("sched_email_job", "sched_email_job_id", jobId,
                "from_address", 0, fromAddress, null);
    }
    
    public void setFromPersonal(int jobId, String fromPersonal) throws RemoteException {
        validateJobIsUpdatable(jobId);
        setField("sched_email_job", "sched_email_job_id", jobId,
                "from_personal", 0, fromPersonal, null);
    }
    
    public void setSubject(int jobId, String subject) throws RemoteException {
        validateJobIsUpdatable(jobId);
        setField("sched_email_job", "sched_email_job_id", jobId,
                "subject", 0, subject, null);
    }

 /**
  * Updates a single field on a table with a primary key.
  */
    private void setField(String tableName, String idName, int id,
            String fieldName, int valueI, String valueS,
            Date valueD) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;

        trace.debug("setField requested for table " + tableName + ", " 
                + idName + " " + id + ", " + fieldName + " (" + valueI
                + ", " + valueS + ", " + valueD + ")");
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

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
                trace.debug("The update had no effect."
                        + " Most likely the job does not exist.");
                throw new Exception("The update command affected " 
                        + rows + " rows.");
            } else {
                if (rows != 1) {
                    trace.warn("The update request did not update just a single"
                            + " record (table " + tableName + ", " + idName +
                            " " + id + ", " + rows + " records updated).");
                }
            }
        } catch ( Exception dberr ) {
            String err = "Failed to update table " + tableName + ", " 
                + idName + " " + id + ")";
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

    public void setCommandParam(int jobId, int inputId, String param) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;

        trace.debug("setCommandParam requested for jobId " + jobId);
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

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
                    trace.warn("Failed to get max command_param_id,"
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
                    trace.debug("The update had no effect. Was the record removed?");
                    throw new Exception("The update command affected " + rows + " rows.");
                } else {
                    if (rows != 1) {
                        trace.warn("The update request did not update just a single"
                                + " record (" + rows + " records updated).");
                    }
                }
            }
        } catch ( Exception dberr ) {
            String err = "Failed to add/update commandParam";
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

    public Map getCommandParams(int jobId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;
        Map ret = new HashMap();

        trace.debug("getCommandParams requested for jobId " + jobId);
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

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
            for ( ; rs.next(); ) {
                ret.put(new Integer(rs.getInt(1)), rs.getString(2));
            }
        } catch ( Exception dberr ) {
            String err = "Failed to add/update commandParam";
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

    public String getCommandParamName(int inputId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;
        String ret = null;

        trace.debug("getCommandParamName requested for inputId " + inputId);
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

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
        } catch ( Exception dberr ) {
            String err = "Failed to lookup inputId " + inputId;
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
}


