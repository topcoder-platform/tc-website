package com.topcoder.shared.ejb.EmailServices;

import com.topcoder.shared.ejb.BaseEJB;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;

import java.rmi.RemoteException;
import java.util.*;

/**
 *
 * @see EmailList
 *
 * @author   Eric Ellingson
 * @version  $Revision$
 */
public class EmailListBean extends BaseEJB {
    /**
     *
     */
    public void ejbCreate() {
    }

    private static Logger log = Logger.getLogger(EmailListBean.class);

    /**
     *
     * @param group
     * @param name
     * @return
     * @throws RemoteException
     */
    public int createList(int group, String name) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;
        int id = 1;

        log.debug("Create list requested (group " + group + ", name " + name + ")");

        try {
            conn = DBMS.getConnection("TC_EMAIL");

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
        } catch (Exception dberr) {
            String err = "Failed to create list";
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
     * @param listId
     * @param data
     * @return
     * @throws RemoteException
     */
    public int addMember(int listId, String data) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;
        int id = 1;

        log.debug("add list member requested (list " + listId + ")");

        try {
            conn = DBMS.getConnection("TC_EMAIL");

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
        } catch (Exception dberr) {
            String err = "Failed to create list";
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
     * @param listId
     * @param memberId
     * @throws RemoteException
     */
    public void removeMember(int listId, int memberId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;

        log.debug("Remove list member requested (list " + listId + ", member " + memberId + ")");

        try {
            conn = DBMS.getConnection("TC_EMAIL");

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
                log.debug("Removal of list member " + listId + ":" + memberId
                        + " had no effect."
                        + " Most likely the member does not exist.");
                throw new Exception("delete command affected " + rows + " rows.");
            } else {
                if (rows != 1) {
                    log.warn("Update request did not remove just a single"
                            + " record (id " + listId + ":" + memberId + ", " + rows
                            + " records removed).");
                }
            }
        } catch (Exception dberr) {
            String err = "Failed to remove list member";
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
    public Map getLists() throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;
        Map ret = new HashMap();

        log.debug("getLists requested");

        try {
            conn = DBMS.getConnection("TC_EMAIL");

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT");
            sqlStmt.append(" email_list_id");
            sqlStmt.append(",");
            sqlStmt.append(" email_list_name");
            sqlStmt.append(" FROM");
            sqlStmt.append(" email_list");
            ps = conn.prepareStatement(sqlStmt.toString());
            rs = ps.executeQuery();
            for (; rs.next();) {
                ret.put(new Integer(rs.getInt(1)), rs.getString(2));
            }
            rs.close();
        } catch (Exception dberr) {
            String err = "Failed to get list names";
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
     * @param groupId
     * @return
     * @throws RemoteException
     */
    public Map getLists(int groupId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;
        Map ret = new HashMap();

        log.debug("getLists for group requested");

        try {
            conn = DBMS.getConnection("TC_EMAIL");

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
            for (; rs.next();) {
                ret.put(new Integer(rs.getInt(1)), rs.getString(2));
            }
            rs.close();
        } catch (Exception dberr) {
            String err = "Failed to get list names for group " + groupId;
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
     * @param listId
     * @return
     * @throws RemoteException
     */
    public Set getMembers(int listId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;
        Set ret = new HashSet();

        log.debug("getMembers for list requested");

        try {
            conn = DBMS.getConnection("TC_EMAIL");

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
            for (; rs.next();) {
                ret.add(new Integer(rs.getInt(1)));
            }
            rs.close();
        } catch (Exception dberr) {
            String err = "Failed to get members for list " + listId;
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
     * @param listId
     * @return
     * @throws RemoteException
     */
    public String getListName(int listId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;
        String ret = "";

        log.debug("getListName requested for list " + listId);

        try {
            conn = DBMS.getConnection("TC_EMAIL");

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
        } catch (Exception dberr) {
            String err = "Failed to get data for " + listId;
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
     * @param listId
     * @return
     * @throws RemoteException
     */
    public int getListGroupId(int listId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;
        int ret = 0;

        log.debug("getListGroupId requested for list " + listId);

        try {
            conn = DBMS.getConnection("TC_EMAIL");

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
        } catch (Exception dberr) {
            String err = "Failed to get data for " + listId;
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
     * @param listId
     * @param memberId
     * @return
     * @throws RemoteException
     */
    public String getData(int listId, int memberId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;
        String ret = "";

        log.debug("getData for list member requested");

        try {
            conn = DBMS.getConnection("TC_EMAIL");

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
                byte[] bytes = rs.getBytes(1);
                if (bytes != null)
                    ret = new String(bytes);
            }
            rs.close();
        } catch (Exception dberr) {
            String err = "Failed to get member data for " + listId + ":" + memberId;
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
     * @param listId
     * @param groupId
     * @throws RemoteException
     */
    public void setGroupId(int listId, int groupId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;

        log.debug("Update group id for list requested (list " + listId + ", group " + groupId + ")");

        try {
            conn = DBMS.getConnection("TC_EMAIL");

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
                log.debug("Update of list " + listId
                        + " had no effect."
                        + " Most likely the list does not exist.");
                throw new Exception("update command affected " + rows + " rows.");
            } else {
                if (rows != 1) {
                    log.warn("Update request did not update just a single"
                            + " record (id " + listId + ", " + rows
                            + " records updated).");
                }
            }
        } catch (Exception dberr) {
            String err = "Failed to update list";
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
     * @param listId
     * @param name
     * @throws RemoteException
     */
    public void setName(int listId, String name) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;

        log.debug("Update name for list requested (list " + listId + ", name " + name + ")");

        try {
            conn = DBMS.getConnection("TC_EMAIL");

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
                log.debug("Update of list " + listId
                        + " had no effect."
                        + " Most likely the list does not exist.");
                throw new Exception("update command affected " + rows + " rows.");
            } else {
                if (rows != 1) {
                    log.warn("Update request did not update just a single"
                            + " record (id " + listId + ", " + rows
                            + " records updated).");
                }
            }
        } catch (Exception dberr) {
            String err = "Failed to update list";
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
     * @param listId
     * @param memberId
     * @param data
     * @throws RemoteException
     */
    public void setData(int listId, int memberId, String data) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;

        log.debug("setData for list member requested");

        try {
            conn = DBMS.getConnection("TC_EMAIL");

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
                log.debug("Update of list " + listId + ", member " + memberId
                        + " had no effect."
                        + " Most likely the list or member does not exist.");
                throw new Exception("update command affected " + rows + " rows.");
            } else {
                if (rows != 1) {
                    log.warn("Update request did not update just a single"
                            + " record (list " + listId + ", member " + memberId
                            + ", " + rows + " records updated).");
                }
            }
        } catch (Exception dberr) {
            String err = "Failed to set member data for " + listId + ":" + memberId;
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

}

