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

public class AccessBean implements javax.ejb.SessionBean {

    static Hashtable cache = new Hashtable();
    public SessionContext context = null;
    public static int MAXSIZE = -1;
    public static final DecimalFormat fmt0 = new DecimalFormat("00");

    public String getKey(Integer access_id) {
        String key = "";

        key += fmt0.format(access_id);
        return (key);
    }

    public String getKey(AccessObject obj) {
        return (getKey(obj.access_id));
    }

    public void create(Integer access_id, String access_desc) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;

        String insert = "INSERT INTO ACCESS VALUES (  " + access_id + ", '" + access_desc + "' )";

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

    public void delete(Integer access_id) throws SQLException {
        Connection conn = null;
        String delete = "DELETE FROM ACCESS WHERE ACCESS_ID = " + access_id;
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
        cache.remove(getKey(access_id));
        try {
            if (ps != null) ps.close();
        } catch (Exception f) {
        }
        try {
            if (conn != null) conn.close();
        } catch (Exception f) {
        }
    }

    public AccessObject request(int cmd, AccessObject obj) throws SQLException {

        switch (cmd) {

            case Access.INSERT:
                create(obj.access_id, obj.access_desc);
                break;

            case Access.SELECT:
                obj = getRecord(obj.access_id);
                if (obj == null)
                    throw new EJBException(
                            "no matching record");
                break;

            case Access.UPDATE:
                putRecord(obj.access_id, obj.access_desc);
                break;

            case Access.DELETE:
                delete(obj.access_id);
                break;

        }
        return (obj);
    }

    public void setAccessDesc(Integer access_id, String access_desc) throws SQLException {
        putRecord(access_id, access_desc);
    }

    public String getAccessDesc(Integer access_id) throws SQLException {
        AccessObject obj = null;
        String result;

        obj = getRecord(access_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.access_desc);
    }

    private class AccessObjectWrapper {
        AccessObject obj;
        Date lastUsed;

        AccessObjectWrapper() {
            lastUsed = new Date(System.currentTimeMillis());
        }
    }

    private class RecordNotFoundException extends Exception {
    }

    private AccessObject getRecord(Integer access_id) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String key = getKey(access_id);
        AccessObject obj = null;
        AccessObjectWrapper wobj = (AccessObjectWrapper) cache.get(key);
        if (wobj != null) {
            wobj.lastUsed = new Date(System.currentTimeMillis());
            return (wobj.obj);
        }
        obj = new AccessObject();
        String query = "SELECT * FROM ACCESS WHERE ACCESS_ID = " + access_id;
        InputStream is = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (!rs.next())
                throw new RecordNotFoundException();
            obj.access_id = new Integer(rs.getInt(1));
            if (rs.wasNull())
                obj.access_id = null;
            obj.access_desc = rs.getString(2);
            if (rs.wasNull())
                obj.access_desc = null;
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
            wobj = new AccessObjectWrapper();
            wobj.obj = obj;
            if (cache.size() >= MAXSIZE)
                trimCache();
            cache.put(key, wobj);
        }
        return (obj);
    }

    public int putRecord(Integer access_id, String access_desc) throws SQLException {
        String identifier = getKey(access_id);
        PreparedStatement ps = null;
        Connection conn = null;
        StringBuffer update = new StringBuffer();
        AccessObjectWrapper obj = null;
        int count = 0;

        obj = (AccessObjectWrapper) cache.get(getKey(access_id));
        update.append("UPDATE ACCESS SET ");
        if (access_desc != null) {
            if (obj != null)
                obj.obj.access_desc = access_desc;
            if (count > 0)
                update.append(", ");
            update.append("ACCESS_DESC = '" + access_desc + "'");
            count++;
        }
        update.append(" WHERE ACCESS_ID = " + access_id);
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
        AccessObjectWrapper oldest = null;
        AccessObjectWrapper current = null;
        Enumeration e;

        e = cache.elements();
        while (e.hasMoreElements()) {
            current = (AccessObjectWrapper) e.nextElement();
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
