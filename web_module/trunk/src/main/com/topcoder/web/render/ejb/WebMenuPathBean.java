package com.topcoder.web.render.ejb;

import javax.ejb.EJBException;
import javax.ejb.SessionContext;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.io.InputStream;
import java.sql.*;
import java.text.DecimalFormat;
import java.util.Enumeration;
import java.util.Hashtable;

public class WebMenuPathBean implements javax.ejb.SessionBean {

    static Hashtable cache = new Hashtable();
    public SessionContext context = null;
    public static int MAXSIZE = -1;
    public static final DecimalFormat fmt0 = new DecimalFormat("0000000000");

    public String getKey(Integer menu_hdr_id) {
        String key = "";

        key += fmt0.format(menu_hdr_id);
        return (key);
    }

    public String getKey(WebMenuPathObject obj) {
        return (getKey(obj.menu_hdr_id));
    }

    public void create(Integer menu_hdr_id, Integer menu_id, Integer parent_id, Integer menu_order, Integer modify_by, Date modify_date) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;

        String insert = "INSERT INTO WEB_MENU_PATH VALUES (  " + menu_hdr_id + ", " + menu_id + ", " + parent_id + ", " + menu_order + ", " + modify_by + ", ? )";

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(insert);
            ps.setDate(1, modify_date);
            ps.executeUpdate();
        } catch (SQLException e) {
            try {
                if (ps != null) ps.close();
            } catch (Exception f) {
            }
            try {
                if (conn != null) conn.close();
            } catch (Exception f) {
            }
            throw(e);
        } catch (Exception e) {
        }
        try {
            if (ps != null) ps.close();
        } catch (Exception f) {
        }
        try {
            if (conn != null) conn.close();
        } catch (Exception f) {
        }
    }

    public void delete(Integer menu_hdr_id) throws SQLException {
        Connection conn = null;
        String delete = "DELETE FROM WEB_MENU_PATH WHERE MENU_HDR_ID = " + menu_hdr_id;
        PreparedStatement ps = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(delete);
            ps.executeUpdate();
        } catch (SQLException e) {
            try {
                if (ps != null) ps.close();
            } catch (Exception f) {
            }
            try {
                if (conn != null) conn.close();
            } catch (Exception f) {
            }
            throw(e);
        }
        cache.remove(getKey(menu_hdr_id));
        try {
            if (ps != null) ps.close();
        } catch (Exception f) {
        }
        try {
            if (conn != null) conn.close();
        } catch (Exception f) {
        }
    }

    public WebMenuPathObject request(int cmd, WebMenuPathObject obj) throws SQLException {

        switch (cmd) {

            case WebMenuPath.INSERT:
                create(obj.menu_hdr_id, obj.menu_id, obj.parent_id, obj.menu_order, obj.modify_by, obj.modify_date);
                break;

            case WebMenuPath.SELECT:
                obj = getRecord(obj.menu_hdr_id);
                if (obj == null)
                    throw new EJBException(
                            "no matching record");
                break;

            case WebMenuPath.UPDATE:
                putRecord(obj.menu_hdr_id, obj.menu_id, obj.parent_id, obj.menu_order, obj.modify_by, obj.modify_date);
                break;

            case WebMenuPath.DELETE:
                delete(obj.menu_hdr_id);
                break;

        }
        return (obj);
    }

    public void setMenuId(Integer menu_hdr_id, Integer menu_id) throws SQLException {
        putRecord(menu_hdr_id, menu_id, null, null, null, null);
    }

    public Integer getMenuId(Integer menu_hdr_id) throws SQLException {
        WebMenuPathObject obj = null;
        Integer result;

        obj = getRecord(menu_hdr_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.menu_id);
    }

    public void setParentId(Integer menu_hdr_id, Integer parent_id) throws SQLException {
        putRecord(menu_hdr_id, null, parent_id, null, null, null);
    }

    public Integer getParentId(Integer menu_hdr_id) throws SQLException {
        WebMenuPathObject obj = null;
        Integer result;

        obj = getRecord(menu_hdr_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.parent_id);
    }

    public void setMenuOrder(Integer menu_hdr_id, Integer menu_order) throws SQLException {
        putRecord(menu_hdr_id, null, null, menu_order, null, null);
    }

    public Integer getMenuOrder(Integer menu_hdr_id) throws SQLException {
        WebMenuPathObject obj = null;
        Integer result;

        obj = getRecord(menu_hdr_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.menu_order);
    }

    public void setModifyBy(Integer menu_hdr_id, Integer modify_by) throws SQLException {
        putRecord(menu_hdr_id, null, null, null, modify_by, null);
    }

    public Integer getModifyBy(Integer menu_hdr_id) throws SQLException {
        WebMenuPathObject obj = null;
        Integer result;

        obj = getRecord(menu_hdr_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.modify_by);
    }

    public void setModifyDate(Integer menu_hdr_id, Date modify_date) throws SQLException {
        putRecord(menu_hdr_id, null, null, null, null, modify_date);
    }

    public Date getModifyDate(Integer menu_hdr_id) throws SQLException {
        WebMenuPathObject obj = null;
        Date result;

        obj = getRecord(menu_hdr_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.modify_date);
    }

    private class WebMenuPathObjectWrapper {
        WebMenuPathObject obj;
        Date lastUsed;

        WebMenuPathObjectWrapper() {
            lastUsed = new Date(System.currentTimeMillis());
        }
    }

    private class RecordNotFoundException extends Exception {
    }

    private WebMenuPathObject getRecord(Integer menu_hdr_id) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String key = getKey(menu_hdr_id);
        WebMenuPathObject obj = null;
        WebMenuPathObjectWrapper wobj = (WebMenuPathObjectWrapper) cache.get(key);
        if (wobj != null) {
            wobj.lastUsed = new Date(System.currentTimeMillis());
            return (wobj.obj);
        }
        obj = new WebMenuPathObject();
        String query = "SELECT * FROM WEB_MENU_PATH WHERE MENU_HDR_ID = " + menu_hdr_id;
        InputStream is = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (!rs.next())
                throw new RecordNotFoundException();
            obj.menu_hdr_id = new Integer(rs.getInt(1));
            if (rs.wasNull())
                obj.menu_hdr_id = null;
            obj.menu_id = new Integer(rs.getInt(2));
            if (rs.wasNull())
                obj.menu_id = null;
            obj.parent_id = new Integer(rs.getInt(3));
            if (rs.wasNull())
                obj.parent_id = null;
            obj.menu_order = new Integer(rs.getInt(4));
            if (rs.wasNull())
                obj.menu_order = null;
            obj.modify_by = new Integer(rs.getInt(5));
            if (rs.wasNull())
                obj.modify_by = null;
            obj.modify_date = rs.getDate(6);
            if (rs.wasNull())
                obj.modify_date = null;
            rs.close();
        } catch (SQLException e) {
            try {
                if (ps != null) ps.close();
            } catch (Exception f) {
            }
            try {
                if (conn != null) conn.close();
            } catch (Exception f) {
            }
            throw(e);
        } catch (Exception e) {
            obj = null;
        }
        try {
            if (ps != null) ps.close();
        } catch (Exception f) {
        }
        try {
            if (conn != null) conn.close();
        } catch (Exception f) {
        }
        if (MAXSIZE < 0)
            MAXSIZE = getMaxCacheSize();
        if (MAXSIZE > 0) {
            wobj = new WebMenuPathObjectWrapper();
            wobj.obj = obj;
            if (cache.size() >= MAXSIZE)
                trimCache();
            cache.put(key, wobj);
        }
        return (obj);
    }

    public int putRecord(Integer menu_hdr_id, Integer menu_id, Integer parent_id, Integer menu_order, Integer modify_by, Date modify_date) throws SQLException {
        String identifier = getKey(menu_hdr_id);
        PreparedStatement ps = null;
        Connection conn = null;
        StringBuffer update = new StringBuffer();
        WebMenuPathObjectWrapper obj = null;
        int count = 0;

        obj = (WebMenuPathObjectWrapper) cache.get(getKey(menu_hdr_id));
        update.append("UPDATE WEB_MENU_PATH SET ");
        if (menu_id != null) {
            if (obj != null)
                obj.obj.menu_id = menu_id;
            if (count > 0)
                update.append(", ");
            update.append("MENU_ID = " + menu_id.intValue());
            count++;
        }
        if (parent_id != null) {
            if (obj != null)
                obj.obj.parent_id = parent_id;
            if (count > 0)
                update.append(", ");
            update.append("PARENT_ID = " + parent_id.intValue());
            count++;
        }
        if (menu_order != null) {
            if (obj != null)
                obj.obj.menu_order = menu_order;
            if (count > 0)
                update.append(", ");
            update.append("MENU_ORDER = " + menu_order.intValue());
            count++;
        }
        if (modify_by != null) {
            if (obj != null)
                obj.obj.modify_by = modify_by;
            if (count > 0)
                update.append(", ");
            update.append("MODIFY_BY = " + modify_by.intValue());
            count++;
        }
        if (modify_date != null) {
            if (obj != null)
                obj.obj.modify_date = modify_date;
            if (count > 0)
                update.append(", ");
            update.append("MODIFY_DATE = '" + modify_date + "'");
            count++;
        }
        update.append(" WHERE MENU_HDR_ID = " + menu_hdr_id);
        if (count == 0)
            return (0);
        int rc = 0;
        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(update.toString());
            int index = 1;
            rc = ps.executeUpdate();
        } catch (SQLException e) {
            try {
                if (ps != null) ps.close();
            } catch (Exception f) {
            }
            try {
                if (conn != null) conn.close();
            } catch (Exception f) {
            }
            throw(e);
        } catch (Exception e) {
        }
        try {
            if (ps != null) ps.close();
        } catch (Exception f) {
        }
        try {
            if (conn != null) conn.close();
        } catch (Exception f) {
        }
        return (rc);
    }

    private void trimCache() {
        WebMenuPathObjectWrapper oldest = null;
        WebMenuPathObjectWrapper current = null;
        Enumeration e;

        e = cache.elements();
        while (e.hasMoreElements()) {
            current = (WebMenuPathObjectWrapper) e.nextElement();
            if (oldest == null)
                oldest = current;
            else {
                if (current.lastUsed.compareTo(oldest.lastUsed) < 0)
                    oldest = current;
            }
        }
        cache.remove(getKey(oldest.obj));
    }

    public static void clearCache() {
        cache.clear();
    }

    private int getMaxCacheSize() {
        try {
            InitialContext ctx = new InitialContext();
            Integer val = (Integer) ctx.lookup("java:comp/env/MaxCacheSize");
            return (val.intValue());
        } catch (NamingException e) {
            throw new EJBException(e);
        }
    }

    public void ejbCreate() {
    }

    public void ejbRemove() {
    }

    public void setSessionContext(SessionContext context) {
        this.context = context;
    }

    public void ejbActivate() {
    }

    public void ejbPassivate() {
    }
}
