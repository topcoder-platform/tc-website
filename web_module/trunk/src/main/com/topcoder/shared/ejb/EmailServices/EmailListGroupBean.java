package com.topcoder.shared.ejb.EmailServices;

import com.topcoder.shared.ejb.BaseEJB;
import com.topcoder.shared.util.logging.Logger;

import java.rmi.RemoteException;
import java.util.HashMap;
import java.util.Map;

/**
 * @see EmailListGroup
 *
 * @author   Eric Ellingson
 * @version  $Revision$
 */
public class EmailListGroupBean extends BaseEJB {
    /**
     *
     */
    public void ejbCreate() {
    }

    private static Logger log = Logger.getLogger(EmailListGroupBean.class);

    /**
     *
     * @param name
     * @return
     * @throws RemoteException
     */
    public int addGroup(String name) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
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
        } catch (Exception dberr) {
            String err = "Failed to add list group";
            log.error(err, dberr);
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
     * @param id
     * @param name
     * @throws RemoteException
     */
    public void updateGroup(int id, String name) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
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
        } catch (Exception dberr) {
            String err = "Failed to update list group";
            log.error(err, dberr);
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
     * @param id
     * @throws RemoteException
     */
    public void removeGroup(int id) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
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
        } catch (Exception dberr) {
            String err = "Failed to remove list group";
            log.error(err, dberr);
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
    public Map getGroups() throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
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
            for (; rs.next();) {
                ret.put(new Integer(rs.getInt(1)), rs.getString(2));
            }
            rs.close();
        } catch (Exception dberr) {
            String err = "Failed to get list group names";
            log.error(err, dberr);
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
     * @param id
     * @return
     * @throws RemoteException
     */
    public String getName(int id) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
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
        } catch (Exception dberr) {
            String err = "Failed to get list group name";
            log.error(err, dberr);
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

        return name;
    }
}
