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

public class WebMenuTypeBean implements javax.ejb.SessionBean {

    static Hashtable cache = new Hashtable();
    public SessionContext context = null;
    public static int MAXSIZE = -1;
    public static final DecimalFormat fmt0 = new DecimalFormat("0000000000");

    public String getKey(Integer menu_type_id) {
        String key = "";

        key += fmt0.format(menu_type_id);
        return (key);
    }

    public String getKey(WebMenuTypeObject obj) {
        return (getKey(obj.menu_type_id));
    }

    public void create(Integer menu_type_id, String menu_type_desc, Integer modify_by, Date modify_date) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;

        String insert = "INSERT INTO WEB_MENU_TYPE VALUES (  " + menu_type_id + ", '" + menu_type_desc + "', " + modify_by + ", ? )";

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

    public void delete(Integer menu_type_id) throws SQLException {
        Connection conn = null;
        String delete = "DELETE FROM WEB_MENU_TYPE WHERE MENU_TYPE_ID = " + menu_type_id;
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
        cache.remove(getKey(menu_type_id));
        try {
            if (ps != null) ps.close();
        } catch (Exception f) {
        }
        try {
            if (conn != null) conn.close();
        } catch (Exception f) {
        }
    }

    public WebMenuTypeObject request(int cmd, WebMenuTypeObject obj) throws SQLException {

        switch (cmd) {

            case WebMenuType.INSERT:
                create(obj.menu_type_id, obj.menu_type_desc, obj.modify_by, obj.modify_date);
                break;

            case WebMenuType.SELECT:
                obj = getRecord(obj.menu_type_id);
                if (obj == null)
                    throw new EJBException(
                            "no matching record");
                break;

            case WebMenuType.UPDATE:
                putRecord(obj.menu_type_id, obj.menu_type_desc, obj.modify_by, obj.modify_date);
                break;

            case WebMenuType.DELETE:
                delete(obj.menu_type_id);
                break;

        }
        return (obj);
    }

    public void setMenuTypeDesc(Integer menu_type_id, String menu_type_desc) throws SQLException {
        putRecord(menu_type_id, menu_type_desc, null, null);
    }

    public String getMenuTypeDesc(Integer menu_type_id) throws SQLException {
        WebMenuTypeObject obj = null;
        String result;

        obj = getRecord(menu_type_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.menu_type_desc);
    }

    public void setModifyBy(Integer menu_type_id, Integer modify_by) throws SQLException {
        putRecord(menu_type_id, null, modify_by, null);
    }

    public Integer getModifyBy(Integer menu_type_id) throws SQLException {
        WebMenuTypeObject obj = null;
        Integer result;

        obj = getRecord(menu_type_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.modify_by);
    }

    public void setModifyDate(Integer menu_type_id, Date modify_date) throws SQLException {
        putRecord(menu_type_id, null, null, modify_date);
    }

    public Date getModifyDate(Integer menu_type_id) throws SQLException {
        WebMenuTypeObject obj = null;
        Date result;

        obj = getRecord(menu_type_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.modify_date);
    }

    private class WebMenuTypeObjectWrapper {
        WebMenuTypeObject obj;
        Date lastUsed;

        WebMenuTypeObjectWrapper() {
            lastUsed = new Date(System.currentTimeMillis());
        }
    }

    private class RecordNotFoundException extends Exception {
    }

    private WebMenuTypeObject getRecord(Integer menu_type_id) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String key = getKey(menu_type_id);
        WebMenuTypeObject obj = null;
        WebMenuTypeObjectWrapper wobj = (WebMenuTypeObjectWrapper) cache.get(key);
        if (wobj != null) {
            wobj.lastUsed = new Date(System.currentTimeMillis());
            return (wobj.obj);
        }
        obj = new WebMenuTypeObject();
        String query = "SELECT * FROM WEB_MENU_TYPE WHERE MENU_TYPE_ID = " + menu_type_id;
        InputStream is = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (!rs.next())
                throw new RecordNotFoundException();
            obj.menu_type_id = new Integer(rs.getInt(1));
            if (rs.wasNull())
                obj.menu_type_id = null;
            obj.menu_type_desc = rs.getString(2);
            if (rs.wasNull())
                obj.menu_type_desc = null;
            obj.modify_by = new Integer(rs.getInt(3));
            if (rs.wasNull())
                obj.modify_by = null;
            obj.modify_date = rs.getDate(4);
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
            wobj = new WebMenuTypeObjectWrapper();
            wobj.obj = obj;
            if (cache.size() >= MAXSIZE)
                trimCache();
            cache.put(key, wobj);
        }
        return (obj);
    }

    public int putRecord(Integer menu_type_id, String menu_type_desc, Integer modify_by, Date modify_date) throws SQLException {
        String identifier = getKey(menu_type_id);
        PreparedStatement ps = null;
        Connection conn = null;
        StringBuffer update = new StringBuffer();
        WebMenuTypeObjectWrapper obj = null;
        int count = 0;

        obj = (WebMenuTypeObjectWrapper) cache.get(getKey(menu_type_id));
        update.append("UPDATE WEB_MENU_TYPE SET ");
        if (menu_type_desc != null) {
            if (obj != null)
                obj.obj.menu_type_desc = menu_type_desc;
            if (count > 0)
                update.append(", ");
            update.append("MENU_TYPE_DESC = '" + menu_type_desc + "'");
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
        update.append(" WHERE MENU_TYPE_ID = " + menu_type_id);
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
        WebMenuTypeObjectWrapper oldest = null;
        WebMenuTypeObjectWrapper current = null;
        Enumeration e;

        e = cache.elements();
        while (e.hasMoreElements()) {
            current = (WebMenuTypeObjectWrapper) e.nextElement();
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
