package com.topcoder.web.render.ejb;

import com.topcoder.shared.util.DBMS;

import javax.ejb.EJBException;
import javax.ejb.SessionContext;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.io.InputStream;
import java.sql.*;
import java.text.DecimalFormat;
import java.util.Enumeration;
import java.util.Hashtable;

public class WebMenuBean implements javax.ejb.SessionBean {

    static Hashtable cache = new Hashtable();
    public SessionContext context = null;
    public static int MAXSIZE = -1;
    public static final DecimalFormat fmt0 = new DecimalFormat("0000000000");

    public String getKey(Integer menu_id) {
        String key = "";

        key += fmt0.format(menu_id);
        return (key);
    }

    public String getKey(WebMenuObject obj) {
        return (getKey(obj.menu_id));
    }

    public void create(Integer menu_id, String menu_name, Object menu_content, String menu_isenabled) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;

        String insert = "INSERT INTO WEB_MENU VALUES (  " + menu_id + ", '" + menu_name + "', ?, '" + menu_isenabled + "' )";

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(insert);
            ps.setBytes(1, DBMS.serializeBlobObject(menu_content));
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

    public void delete(Integer menu_id) throws SQLException {
        Connection conn = null;
        String delete = "DELETE FROM WEB_MENU WHERE MENU_ID = " + menu_id;
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
        cache.remove(getKey(menu_id));
        try {
            if (ps != null) ps.close();
        } catch (Exception f) {
        }
        try {
            if (conn != null) conn.close();
        } catch (Exception f) {
        }
    }

    public WebMenuObject request(int cmd, WebMenuObject obj) throws SQLException {

        switch (cmd) {

            case WebMenu.INSERT:
                create(obj.menu_id, obj.menu_name, obj.menu_content, obj.menu_isenabled);
                break;

            case WebMenu.SELECT:
                obj = getRecord(obj.menu_id);
                if (obj == null)
                    throw new EJBException(
                            "no matching record");
                break;

            case WebMenu.UPDATE:
                putRecord(obj.menu_id, obj.menu_name, obj.menu_content, obj.menu_isenabled);
                break;

            case WebMenu.DELETE:
                delete(obj.menu_id);
                break;

        }
        return (obj);
    }

    public void setMenuName(Integer menu_id, String menu_name) throws SQLException {
        putRecord(menu_id, menu_name, null, null);
    }

    public String getMenuName(Integer menu_id) throws SQLException {
        WebMenuObject obj = null;
        String result;

        obj = getRecord(menu_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.menu_name);
    }

    public void setMenuContent(Integer menu_id, Object menu_content) throws SQLException {
        putRecord(menu_id, null, menu_content, null);
    }

    public Object getMenuContent(Integer menu_id) throws SQLException {
        WebMenuObject obj = null;
        Object result;

        obj = getRecord(menu_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.menu_content);
    }

    public void setMenuIsenabled(Integer menu_id, String menu_isenabled) throws SQLException {
        putRecord(menu_id, null, null, menu_isenabled);
    }

    public String getMenuIsenabled(Integer menu_id) throws SQLException {
        WebMenuObject obj = null;
        String result;

        obj = getRecord(menu_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.menu_isenabled);
    }

    private class WebMenuObjectWrapper {
        WebMenuObject obj;
        Date lastUsed;

        WebMenuObjectWrapper() {
            lastUsed = new Date(System.currentTimeMillis());
        }
    }

    private class RecordNotFoundException extends Exception {
    }

    private WebMenuObject getRecord(Integer menu_id) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String key = getKey(menu_id);
        WebMenuObject obj = null;
        WebMenuObjectWrapper wobj = (WebMenuObjectWrapper) cache.get(key);
        if (wobj != null) {
            wobj.lastUsed = new Date(System.currentTimeMillis());
            return (wobj.obj);
        }
        obj = new WebMenuObject();
        String query = "SELECT * FROM WEB_MENU WHERE MENU_ID = " + menu_id;
        InputStream is = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (!rs.next())
                throw new RecordNotFoundException();
            obj.menu_id = new Integer(rs.getInt(1));
            if (rs.wasNull())
                obj.menu_id = null;
            obj.menu_name = rs.getString(2);
            if (rs.wasNull())
                obj.menu_name = null;
            obj.menu_content = DBMS.getBlobObject(rs, 3);
            if (rs.wasNull())
                obj.menu_content = null;
            obj.menu_isenabled = rs.getString(4);
            if (rs.wasNull())
                obj.menu_isenabled = null;
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
            wobj = new WebMenuObjectWrapper();
            wobj.obj = obj;
            if (cache.size() >= MAXSIZE)
                trimCache();
            cache.put(key, wobj);
        }
        return (obj);
    }

    public int putRecord(Integer menu_id, String menu_name, Object menu_content, String menu_isenabled) throws SQLException {
        String identifier = getKey(menu_id);
        PreparedStatement ps = null;
        Connection conn = null;
        StringBuffer update = new StringBuffer();
        WebMenuObjectWrapper obj = null;
        int count = 0;

        obj = (WebMenuObjectWrapper) cache.get(getKey(menu_id));
        update.append("UPDATE WEB_MENU SET ");
        if (menu_name != null) {
            if (obj != null)
                obj.obj.menu_name = menu_name;
            if (count > 0)
                update.append(", ");
            update.append("MENU_NAME = '" + menu_name + "'");
            count++;
        }
        if (menu_content != null) {
            if (obj != null)
                obj.obj.menu_content = menu_content;
            if (count > 0)
                update.append(", ");
            update.append("MENU_CONTENT =  ?"
            );
            count++;
        }
        if (menu_isenabled != null) {
            if (obj != null)
                obj.obj.menu_isenabled = menu_isenabled;
            if (count > 0)
                update.append(", ");
            update.append("MENU_ISENABLED = '" + menu_isenabled + "'");
            count++;
        }
        update.append(" WHERE MENU_ID = " + menu_id);
        if (count == 0)
            return (0);
        int rc = 0;
        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(update.toString());
            int index = 1;
            if (menu_content != null)
                ps.setBytes(index++, DBMS.serializeBlobObject(menu_content));
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
        WebMenuObjectWrapper oldest = null;
        WebMenuObjectWrapper current = null;
        Enumeration e;

        e = cache.elements();
        while (e.hasMoreElements()) {
            current = (WebMenuObjectWrapper) e.nextElement();
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
