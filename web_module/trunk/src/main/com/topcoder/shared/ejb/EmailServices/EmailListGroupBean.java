package com.topcoder.shared.ejb.EmailServices;

import java.util.*;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.ejb.BaseEJB;
import java.rmi.RemoteException;

/**
 * @see EmailListGroup
 *
 * @author   Eric Ellingson
 * @version  $Revision$
 * @internal Log of Changes:
 *           $Log$
 *           Revision 1.1.2.2  2002/07/09 23:41:27  gpaul
 *           switched to use com.topcoder.shared.util.logging.Logger
 *
 *           Revision 1.1.2.1  2002/07/09 14:39:25  gpaul
 *           no message
 *
 *           Revision 1.1  2002/05/21 15:45:15  steveb
 *           SB
 *
 *           Revision 1.4.2.2  2002/04/12 06:03:13  apps
 *           Fixed SQL DELETE syntax (added FROM)
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
public class EmailListGroupBean extends BaseEJB {
    public void ejbCreate () { }
    
    private static Logger log = Logger.getLogger(EmailListGroupBean.class);
    
    public int addGroup(String name) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        RemoteException result = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;
        int id = 1;

        log.debug("Add list group requested (name " + name + ")");
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT");
            sqlStmt.append(" MAX(email_list_group_id)");
            sqlStmt.append(" FROM");
            sqlStmt.append(" email_list_group_lu");
            ps = conn.prepareStatement(sqlStmt.toString());
            rs = ps.executeQuery();
            if (rs.next())
                id = rs.getInt(1) + 1;
            else
                log.warn("Failed to get max email list group id,"
                        + " using default value of 1.");
            rs.close();

            sqlStmt.setLength(0);
            sqlStmt.append(" INSERT INTO");
            sqlStmt.append(" email_list_group_lu (");
            sqlStmt.append(" email_list_group_id");
            sqlStmt.append(",");
            sqlStmt.append(" email_list_group_name");
            sqlStmt.append(") VALUES (?,?)");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, id);
            ps.setString(2, name);
            rows = ps.executeUpdate();
            if (rows != 1) {
                throw new Exception("insert command affected " + rows + " rows.");
            }
        } catch ( Exception dberr ) {
            String err = "Failed to add list group"; 
            log.error(err, dberr);
            result = new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                log.error("Failed to close database context", ctxerr); } 
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                log.error("Failed to close database connection", connerr); }
            }
            
            if (result != null) throw result;
        }
        
        return id;
    }

    public void updateGroup(int id, String name) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        RemoteException result = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;

        log.debug("Update list group requested (id " + id + ", name " + name + ")");
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" UPDATE");
            sqlStmt.append(" email_list_group_lu");
            sqlStmt.append(" SET");
            sqlStmt.append(" email_list_group_name = ?");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" email_list_group_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setString(1, name);
            ps.setInt(2, id);
            rows = ps.executeUpdate();
            if (rows == 0) {
                log.debug("Update of list group " + id 
                        + " had no effect."
                        + " Most likely the group does not exist.");
                throw new Exception("update command affected " + rows + " rows.");
            } else {
                if (rows != 1) {
                    log.warn("Update request did not update just a single"
                            + " record (id " + id + ", " + rows
                            + " records updated).");
                }
            }
        } catch ( Exception dberr ) {
            String err = "Failed to update list group"; 
            log.error(err, dberr);
            result = new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                log.error("Failed to close database context", ctxerr); } 
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                log.error("Failed to close database connection", connerr); }
            }
            
            if (result != null) throw result;
        }
    }

    public void removeGroup(int id) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        RemoteException result = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;

        log.debug("Remove list group requested (id " + id + ")");
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" DELETE FROM");
            sqlStmt.append(" email_list_group_lu");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" email_list_group_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, id);
            rows = ps.executeUpdate();
            if (rows == 0) {
                log.debug("Removal of list group " + id 
                        + " had no effect."
                        + " Most likely the group does not exist.");
                throw new Exception("delete command affected " + rows + " rows.");
            } else {
                if (rows != 1) {
                    log.warn("Update request did not remove just a single"
                            + " record (id " + id + ", " + rows
                            + " records removed).");
                }
            }
        } catch ( Exception dberr ) {
            String err = "Failed to remove list group"; 
            log.error(err, dberr);
            result = new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                log.error("Failed to close database context", ctxerr); } 
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                log.error("Failed to close database connection", connerr); }
            }
            
            if (result != null) throw result;
        }
    }

    public Map getGroups() throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        RemoteException result = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;
        Map ret = new HashMap();

        log.debug("getGroups for list groups requested");
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT");
            sqlStmt.append(" email_list_group_id");
            sqlStmt.append(",");
            sqlStmt.append(" email_list_group_name");
            sqlStmt.append(" FROM");
            sqlStmt.append(" email_list_group_lu");
            //sqlStmt.append(" ORDER BY");
            //sqlStmt.append(" email_list_group_id");
            ps = conn.prepareStatement(sqlStmt.toString());
            rs = ps.executeQuery();
            for ( ; rs.next(); ) {
                ret.put(new Integer(rs.getInt(1)), rs.getString(2));
            }
            rs.close();
        } catch ( Exception dberr ) {
            String err = "Failed to get list group names"; 
            log.error(err, dberr);
            result = new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                log.error("Failed to close database context", ctxerr); } 
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                log.error("Failed to close database connection", connerr); }
            }
            
            if (result != null) throw result;
        }
        
        return ret;
    }
    
    public String getName(int id) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        RemoteException result = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;
        String name = null;

        log.debug("getName for list group requested (id " + id + ")");
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT");
            sqlStmt.append(" email_list_group_name");
            sqlStmt.append(" FROM");
            sqlStmt.append(" email_list_group_lu");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" email_list_group_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                name = rs.getString(1);
            } else {
                throw new Exception("record not found");
            }
            rs.close();
        } catch ( Exception dberr ) {
            String err = "Failed to get list group name"; 
            log.error(err, dberr);
            result = new RemoteException(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if ( ctx != null ) { try { ctx.close(); } catch (Exception ctxerr) {
                log.error("Failed to close database context", ctxerr); } 
            }
            if ( conn != null ) { try { conn.close(); } catch (Exception connerr) {
                log.error("Failed to close database connection", connerr); }
            }
            
            if (result != null) throw result;
        }
        
        return name;
    }
}
