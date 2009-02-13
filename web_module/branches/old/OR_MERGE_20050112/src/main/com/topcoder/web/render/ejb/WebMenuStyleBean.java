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

public class WebMenuStyleBean implements javax.ejb.SessionBean {

    static Hashtable cache = new Hashtable();
    public SessionContext context = null;
    public static int MAXSIZE = -1;
    public static final DecimalFormat fmt0 = new DecimalFormat("0000000000");

    public String getKey(Integer style_id) {
        String key = "";

        key += fmt0.format(style_id);
        return (key);
    }

    public String getKey(WebMenuStyleObject obj) {
        return (getKey(obj.style_id));
    }

    public void create(Integer style_id, String style_desc, Object style_help, Object style_items) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;

        String insert = "INSERT INTO WEB_MENU_STYLE VALUES (  " + style_id + ", '" + style_desc + "', ?, ? )";

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(insert);
            ps.setBytes(1, DBMS.serializeBlobObject(style_help));
            ps.setBytes(2, DBMS.serializeBlobObject(style_items));
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

    public void delete(Integer style_id) throws SQLException {
        Connection conn = null;
        String delete = "DELETE FROM WEB_MENU_STYLE WHERE STYLE_ID = " + style_id;
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
        cache.remove(getKey(style_id));
        try {
            if (ps != null) ps.close();
        } catch (Exception f) {
        }
        try {
            if (conn != null) conn.close();
        } catch (Exception f) {
        }
    }

    public WebMenuStyleObject request(int cmd, WebMenuStyleObject obj) throws SQLException {

        switch (cmd) {

            case WebMenuStyle.INSERT:
                create(obj.style_id, obj.style_desc, obj.style_help, obj.style_items);
                break;

            case WebMenuStyle.SELECT:
                obj = getRecord(obj.style_id);
                if (obj == null)
                    throw new EJBException(
                            "no matching record");
                break;

            case WebMenuStyle.UPDATE:
                putRecord(obj.style_id, obj.style_desc, obj.style_help, obj.style_items);
                break;

            case WebMenuStyle.DELETE:
                delete(obj.style_id);
                break;

        }
        return (obj);
    }

    public void setStyleDesc(Integer style_id, String style_desc) throws SQLException {
        putRecord(style_id, style_desc, null, null);
    }

    public String getStyleDesc(Integer style_id) throws SQLException {
        WebMenuStyleObject obj = null;
        String result;

        obj = getRecord(style_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.style_desc);
    }

    public void setStyleHelp(Integer style_id, Object style_help) throws SQLException {
        putRecord(style_id, null, style_help, null);
    }

    public Object getStyleHelp(Integer style_id) throws SQLException {
        WebMenuStyleObject obj = null;
        Object result;

        obj = getRecord(style_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.style_help);
    }

    public void setStyleItems(Integer style_id, Object style_items) throws SQLException {
        putRecord(style_id, null, null, style_items);
    }

    public Object getStyleItems(Integer style_id) throws SQLException {
        WebMenuStyleObject obj = null;
        Object result;

        obj = getRecord(style_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.style_items);
    }

    private class WebMenuStyleObjectWrapper {
        WebMenuStyleObject obj;
        Date lastUsed;

        WebMenuStyleObjectWrapper() {
            lastUsed = new Date(System.currentTimeMillis());
        }
    }

    private class RecordNotFoundException extends Exception {
    }

    private WebMenuStyleObject getRecord(Integer style_id) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String key = getKey(style_id);
        WebMenuStyleObject obj = null;
        WebMenuStyleObjectWrapper wobj = (WebMenuStyleObjectWrapper) cache.get(key);
        if (wobj != null) {
            wobj.lastUsed = new Date(System.currentTimeMillis());
            return (wobj.obj);
        }
        obj = new WebMenuStyleObject();
        String query = "SELECT * FROM WEB_MENU_STYLE WHERE STYLE_ID = " + style_id;
        InputStream is = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (!rs.next())
                throw new RecordNotFoundException();
            obj.style_id = new Integer(rs.getInt(1));
            if (rs.wasNull())
                obj.style_id = null;
            obj.style_desc = rs.getString(2);
            if (rs.wasNull())
                obj.style_desc = null;
            obj.style_help = DBMS.getBlobObject(rs, 3);
            if (rs.wasNull())
                obj.style_help = null;
            obj.style_items = DBMS.getBlobObject(rs, 4);
            if (rs.wasNull())
                obj.style_items = null;
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
            wobj = new WebMenuStyleObjectWrapper();
            wobj.obj = obj;
            if (cache.size() >= MAXSIZE)
                trimCache();
            cache.put(key, wobj);
        }
        return (obj);
    }

    public int putRecord(Integer style_id, String style_desc, Object style_help, Object style_items) throws SQLException {
        String identifier = getKey(style_id);
        PreparedStatement ps = null;
        Connection conn = null;
        StringBuffer update = new StringBuffer();
        WebMenuStyleObjectWrapper obj = null;
        int count = 0;

        obj = (WebMenuStyleObjectWrapper) cache.get(getKey(style_id));
        update.append("UPDATE WEB_MENU_STYLE SET ");
        if (style_desc != null) {
            if (obj != null)
                obj.obj.style_desc = style_desc;
            if (count > 0)
                update.append(", ");
            update.append("STYLE_DESC = '" + style_desc + "'");
            count++;
        }
        if (style_help != null) {
            if (obj != null)
                obj.obj.style_help = style_help;
            if (count > 0)
                update.append(", ");
            update.append("STYLE_HELP =  ?"
            );
            count++;
        }
        if (style_items != null) {
            if (obj != null)
                obj.obj.style_items = style_items;
            if (count > 0)
                update.append(", ");
            update.append("STYLE_ITEMS =  ?"
            );
            count++;
        }
        update.append(" WHERE STYLE_ID = " + style_id);
        if (count == 0)
            return (0);
        int rc = 0;
        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(update.toString());
            int index = 1;
            if (style_help != null)
                ps.setBytes(index++, DBMS.serializeBlobObject(style_help));
            if (style_items != null)
                ps.setBytes(index++, DBMS.serializeBlobObject(style_items));
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
        WebMenuStyleObjectWrapper oldest = null;
        WebMenuStyleObjectWrapper current = null;
        Enumeration e;

        e = cache.elements();
        while (e.hasMoreElements()) {
            current = (WebMenuStyleObjectWrapper) e.nextElement();
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
