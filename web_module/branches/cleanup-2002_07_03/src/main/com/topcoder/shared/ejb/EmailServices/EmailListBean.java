package com.topcoder.shared.ejb.EmailServices;

import java.util.*;
import org.apache.log4j.Category;
import com.topcoder.shared.ejb.BaseEJB;
import java.rmi.RemoteException;

/**
 * @see EmailList
 *
 * @author   Eric Ellingson
 * @version  $Revision$
 * @internal Log of Changes:
 *           $Log$
 *           Revision 1.1  2002/05/21 15:45:15  steveb
 *           SB
 *
 *           Revision 1.5.2.11  2002/04/21 22:21:58  apps
 *           Added functions to set job properties.
 *
 *           Revision 1.5.2.10  2002/04/15 06:16:46  apps
 *           Added accesor functions for Name and GroupId.
 *
 *           Revision 1.5.2.9  2002/04/15 06:12:24  apps
 *           Replaced tabs with spaces.
 *           Added data accessors to EmailList classes for name and groupId
 *
 *           Revision 1.5.2.8  2002/04/15 05:21:14  apps
 *           Advance recordset before getting seqId.
 *
 *           Revision 1.5.2.7  2002/04/15 04:06:05  apps
 *           Modified to use database sequences instead of queries to get ids.
 *           This is a more reliable method, should multiple users update at the
 *           same time and it also eliminates problems that can arise from
 *           removing a record and then re-adding a record with the same id.
 *
 *           Revision 1.5.2.6  2002/04/12 07:54:49  apps
 *           Commented out line that should have been commented out last update.
 *
 *           Revision 1.5.2.5  2002/04/12 07:47:56  apps
 *           Fixed logic to deal with detail_id being a primary key.
 *
 *           Revision 1.5.2.4  2002/04/12 07:38:56  apps
 *           Fixed typo
 *
 *           Revision 1.5.2.3  2002/04/12 07:31:03  apps
 *           Fixed column name.
 *
 *           Revision 1.5.2.2  2002/04/12 06:03:13  apps
 *           Fixed SQL DELETE syntax (added FROM)
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
 *           Revision 1.3  2002/04/09 02:44:43  apps
 *           Fixed return type to match EmailList class
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
public class EmailListBean extends BaseEJB {
    public void ejbCreate () { }
    
    private static Category trace = Category.getInstance( EmailListBean.class.getName() );
    
    public int createList(int group, String name) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        RemoteException result = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;
        int id = 1;

        trace.debug("Create list requested (group " + group + ", name " + name + ")");
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);            
            sqlStmt.append(" EXECUTE PROCEDURE nextval(?)");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, EmailJobBean.EMAIL_LIST_SEQUENCE_ID);
            rs = ps.executeQuery();
            rs.next();
            id = rs.getInt(1);
            rs.close();

            sqlStmt.setLength(0);
            sqlStmt.append(" INSERT INTO");
            sqlStmt.append(" email_list (");
            sqlStmt.append(" email_list_id");
            sqlStmt.append(",");
            sqlStmt.append(" email_list_name");
            sqlStmt.append(",");
            sqlStmt.append(" email_list_group_id");
            sqlStmt.append(") VALUES (?,?,?)");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setInt(3, group);
            rows = ps.executeUpdate();
            if (rows != 1) {
                throw new Exception("insert command affected " + rows + " rows.");
            }
        } catch ( Exception dberr ) {
            String err = "Failed to create list"; 
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

    public int addMember(int listId, String data) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        RemoteException result = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;
        int id = 1;

        trace.debug("add list member requested (list " + listId + ")");
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);            
            sqlStmt.append(" EXECUTE PROCEDURE nextval(?)");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, EmailJobBean.EMAIL_LIST_SEQUENCE_ID);
            rs = ps.executeQuery();
            rs.next();
            id = rs.getInt(1);
            rs.close();

            sqlStmt.setLength(0);
            sqlStmt.append(" INSERT INTO");
            sqlStmt.append(" email_list_detail (");
            sqlStmt.append(" email_list_id");
            sqlStmt.append(",");
            sqlStmt.append(" email_list_detail_id");
            sqlStmt.append(",");
            sqlStmt.append(" data");
            sqlStmt.append(") VALUES (?,?,?)");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, listId);
            ps.setInt(2, id);
            ps.setBytes(3, data.getBytes());
            rows = ps.executeUpdate();
            if (rows != 1) {
                throw new Exception("insert command affected " + rows + " rows.");
            }
        } catch ( Exception dberr ) {
            String err = "Failed to create list"; 
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

    public void removeMember(int listId, int memberId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        RemoteException result = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;

        trace.debug("Remove list member requested (list " + listId + ", member " + memberId + ")");
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" DELETE FROM");
            sqlStmt.append(" email_list_detail");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" email_list_id = ?");
            sqlStmt.append(" AND");
            sqlStmt.append(" email_list_detail_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, listId);
            ps.setInt(2, memberId);
            rows = ps.executeUpdate();
            if (rows == 0) {
                trace.debug("Removal of list member " + listId + ":" + memberId 
                        + " had no effect."
                        + " Most likely the member does not exist.");
                throw new Exception("delete command affected " + rows + " rows.");
            } else {
                if (rows != 1) {
                    trace.warn("Update request did not remove just a single"
                            + " record (id " + listId + ":" + memberId + ", " + rows
                            + " records removed).");
                }
            }
        } catch ( Exception dberr ) {
            String err = "Failed to remove list member"; 
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

    public Map getLists() throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        RemoteException result = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;
        Map ret = new HashMap();

        trace.debug("getLists requested");
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT");
            sqlStmt.append(" email_list_id");
            sqlStmt.append(",");
            sqlStmt.append(" email_list_name");
            sqlStmt.append(" FROM");
            sqlStmt.append(" email_list");
            ps = conn.prepareStatement(sqlStmt.toString());
            rs = ps.executeQuery();
            for ( ; rs.next(); ) {
                ret.put(new Integer(rs.getInt(1)), rs.getString(2));
            }
            rs.close();
        } catch ( Exception dberr ) {
            String err = "Failed to get list names"; 
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
    
    public Map getLists(int groupId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        RemoteException result = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;
        Map ret = new HashMap();

        trace.debug("getLists for group requested");
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT");
            sqlStmt.append(" email_list_id");
            sqlStmt.append(",");
            sqlStmt.append(" email_list_name");
            sqlStmt.append(" FROM");
            sqlStmt.append(" email_list");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" email_list_group_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, groupId);
            rs = ps.executeQuery();
            for ( ; rs.next(); ) {
                ret.put(new Integer(rs.getInt(1)), rs.getString(2));
            }
            rs.close();
        } catch ( Exception dberr ) {
            String err = "Failed to get list names for group " + groupId; 
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
    
    public Set getMembers(int listId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        RemoteException result = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;
        Set ret = new HashSet();

        trace.debug("getMembers for list requested");
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT");
            sqlStmt.append(" email_list_detail_id");
            sqlStmt.append(" FROM");
            sqlStmt.append(" email_list_detail");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" email_list_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, listId);
            rs = ps.executeQuery();
            for ( ; rs.next(); ) {
                ret.add(new Integer(rs.getInt(1)));
            }
            rs.close();
        } catch ( Exception dberr ) {
            String err = "Failed to get members for list " + listId; 
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
    
    public String getListName(int listId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        RemoteException result = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;
        String ret = "";

        trace.debug("getListName requested for list " + listId);
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT");
            sqlStmt.append(" email_list_name");
            sqlStmt.append(" FROM");
            sqlStmt.append(" email_list");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" email_list_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, listId);
            rs = ps.executeQuery();
            rs.next();
            ret = rs.getString(1);
            rs.close();
        } catch ( Exception dberr ) {
            String err = "Failed to get data for " + listId; 
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

    public int getListGroupId(int listId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        RemoteException result = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;
        int ret = 0;

        trace.debug("getListGroupId requested for list " + listId);
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT");
            sqlStmt.append(" email_list_group_id");
            sqlStmt.append(" FROM");
            sqlStmt.append(" email_list");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" email_list_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, listId);
            rs = ps.executeQuery();
            rs.next();
            ret = rs.getInt(1);
            rs.close();
        } catch ( Exception dberr ) {
            String err = "Failed to get data for " + listId; 
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

    public String getData(int listId, int memberId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        RemoteException result = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;
        String ret = "";

        trace.debug("getData for list member requested");
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT");
            sqlStmt.append(" data");
            sqlStmt.append(" FROM");
            sqlStmt.append(" email_list_detail");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" email_list_id = ?");
            sqlStmt.append(" AND");
            sqlStmt.append(" email_list_detail_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, listId);
            ps.setInt(2, memberId);
            rs = ps.executeQuery();
            if (rs.next()) {
                byte [] bytes = rs.getBytes(1);
                if (bytes != null)
                    ret = new String(bytes);
            }
            rs.close();
        } catch ( Exception dberr ) {
            String err = "Failed to get member data for " + listId + ":" + memberId; 
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

    public void setGroupId(int listId, int groupId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        RemoteException result = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;

        trace.debug("Update group id for list requested (list " + listId + ", group " + groupId + ")");
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" UPDATE");
            sqlStmt.append(" email_list");
            sqlStmt.append(" SET");
            sqlStmt.append(" email_list_group_id = ?");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" email_list_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, groupId);
            ps.setInt(2, listId);
            rows = ps.executeUpdate();
            if (rows == 0) {
                trace.debug("Update of list " + listId 
                        + " had no effect."
                        + " Most likely the list does not exist.");
                throw new Exception("update command affected " + rows + " rows.");
            } else {
                if (rows != 1) {
                    trace.warn("Update request did not update just a single"
                            + " record (id " + listId + ", " + rows
                            + " records updated).");
                }
            }
        } catch ( Exception dberr ) {
            String err = "Failed to update list"; 
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

    public void setName(int listId, String name) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        RemoteException result = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;

        trace.debug("Update name for list requested (list " + listId + ", name " + name + ")");
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" UPDATE");
            sqlStmt.append(" email_list");
            sqlStmt.append(" SET");
            sqlStmt.append(" email_list_name = ?");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" email_list_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setString(1, name);
            ps.setInt(2, listId);
            rows = ps.executeUpdate();
            if (rows == 0) {
                trace.debug("Update of list " + listId 
                        + " had no effect."
                        + " Most likely the list does not exist.");
                throw new Exception("update command affected " + rows + " rows.");
            } else {
                if (rows != 1) {
                    trace.warn("Update request did not update just a single"
                            + " record (id " + listId + ", " + rows
                            + " records updated).");
                }
            }
        } catch ( Exception dberr ) {
            String err = "Failed to update list"; 
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
    
    public void setData(int listId, int memberId, String data) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        RemoteException result = null;
        StringBuffer sqlStmt = new StringBuffer( 500 );
        int rows;

        trace.debug("setData for list member requested");
           
        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" UPDATE");
            sqlStmt.append(" email_list_detail");
            sqlStmt.append(" SET");
            sqlStmt.append(" data = ?");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" email_list_id = ?");
            sqlStmt.append(" AND");
            sqlStmt.append(" email_list_detail_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setBytes(1, data.getBytes());
            ps.setInt(2, listId);
            ps.setInt(3, memberId);
            rows = ps.executeUpdate();
            if (rows == 0) {
                trace.debug("Update of list " + listId + ", member " + memberId
                        + " had no effect."
                        + " Most likely the list or member does not exist.");
                throw new Exception("update command affected " + rows + " rows.");
            } else {
                if (rows != 1) {
                    trace.warn("Update request did not update just a single"
                            + " record (list " + listId + ", member " + memberId
                            + ", " + rows + " records updated).");
                }
            }
        } catch ( Exception dberr ) {
            String err = "Failed to set member data for " + listId + ":" + memberId; 
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

