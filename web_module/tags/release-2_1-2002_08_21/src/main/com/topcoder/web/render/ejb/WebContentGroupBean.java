package com.topcoder.web.render.ejb;

import javax.ejb.EJBException;
import javax.ejb.SessionContext;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.io.InputStream;
import java.sql.*;
import java.sql.Date;
import java.text.DecimalFormat;
import java.util.*;

public class WebContentGroupBean implements javax.ejb.SessionBean {

    static Hashtable cache = new Hashtable();
    public SessionContext context = null;
    public static int MAXSIZE = -1;
    public static final DecimalFormat fmt0 = new DecimalFormat("0000000000");

    public String getKey(Integer content_group_id) {
        String key = "";

        key += fmt0.format(content_group_id);
        return (key);
    }

    public String getKey(WebContentGroupObject obj) {
        return (getKey(obj.content_group_id));
    }

    public void create(Integer content_group_id, String content_group_desc) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;

        String insert = "INSERT INTO WEB_CONTENT_GROUP VALUES (  " + content_group_id + ", '" + content_group_desc + "' )";

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(insert);
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

    public void delete(Integer content_group_id) throws SQLException {
        Connection conn = null;
        String delete = "DELETE FROM WEB_CONTENT_GROUP WHERE CONTENT_GROUP_ID = " + content_group_id;
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
        cache.remove(getKey(content_group_id));
        try {
            if (ps != null) ps.close();
        } catch (Exception f) {
        }
        try {
            if (conn != null) conn.close();
        } catch (Exception f) {
        }
    }

    public WebContentGroupObject request(int cmd, WebContentGroupObject obj) throws SQLException {

        switch (cmd) {

            case WebContentGroup.INSERT:
                create(obj.content_group_id, obj.content_group_desc);
                break;

            case WebContentGroup.SELECT:
                obj = getRecord(obj.content_group_id);
                if (obj == null)
                    throw new EJBException(
                            "no matching record");
                break;

            case WebContentGroup.UPDATE:
                putRecord(obj.content_group_id, obj.content_group_desc);
                break;

            case WebContentGroup.DELETE:
                delete(obj.content_group_id);
                break;

        }
        return (obj);
    }

    public void setContentGroupDesc(Integer content_group_id, String content_group_desc) throws SQLException {
        putRecord(content_group_id, content_group_desc);
    }

    public String getContentGroupDesc(Integer content_group_id) throws SQLException {
        WebContentGroupObject obj = null;
        String result;

        obj = getRecord(content_group_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.content_group_desc);
    }

    private class WebContentGroupObjectWrapper {
        WebContentGroupObject obj;
        Date lastUsed;

        WebContentGroupObjectWrapper() {
            lastUsed = new Date(System.currentTimeMillis());
        }
    }

    private class RecordNotFoundException extends Exception {
    }

    private WebContentGroupObject getRecord(Integer content_group_id) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String key = getKey(content_group_id);
        WebContentGroupObject obj = null;
        WebContentGroupObjectWrapper wobj = (WebContentGroupObjectWrapper) cache.get(key);
        if (wobj != null) {
            wobj.lastUsed = new Date(System.currentTimeMillis());
            return (wobj.obj);
        }
        obj = new WebContentGroupObject();
        String query = "SELECT * FROM WEB_CONTENT_GROUP WHERE CONTENT_GROUP_ID = " + content_group_id;
        InputStream is = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (!rs.next())
                throw new RecordNotFoundException();
            obj.content_group_id = new Integer(rs.getInt(1));
            if (rs.wasNull())
                obj.content_group_id = null;
            obj.content_group_desc = rs.getString(2);
            if (rs.wasNull())
                obj.content_group_desc = null;
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
            wobj = new WebContentGroupObjectWrapper();
            wobj.obj = obj;
            if (cache.size() >= MAXSIZE)
                trimCache();
            cache.put(key, wobj);
        }
        return (obj);
    }

    public int putRecord(Integer content_group_id, String content_group_desc) throws SQLException {
        String identifier = getKey(content_group_id);
        PreparedStatement ps = null;
        Connection conn = null;
        StringBuffer update = new StringBuffer();
        WebContentGroupObjectWrapper obj = null;
        int count = 0;

        obj = (WebContentGroupObjectWrapper) cache.get(getKey(content_group_id));
        update.append("UPDATE WEB_CONTENT_GROUP SET ");
        if (content_group_desc != null) {
            if (obj != null)
                obj.obj.content_group_desc = content_group_desc;
            if (count > 0)
                update.append(", ");
            update.append("CONTENT_GROUP_DESC = '" + content_group_desc + "'");
            count++;
        }
        update.append(" WHERE CONTENT_GROUP_ID = " + content_group_id);
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

    public String list() throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Vector results = new Vector();
        String query = "SELECT CONTENT_GROUP_ID FROM WEB_CONTENT_GROUP";

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next())
                results.add(new Integer(rs.getInt(1)));
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
        try {
            if (ps != null) ps.close();
        } catch (Exception f) {
        }
        try {
            if (conn != null) conn.close();
        } catch (Exception f) {
        }
        return (flatten(results));
    }

    private String flatten(Vector v) {
        StringBuffer sb = new StringBuffer();
        Enumeration e = v.elements();

        while (e.hasMoreElements()) {
            if (sb.length() > 0)
                sb.append(" ");
            sb.append(((Integer) e.nextElement()).intValue());
        }
        return (sb.toString());
    }

    private void trimCache() {
        WebContentGroupObjectWrapper oldest = null;
        WebContentGroupObjectWrapper current = null;
        Enumeration e;

        e = cache.elements();
        while (e.hasMoreElements()) {
            current = (WebContentGroupObjectWrapper) e.nextElement();
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
