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

public class WebStatusBean implements javax.ejb.SessionBean {

    static Hashtable cache = new Hashtable();
    public SessionContext context = null;
    public static int MAXSIZE = -1;
    public static final DecimalFormat fmt0 = new DecimalFormat("000");

    public String getKey(Integer status_id) {
        String key = "";

        key += fmt0.format(status_id);
        return (key);
    }

    public String getKey(WebStatusObject obj) {
        return (getKey(obj.status_id));
    }

    public void create(Integer status_id, String status_desc) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;

        String insert = "INSERT INTO WEB_STATUS VALUES (  " + status_id + ", '" + status_desc + "' )";

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

    public void delete(Integer status_id) throws SQLException {
        Connection conn = null;
        String delete = "DELETE FROM WEB_STATUS WHERE STATUS_ID = " + status_id;
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
        cache.remove(getKey(status_id));
        try {
            if (ps != null) ps.close();
        } catch (Exception f) {
        }
        try {
            if (conn != null) conn.close();
        } catch (Exception f) {
        }
    }

    public WebStatusObject request(int cmd, WebStatusObject obj) throws SQLException {

        switch (cmd) {

            case WebStatus.INSERT:
                create(obj.status_id, obj.status_desc);
                break;

            case WebStatus.SELECT:
                obj = getRecord(obj.status_id);
                if (obj == null)
                    throw new EJBException(
                            "no matching record");
                break;

            case WebStatus.UPDATE:
                putRecord(obj.status_id, obj.status_desc);
                break;

            case WebStatus.DELETE:
                delete(obj.status_id);
                break;

        }
        return (obj);
    }

    public void setStatusDesc(Integer status_id, String status_desc) throws SQLException {
        putRecord(status_id, status_desc);
    }

    public String getStatusDesc(Integer status_id) throws SQLException {
        WebStatusObject obj = null;
        String result;

        obj = getRecord(status_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.status_desc);
    }

    private class WebStatusObjectWrapper {
        WebStatusObject obj;
        Date lastUsed;

        WebStatusObjectWrapper() {
            lastUsed = new Date(System.currentTimeMillis());
        }
    }

    private class RecordNotFoundException extends Exception {
    }

    private WebStatusObject getRecord(Integer status_id) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String key = getKey(status_id);
        WebStatusObject obj = null;
        WebStatusObjectWrapper wobj = (WebStatusObjectWrapper) cache.get(key);
        if (wobj != null) {
            wobj.lastUsed = new Date(System.currentTimeMillis());
            return (wobj.obj);
        }
        obj = new WebStatusObject();
        String query = "SELECT * FROM WEB_STATUS WHERE STATUS_ID = " + status_id;
        InputStream is = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (!rs.next())
                throw new RecordNotFoundException();
            obj.status_id = new Integer(rs.getInt(1));
            if (rs.wasNull())
                obj.status_id = null;
            obj.status_desc = rs.getString(2);
            if (rs.wasNull())
                obj.status_desc = null;
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
            wobj = new WebStatusObjectWrapper();
            wobj.obj = obj;
            if (cache.size() >= MAXSIZE)
                trimCache();
            cache.put(key, wobj);
        }
        return (obj);
    }

    public int putRecord(Integer status_id, String status_desc) throws SQLException {
        String identifier = getKey(status_id);
        PreparedStatement ps = null;
        Connection conn = null;
        StringBuffer update = new StringBuffer();
        WebStatusObjectWrapper obj = null;
        int count = 0;

        obj = (WebStatusObjectWrapper) cache.get(getKey(status_id));
        update.append("UPDATE WEB_STATUS SET ");
        if (status_desc != null) {
            if (obj != null)
                obj.obj.status_desc = status_desc;
            if (count > 0)
                update.append(", ");
            update.append("STATUS_DESC = '" + status_desc + "'");
            count++;
        }
        update.append(" WHERE STATUS_ID = " + status_id);
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
        String query = "SELECT STATUS_ID FROM WEB_STATUS";

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

    public String findByStatusDesc(String status_desc) throws SQLException {
        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        Vector results = new Vector();
        String query = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            if (status_desc.indexOf('%') >= 0)
                query = "SELECT STATUS_ID FROM WEB_STATUS WHERE STATUS_DESC LIKE '" + status_desc + "'";
            else
                query = "SELECT STATUS_ID FROM WEB_STATUS WHERE STATUS_DESC = '" + status_desc + "'";
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
        WebStatusObjectWrapper oldest = null;
        WebStatusObjectWrapper current = null;
        Enumeration e;

        e = cache.elements();
        while (e.hasMoreElements()) {
            current = (WebStatusObjectWrapper) e.nextElement();
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
