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

public class PermissionBean implements javax.ejb.SessionBean {

    static Hashtable cache = new Hashtable();
    public SessionContext context = null;
    public static int MAXSIZE = -1;
    public static final DecimalFormat fmt0 = new DecimalFormat("0000000000");

    public String getKey(Integer secure_object_id, Integer sector_id) {
        StringBuffer sb = null;
        String key = "";

        key += fmt0.format(secure_object_id);
        key += fmt0.format(sector_id);
        return (key);
    }

    public String getKey(PermissionObject obj) {
        return (getKey(obj.secure_object_id, obj.sector_id));
    }

    public void create(Integer secure_object_id, Integer sector_id, Integer access_id) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;

        String insert = "INSERT INTO PERMISSION VALUES (  " + secure_object_id + ", " + sector_id + ", " + access_id + " )";

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

    public void delete(Integer secure_object_id, Integer sector_id) throws SQLException {
        Connection conn = null;
        String delete = "DELETE FROM PERMISSION WHERE SECURE_OBJECT_ID = " + secure_object_id + " AND SECTOR_ID = " + sector_id;
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
        cache.remove(getKey(secure_object_id, sector_id));
        try {
            if (ps != null) ps.close();
        } catch (Exception f) {
        }
        try {
            if (conn != null) conn.close();
        } catch (Exception f) {
        }
    }

    public PermissionObject request(int cmd, PermissionObject obj) throws SQLException {

        switch (cmd) {

            case Permission.INSERT:
                create(obj.secure_object_id, obj.sector_id, obj.access_id);
                break;

            case Permission.SELECT:
                obj = getRecord(obj.secure_object_id, obj.sector_id);
                if (obj == null)
                    throw new EJBException(
                            "no matching record");
                break;

            case Permission.UPDATE:
                putRecord(obj.secure_object_id, obj.sector_id, obj.access_id);
                break;

            case Permission.DELETE:
                delete(obj.secure_object_id, obj.sector_id);
                break;

        }
        return (obj);
    }

    public void setAccessId(Integer secure_object_id, Integer sector_id, Integer access_id) throws SQLException {
        putRecord(secure_object_id, sector_id, access_id);
    }

    public Integer getAccessId(Integer secure_object_id, Integer sector_id) throws SQLException {
        PermissionObject obj = null;
        Integer result;

        obj = getRecord(secure_object_id, sector_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.access_id);
    }

    private class PermissionObjectWrapper {
        PermissionObject obj;
        Date lastUsed;

        PermissionObjectWrapper() {
            lastUsed = new Date(System.currentTimeMillis());
        }
    }

    private class RecordNotFoundException extends Exception {
    }

    private PermissionObject getRecord(Integer secure_object_id, Integer sector_id) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String key = getKey(secure_object_id, sector_id);
        PermissionObject obj = null;
        PermissionObjectWrapper wobj = (PermissionObjectWrapper) cache.get(key);
        if (wobj != null) {
            wobj.lastUsed = new Date(System.currentTimeMillis());
            return (wobj.obj);
        }
        obj = new PermissionObject();
        String query = "SELECT * FROM PERMISSION WHERE SECURE_OBJECT_ID = " + secure_object_id + " AND SECTOR_ID = " + sector_id;
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
            obj.sector_id = new Integer(rs.getInt(2));
            if (rs.wasNull())
                obj.sector_id = null;
            obj.access_id = new Integer(rs.getInt(3));
            if (rs.wasNull())
                obj.access_id = null;
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
            wobj = new PermissionObjectWrapper();
            wobj.obj = obj;
            if (cache.size() >= MAXSIZE)
                trimCache();
            cache.put(key, wobj);
        }
        return (obj);
    }

    public int putRecord(Integer secure_object_id, Integer sector_id, Integer access_id) throws SQLException {
        String identifier = getKey(secure_object_id, sector_id);
        PreparedStatement ps = null;
        Connection conn = null;
        StringBuffer update = new StringBuffer();
        PermissionObjectWrapper obj = null;
        int count = 0;

        obj = (PermissionObjectWrapper) cache.get(getKey(secure_object_id, sector_id));
        update.append("UPDATE PERMISSION SET ");
        if (access_id != null) {
            if (obj != null)
                obj.obj.access_id = access_id;
            if (count > 0)
                update.append(", ");
            update.append("ACCESS_ID = " + access_id.intValue());
            count++;
        }
        update.append(" WHERE SECURE_OBJECT_ID = " + secure_object_id + " AND SECTOR_ID = " + sector_id);
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
        PermissionObjectWrapper oldest = null;
        PermissionObjectWrapper current = null;
        Enumeration e;

        e = cache.elements();
        while (e.hasMoreElements()) {
            current = (PermissionObjectWrapper) e.nextElement();
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
