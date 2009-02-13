package com.topcoder.server.ejb.EmailServices;

import java.util.*;
import org.apache.log4j.Category;
import com.topcoder.server.ejb.BaseEJB;
import java.rmi.RemoteException;

/**
 * @see EmailTemplate
 *
 * @author   Eric Ellingson
 * @version  $Revision$
 * @internal Log of Changes:
 *           $Log$
 *           Revision 1.4.2.5  2002/04/15 06:16:46  apps
 *           Added accesor functions for Name and GroupId.
 *
 *           Revision 1.4.2.4  2002/04/15 05:21:14  apps
 *           Advance recordset before getting seqId.
 *
 *           Revision 1.4.2.3  2002/04/15 04:13:45  apps
 *           Made static references public and move all statics to EmailJobBean.
 *
 *           Revision 1.4.2.2  2002/04/15 04:06:05  apps
 *           Modified to use database sequences instead of queries to get ids.
 *           This is a more reliable method, should multiple users update at the
 *           same time and it also eliminates problems that can arise from
 *           removing a record and then re-adding a record with the same id.
 *
 *           Revision 1.4.2.1  2002/04/11 18:20:28  apps
 *           SB -- readded EmailServices
 *
 *           Revision 1.4  2002/04/11 08:06:04  apps
 *           Fix SQL INSERT statements (had double left parens '((')
 *
 *           Revision 1.3  2002/04/09 10:14:04  apps
 *           Initial implementation.
 *
 *           Revision 1.2  2002/04/05 04:18:38  apps
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
public class EmailTemplateBean extends BaseEJB {

    public void ejbCreate () { }
    
    private static Category trace = Category.getInstance( EmailTemplateBean.class.getName() );
    
    public int createTemplate(int group, String name, String data) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        RemoteException result = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;
        int id = 1;

        trace.debug("Create template requested (group " + group + ", name " + name + ")");
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);            
            sqlStmt.append(" EXECUTE PROCEDURE nextval(?)");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, EmailJobBean.EMAIL_TEMPLATE_SEQUENCE_ID);
            rs = ps.executeQuery();
            rs.next();
            id = rs.getInt(1);
            rs.close();

            sqlStmt.setLength(0);
            sqlStmt.append(" INSERT INTO");
            sqlStmt.append(" email_template (");
            sqlStmt.append(" email_template_id");
            sqlStmt.append(",");
            sqlStmt.append(" email_template_name");
            sqlStmt.append(",");
            sqlStmt.append(" email_template_group_id");
            sqlStmt.append(",");
            sqlStmt.append(" data");
            sqlStmt.append(") VALUES (?,?,?,?)");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setInt(3, group);
            ps.setBytes(4, data.getBytes());
            rows = ps.executeUpdate();
            if (rows != 1) {
                throw new Exception("insert command affected " + rows + " rows.");
            }
        } catch ( Exception dberr ) {
            String err = "Failed to create template"; 
            trace.error(err, dberr);
            result = new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                trace.error("Failed to close database context", ctxerr); } 
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                trace.error("Failed to close database connection", connerr); }
            }
            
            if (result != null) throw result;
        }
        
        return id;
    }

    public Map getTemplates() throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        RemoteException result = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;
        Map ret = new HashMap();

        trace.debug("getTemplates requested");
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT");
            sqlStmt.append(" email_template_id");
            sqlStmt.append(",");
            sqlStmt.append(" email_template_name");
            sqlStmt.append(" FROM");
            sqlStmt.append(" email_template");
            ps = conn.prepareStatement(sqlStmt.toString());
            rs = ps.executeQuery();
            for ( ; rs.next(); ) {
                ret.put(new Integer(rs.getInt(1)), rs.getString(2));
            }
            rs.close();
        } catch ( Exception dberr ) {
            String err = "Failed to get template names"; 
            trace.error(err, dberr);
            result = new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                trace.error("Failed to close database context", ctxerr); } 
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                trace.error("Failed to close database connection", connerr); }
            }
            
            if (result != null) throw result;
        }
        
        return ret;
    }
    
    public Map getTemplates(int groupId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        RemoteException result = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;
        Map ret = new HashMap();

        trace.debug("getTemplates for group requested");
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT");
            sqlStmt.append(" email_template_id");
            sqlStmt.append(",");
            sqlStmt.append(" email_template_name");
            sqlStmt.append(" FROM");
            sqlStmt.append(" email_template");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" email_template_group_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, groupId);
            rs = ps.executeQuery();
            for ( ; rs.next(); ) {
                ret.put(new Integer(rs.getInt(1)), rs.getString(2));
            }
            rs.close();
        } catch ( Exception dberr ) {
            String err = "Failed to get template names for group " + groupId; 
            trace.error(err, dberr);
            result = new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                trace.error("Failed to close database context", ctxerr); } 
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                trace.error("Failed to close database connection", connerr); }
            }
            
            if (result != null) throw result;
        }
        
        return ret;
    }
    
    public String getTemplateName(int templateId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        RemoteException result = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;
        String ret = "";

        trace.debug("getTemplateName requested for template " + templateId);
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT");
            sqlStmt.append(" email_template_name");
            sqlStmt.append(" FROM");
            sqlStmt.append(" email_template");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" email_template_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, templateId);
            rs = ps.executeQuery();
            rs.next();
            ret = rs.getString(1);
            rs.close();
        } catch ( Exception dberr ) {
            String err = "Failed to get data for " + templateId; 
            trace.error(err, dberr);
            result = new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                trace.error("Failed to close database context", ctxerr); } 
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                trace.error("Failed to close database connection", connerr); }
            }
            
            if (result != null) throw result;
        }
        
        return ret;
    }

    public int getTemplateGroupId(int templateId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        RemoteException result = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;
        int ret = 0;

        trace.debug("getTemplateGroupId requested for template " + templateId);
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT");
            sqlStmt.append(" email_template_group_id");
            sqlStmt.append(" FROM");
            sqlStmt.append(" email_template");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" email_template_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, templateId);
            rs = ps.executeQuery();
            rs.next();
            ret = rs.getInt(1);
            rs.close();
        } catch ( Exception dberr ) {
            String err = "Failed to get data for " + templateId; 
            trace.error(err, dberr);
            result = new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                trace.error("Failed to close database context", ctxerr); } 
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                trace.error("Failed to close database connection", connerr); }
            }
            
            if (result != null) throw result;
        }
        
        return ret;
    }

    public String getData(int templateId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        RemoteException result = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;
        String ret = "";

        trace.debug("getData for template requested");
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT");
            sqlStmt.append(" data");
            sqlStmt.append(" FROM");
            sqlStmt.append(" email_template");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" email_template_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, templateId);
            rs = ps.executeQuery();
            if (rs.next()) {
                byte [] bytes = rs.getBytes(1);
                if (bytes != null)
                    ret = new String(bytes);
            }
            rs.close();
        } catch ( Exception dberr ) {
            String err = "Failed to get data for template " + templateId; 
            trace.error(err, dberr);
            result = new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                trace.error("Failed to close database context", ctxerr); } 
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                trace.error("Failed to close database connection", connerr); }
            }
            
            if (result != null) throw result;
        }
        
        return ret;
    }

    public boolean isInUse(int templateId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        RemoteException result = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;
        int ret = 0;

        trace.debug("isInUse for template requested");
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT");
            sqlStmt.append(" COUNT(*)");
            sqlStmt.append(" FROM");
            sqlStmt.append(" sched_job s,");
            sqlStmt.append(" sched_email_job e");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" s.sched_job_id = e.sched_email_job_id");
            sqlStmt.append(" AND");
            sqlStmt.append(" e.email_template_id = ?");
            sqlStmt.append(" AND");
            sqlStmt.append(" (s.sched_job_status_id = ?");
            sqlStmt.append(" OR");
            sqlStmt.append("  s.sched_job_status_id = ?)");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, templateId);
            ps.setInt(2, EmailJobBean.JOB_STATUS_READY);
            ps.setInt(3, EmailJobBean.JOB_STATUS_ACTIVE);
            rs = ps.executeQuery();
            if (rs.next()) {
                ret = rs.getInt(1);
            }
            rs.close();
        } catch ( Exception dberr ) {
            String err = "Failed to get data for template " + templateId; 
            trace.error(err, dberr);
            result = new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                trace.error("Failed to close database context", ctxerr); } 
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                trace.error("Failed to close database connection", connerr); }
            }
            
            if (result != null) throw result;
        }
        
        return (ret>0);
    }

    public void setGroupId(int templateId, int groupId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        RemoteException result = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;

        trace.debug("Update group id for template requested (template " + templateId + ", group " + groupId + ")");
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" UPDATE");
            sqlStmt.append(" email_template");
            sqlStmt.append(" SET");
            sqlStmt.append(" email_template_group_id = ?");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" email_template_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, groupId);
            ps.setInt(2, templateId);
            rows = ps.executeUpdate();
            if (rows == 0) {
                trace.debug("Update of template " + templateId 
                        + " had no effect."
                        + " Most likely the template does not exist.");
                throw new Exception("update command affected " + rows + " rows.");
            } else {
                if (rows != 1) {
                    trace.warn("Update request did not update just a single"
                            + " record (id " + templateId + ", " + rows
                            + " records updated).");
                }
            }
        } catch ( Exception dberr ) {
            String err = "Failed to update template"; 
            trace.error(err, dberr);
            result = new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                trace.error("Failed to close database context", ctxerr); } 
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                trace.error("Failed to close database connection", connerr); }
            }
            
            if (result != null) throw result;
        }
    }
    
    public void setName(int templateId, String name) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        RemoteException result = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;

        trace.debug("Update name for template requested (template " + templateId + ", name " + name + ")");
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" UPDATE");
            sqlStmt.append(" email_template");
            sqlStmt.append(" SET");
            sqlStmt.append(" email_template_name = ?");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" email_template_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setString(1, name);
            ps.setInt(2, templateId);
            rows = ps.executeUpdate();
            if (rows == 0) {
                trace.debug("Update of template " + templateId 
                        + " had no effect."
                        + " Most likely the template does not exist.");
                throw new Exception("update command affected " + rows + " rows.");
            } else {
                if (rows != 1) {
                    trace.warn("Update request did not update just a single"
                            + " record (id " + templateId + ", " + rows
                            + " records updated).");
                }
            }
        } catch ( Exception dberr ) {
            String err = "Failed to update template"; 
            trace.error(err, dberr);
            result = new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                trace.error("Failed to close database context", ctxerr); } 
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                trace.error("Failed to close database connection", connerr); }
            }
            
            if (result != null) throw result;
        }
    }
    
    public void setData(int templateId, String data) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        RemoteException result = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;

        trace.debug("Update data for template requested (template " + templateId + ")");
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" UPDATE");
            sqlStmt.append(" email_template");
            sqlStmt.append(" SET");
            sqlStmt.append(" data = ?");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" email_template_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setBytes(1, data.getBytes());
            ps.setInt(2, templateId);
            rows = ps.executeUpdate();
            if (rows == 0) {
                trace.debug("Update of template " + templateId 
                        + " had no effect."
                        + " Most likely the template does not exist.");
                throw new Exception("update command affected " + rows + " rows.");
            } else {
                if (rows != 1) {
                    trace.warn("Update request did not update just a single"
                            + " record (id " + templateId + ", " + rows
                            + " records updated).");
                }
            }
        } catch ( Exception dberr ) {
            String err = "Failed to update template"; 
            trace.error(err, dberr);
            result = new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                trace.error("Failed to close database context", ctxerr); } 
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                trace.error("Failed to close database connection", connerr); }
            }
            
            if (result != null) throw result;
        }
    }
}
