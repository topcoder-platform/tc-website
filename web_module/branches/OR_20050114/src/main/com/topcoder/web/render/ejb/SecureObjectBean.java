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

public class SecureObjectBean implements javax.ejb.SessionBean {

    static Hashtable cache = new Hashtable();
    public SessionContext context = null;
    public static int MAXSIZE = -1;
    public static final DecimalFormat fmt0 = new DecimalFormat("0000000000");

    public String getKey(Integer secure_object_id) {
        String key = "";

        key += fmt0.format(secure_object_id);
        return (key);
    }

    public String getKey(SecureObjectObject obj) {
        return (getKey(obj.secure_object_id));
    }

    public void create(Integer secure_object_id, String secure_object_type) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;

        String insert = "INSERT INTO SECURE_OBJECT VALUES (  " + secure_object_id + ", '" + secure_object_type + "' )";

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

    public void delete(Integer secure_object_id) throws SQLException {
        Connection conn = null;
        String delete = "DELETE FROM SECURE_OBJECT WHERE SECURE_OBJECT_ID = " + secure_object_id;
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
        cache.remove(getKey(secure_object_id));
        try {
            if (ps != null) ps.close();
        } catch (Exception f) {
        }
        try {
            if (conn != null) conn.close();
        } catch (Exception f) {
        }
    }

    public SecureObjectObject request(int cmd, SecureObjectObject obj) throws SQLException {

        switch (cmd) {

            case SecureObject.INSERT:
                create(obj.secure_object_id, obj.secure_object_type);
                break;

            case SecureObject.SELECT:
                obj = getRecord(obj.secure_object_id);
                if (obj == null)
                    throw new EJBException(
                            "no matching record");
                break;

            case SecureObject.UPDATE:
                putRecord(obj.secure_object_id, obj.secure_object_type);
                break;

            case SecureObject.DELETE:
                delete(obj.secure_object_id);
                break;

        }
        return (obj);
    }

    public void setSecureObjectType(Integer secure_object_id, String secure_object_type) throws SQLException {
        putRecord(secure_object_id, secure_object_type);
    }

    public String getSecureObjectType(Integer secure_object_id) throws SQLException {
        SecureObjectObject obj = null;
        String result;

        obj = getRecord(secure_object_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.secure_object_type);
    }

    private class SecureObjectObjectWrapper {
        SecureObjectObject obj;
        Date lastUsed;

        SecureObjectObjectWrapper() {
            lastUsed = new Date(System.currentTimeMillis());
        }
    }

    private class RecordNotFoundException extends Exception {
    }

    private SecureObjectObject getRecord(Integer secure_object_id) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String key = getKey(secure_object_id);
        SecureObjectObject obj = null;
        SecureObjectObjectWrapper wobj = (SecureObjectObjectWrapper) cache.get(key);
        if (wobj != null) {
            wobj.lastUsed = new Date(System.currentTimeMillis());
            return (wobj.obj);
        }
        obj = new SecureObjectObject();
        String query = "SELECT * FROM SECURE_OBJECT WHERE SECURE_OBJECT_ID = " + secure_object_id;
        InputStream is = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (!rs.next())
                throw new RecordNotFoundException();
            obj.secure_object_id = new Integer(rs.getInt(1));
            if (rs.wasNull())
                obj.secure_object_id = null;
            obj.secure_object_type = rs.getString(2);
            if (rs.wasNull())
                obj.secure_object_type = null;
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
            wobj = new SecureObjectObjectWrapper();
            wobj.obj = obj;
            if (cache.size() >= MAXSIZE)
                trimCache();
            cache.put(key, wobj);
        }
        return (obj);
    }

    public int putRecord(Integer secure_object_id, String secure_object_type) throws SQLException {
        String identifier = getKey(secure_object_id);
        PreparedStatement ps = null;
        Connection conn = null;
        StringBuffer update = new StringBuffer();
        SecureObjectObjectWrapper obj = null;
        int count = 0;

        obj = (SecureObjectObjectWrapper) cache.get(getKey(secure_object_id));
        update.append("UPDATE SECURE_OBJECT SET ");
        if (secure_object_type != null) {
            if (obj != null)
                obj.obj.secure_object_type = secure_object_type;
            if (count > 0)
                update.append(", ");
            update.append("SECURE_OBJECT_TYPE = '" + secure_object_type + "'");
            count++;
        }
        update.append(" WHERE SECURE_OBJECT_ID = " + secure_object_id);
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
        SecureObjectObjectWrapper oldest = null;
        SecureObjectObjectWrapper current = null;
        Enumeration e;

        e = cache.elements();
        while (e.hasMoreElements()) {
            current = (SecureObjectObjectWrapper) e.nextElement();
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
