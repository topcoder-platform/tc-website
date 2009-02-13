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

public class WebPagePathBean implements javax.ejb.SessionBean {

    static Hashtable cache = new Hashtable();
    public SessionContext context = null;
    public static int MAXSIZE = -1;
    public static final DecimalFormat fmt0 = new DecimalFormat("0000000000");

    public String getKey(Integer site_hdr_id) {
        String key = "";

        key += fmt0.format(site_hdr_id);
        return (key);
    }

    public String getKey(WebPagePathObject obj) {
        return (getKey(obj.site_hdr_id));
    }

    public void create(Integer site_hdr_id, Integer page_id, Integer parent_id, Integer page_order, Integer modify_by, Date modify_date) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;

        String insert = "INSERT INTO WEB_PAGE_PATH VALUES (  " + site_hdr_id + ", " + page_id + ", " + parent_id + ", " + page_order + ", " + modify_by + ", ? )";

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

    public void delete(Integer site_hdr_id) throws SQLException {
        Connection conn = null;
        String delete = "DELETE FROM WEB_PAGE_PATH WHERE SITE_HDR_ID = " + site_hdr_id;
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
        cache.remove(getKey(site_hdr_id));
        try {
            if (ps != null) ps.close();
        } catch (Exception f) {
        }
        try {
            if (conn != null) conn.close();
        } catch (Exception f) {
        }
    }

    public WebPagePathObject request(int cmd, WebPagePathObject obj) throws SQLException {

        switch (cmd) {

            case WebPagePath.INSERT:
                create(obj.site_hdr_id, obj.page_id, obj.parent_id, obj.page_order, obj.modify_by, obj.modify_date);
                break;

            case WebPagePath.SELECT:
                obj = getRecord(obj.site_hdr_id);
                if (obj == null)
                    throw new EJBException(
                            "no matching record");
                break;

            case WebPagePath.UPDATE:
                putRecord(obj.site_hdr_id, obj.page_id, obj.parent_id, obj.page_order, obj.modify_by, obj.modify_date);
                break;

            case WebPagePath.DELETE:
                delete(obj.site_hdr_id);
                break;

        }
        return (obj);
    }

    public void setPageId(Integer site_hdr_id, Integer page_id) throws SQLException {
        putRecord(site_hdr_id, page_id, null, null, null, null);
    }

    public Integer getPageId(Integer site_hdr_id) throws SQLException {
        WebPagePathObject obj = null;
        Integer result;

        obj = getRecord(site_hdr_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.page_id);
    }

    public void setParentId(Integer site_hdr_id, Integer parent_id) throws SQLException {
        putRecord(site_hdr_id, null, parent_id, null, null, null);
    }

    public Integer getParentId(Integer site_hdr_id) throws SQLException {
        WebPagePathObject obj = null;
        Integer result;

        obj = getRecord(site_hdr_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.parent_id);
    }

    public void setPageOrder(Integer site_hdr_id, Integer page_order) throws SQLException {
        putRecord(site_hdr_id, null, null, page_order, null, null);
    }

    public Integer getPageOrder(Integer site_hdr_id) throws SQLException {
        WebPagePathObject obj = null;
        Integer result;

        obj = getRecord(site_hdr_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.page_order);
    }

    public void setModifyBy(Integer site_hdr_id, Integer modify_by) throws SQLException {
        putRecord(site_hdr_id, null, null, null, modify_by, null);
    }

    public Integer getModifyBy(Integer site_hdr_id) throws SQLException {
        WebPagePathObject obj = null;
        Integer result;

        obj = getRecord(site_hdr_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.modify_by);
    }

    public void setModifyDate(Integer site_hdr_id, Date modify_date) throws SQLException {
        putRecord(site_hdr_id, null, null, null, null, modify_date);
    }

    public Date getModifyDate(Integer site_hdr_id) throws SQLException {
        WebPagePathObject obj = null;
        Date result;

        obj = getRecord(site_hdr_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.modify_date);
    }

    private class WebPagePathObjectWrapper {
        WebPagePathObject obj;
        Date lastUsed;

        WebPagePathObjectWrapper() {
            lastUsed = new Date(System.currentTimeMillis());
        }
    }

    private class RecordNotFoundException extends Exception {
    }

    private WebPagePathObject getRecord(Integer site_hdr_id) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String key = getKey(site_hdr_id);
        WebPagePathObject obj = null;
        WebPagePathObjectWrapper wobj = (WebPagePathObjectWrapper) cache.get(key);
        if (wobj != null) {
            wobj.lastUsed = new Date(System.currentTimeMillis());
            return (wobj.obj);
        }
        obj = new WebPagePathObject();
        String query = "SELECT * FROM WEB_PAGE_PATH WHERE SITE_HDR_ID = " + site_hdr_id;
        InputStream is = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (!rs.next())
                throw new RecordNotFoundException();
            obj.site_hdr_id = new Integer(rs.getInt(1));
            if (rs.wasNull())
                obj.site_hdr_id = null;
            obj.page_id = new Integer(rs.getInt(2));
            if (rs.wasNull())
                obj.page_id = null;
            obj.parent_id = new Integer(rs.getInt(3));
            if (rs.wasNull())
                obj.parent_id = null;
            obj.page_order = new Integer(rs.getInt(4));
            if (rs.wasNull())
                obj.page_order = null;
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
            wobj = new WebPagePathObjectWrapper();
            wobj.obj = obj;
            if (cache.size() >= MAXSIZE)
                trimCache();
            cache.put(key, wobj);
        }
        return (obj);
    }

    public int putRecord(Integer site_hdr_id, Integer page_id, Integer parent_id, Integer page_order, Integer modify_by, Date modify_date) throws SQLException {
        String identifier = getKey(site_hdr_id);
        PreparedStatement ps = null;
        Connection conn = null;
        StringBuffer update = new StringBuffer();
        WebPagePathObjectWrapper obj = null;
        int count = 0;

        obj = (WebPagePathObjectWrapper) cache.get(getKey(site_hdr_id));
        update.append("UPDATE WEB_PAGE_PATH SET ");
        if (page_id != null) {
            if (obj != null)
                obj.obj.page_id = page_id;
            if (count > 0)
                update.append(", ");
            update.append("PAGE_ID = " + page_id.intValue());
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
        if (page_order != null) {
            if (obj != null)
                obj.obj.page_order = page_order;
            if (count > 0)
                update.append(", ");
            update.append("PAGE_ORDER = " + page_order.intValue());
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
        update.append(" WHERE SITE_HDR_ID = " + site_hdr_id);
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

    public String findByPageId(Integer page_id) throws SQLException {
        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        Vector results = new Vector();
        String query = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            query = "SELECT SITE_HDR_ID FROM WEB_PAGE_PATH WHERE PAGE_ID = " + page_id;
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
        WebPagePathObjectWrapper oldest = null;
        WebPagePathObjectWrapper current = null;
        Enumeration e;

        e = cache.elements();
        while (e.hasMoreElements()) {
            current = (WebPagePathObjectWrapper) e.nextElement();
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
