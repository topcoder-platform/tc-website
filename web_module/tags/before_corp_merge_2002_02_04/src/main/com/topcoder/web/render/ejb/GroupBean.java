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

public class GroupBean implements javax.ejb.SessionBean {

    static Hashtable cache = new Hashtable();
    public SessionContext context = null;
    public static int MAXSIZE = -1;
    public static final DecimalFormat fmt0 = new DecimalFormat("0000000000");

    public String getKey(Integer group_id) {
        String key = "";

        key += fmt0.format(group_id);
        return (key);
    }

    public String getKey(GroupObject obj) {
        return (getKey(obj.group_id));
    }

    public void create(Integer group_id, String group_desc, Integer access_id) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;

        String insert = "INSERT INTO GROUP VALUES (  " + group_id + ", '" + group_desc + "', " + access_id + " )";

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

    public void delete(Integer group_id) throws SQLException {
        Connection conn = null;
        String delete = "DELETE FROM GROUP WHERE GROUP_ID = " + group_id;
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
        cache.remove(getKey(group_id));
        try {
            if (ps != null) ps.close();
        } catch (Exception f) {
        }
        try {
            if (conn != null) conn.close();
        } catch (Exception f) {
        }
    }

    public GroupObject request(int cmd, GroupObject obj) throws SQLException {

        switch (cmd) {

            case Group.INSERT:
                create(obj.group_id, obj.group_desc, obj.access_id);
                break;

            case Group.SELECT:
                obj = getRecord(obj.group_id);
                if (obj == null)
                    throw new EJBException(
                            "no matching record");
                break;

            case Group.UPDATE:
                putRecord(obj.group_id, obj.group_desc, obj.access_id);
                break;

            case Group.DELETE:
                delete(obj.group_id);
                break;

        }
        return (obj);
    }

    public void setGroupDesc(Integer group_id, String group_desc) throws SQLException {
        putRecord(group_id, group_desc, null);
    }

    public String getGroupDesc(Integer group_id) throws SQLException {
        GroupObject obj = null;
        String result;

        obj = getRecord(group_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.group_desc);
    }

    public void setAccessId(Integer group_id, Integer access_id) throws SQLException {
        putRecord(group_id, null, access_id);
    }

    public Integer getAccessId(Integer group_id) throws SQLException {
        GroupObject obj = null;
        Integer result;

        obj = getRecord(group_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.access_id);
    }

    private class GroupObjectWrapper {
        GroupObject obj;
        Date lastUsed;

        GroupObjectWrapper() {
            lastUsed = new Date(System.currentTimeMillis());
        }
    }

    private class RecordNotFoundException extends Exception {
    }

    private GroupObject getRecord(Integer group_id) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String key = getKey(group_id);
        GroupObject obj = null;
        GroupObjectWrapper wobj = (GroupObjectWrapper) cache.get(key);
        if (wobj != null) {
            wobj.lastUsed = new Date(System.currentTimeMillis());
            return (wobj.obj);
        }
        obj = new GroupObject();
        String query = "SELECT * FROM GROUP WHERE GROUP_ID = " + group_id;
        InputStream is = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (!rs.next())
                throw new RecordNotFoundException();
            obj.group_id = new Integer(rs.getInt(1));
            if (rs.wasNull())
                obj.group_id = null;
            obj.group_desc = rs.getString(2);
            if (rs.wasNull())
                obj.group_desc = null;
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
            wobj = new GroupObjectWrapper();
            wobj.obj = obj;
            if (cache.size() >= MAXSIZE)
                trimCache();
            cache.put(key, wobj);
        }
        return (obj);
    }

    public int putRecord(Integer group_id, String group_desc, Integer access_id) throws SQLException {
        String identifier = getKey(group_id);
        PreparedStatement ps = null;
        Connection conn = null;
        StringBuffer update = new StringBuffer();
        GroupObjectWrapper obj = null;
        int count = 0;

        obj = (GroupObjectWrapper) cache.get(getKey(group_id));
        update.append("UPDATE GROUP SET ");
        if (group_desc != null) {
            if (obj != null)
                obj.obj.group_desc = group_desc;
            if (count > 0)
                update.append(", ");
            update.append("GROUP_DESC = '" + group_desc + "'");
            count++;
        }
        if (access_id != null) {
            if (obj != null)
                obj.obj.access_id = access_id;
            if (count > 0)
                update.append(", ");
            update.append("ACCESS_ID = " + access_id.intValue());
            count++;
        }
        update.append(" WHERE GROUP_ID = " + group_id);
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

    public String findByGroupDesc(String group_desc) throws SQLException {
        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        Vector results = new Vector();
        String query = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            if (group_desc.indexOf('%') >= 0)
                query = "SELECT GROUP_ID FROM GROUP WHERE GROUP_DESC LIKE '" + group_desc + "'";
            else
                query = "SELECT GROUP_ID FROM GROUP WHERE GROUP_DESC = '" + group_desc + "'";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next())
                results.add(new Integer(rs.getInt(1)));
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
        GroupObjectWrapper oldest = null;
        GroupObjectWrapper current = null;
        Enumeration e;

        e = cache.elements();
        while (e.hasMoreElements()) {
            current = (GroupObjectWrapper) e.nextElement();
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
