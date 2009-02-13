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

public class WebSiteHdrBean implements javax.ejb.SessionBean {

    static Hashtable cache = new Hashtable();
    public SessionContext context = null;
    public static int MAXSIZE = -1;
    public static final DecimalFormat fmt0 = new DecimalFormat("0000000000");

    public String getKey(Integer site_hdr_id) {
        String key = "";

        key += fmt0.format(site_hdr_id);
        return (key);
    }

    public String getKey(WebSiteHdrObject obj) {
        return (getKey(obj.site_hdr_id));
    }

    public void create(Integer site_hdr_id, String site_hdr_name, String site_hdr_desc, Date created, Date modify_date, Integer modify_by) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;

        String insert = "INSERT INTO WEB_SITE_HDR VALUES (  " + site_hdr_id + ", '" + site_hdr_name + "', '" + site_hdr_desc + "', ?, ?, " + modify_by + " )";

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(insert);
            ps.setDate(1, created);
            ps.setDate(2, modify_date);
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
        String delete = "DELETE FROM WEB_SITE_HDR WHERE SITE_HDR_ID = " + site_hdr_id;
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

    public WebSiteHdrObject request(int cmd, WebSiteHdrObject obj) throws SQLException {

        switch (cmd) {

            case WebSiteHdr.INSERT:
                create(obj.site_hdr_id, obj.site_hdr_name, obj.site_hdr_desc, obj.created, obj.modify_date, obj.modify_by);
                break;

            case WebSiteHdr.SELECT:
                obj = getRecord(obj.site_hdr_id);
                if (obj == null)
                    throw new EJBException(
                            "no matching record");
                break;

            case WebSiteHdr.UPDATE:
                putRecord(obj.site_hdr_id, obj.site_hdr_name, obj.site_hdr_desc, obj.created, obj.modify_date, obj.modify_by);
                break;

            case WebSiteHdr.DELETE:
                delete(obj.site_hdr_id);
                break;

        }
        return (obj);
    }

    public void setSiteHdrName(Integer site_hdr_id, String site_hdr_name) throws SQLException {
        putRecord(site_hdr_id, site_hdr_name, null, null, null, null);
    }

    public String getSiteHdrName(Integer site_hdr_id) throws SQLException {
        WebSiteHdrObject obj = null;
        String result;

        obj = getRecord(site_hdr_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.site_hdr_name);
    }

    public void setSiteHdrDesc(Integer site_hdr_id, String site_hdr_desc) throws SQLException {
        putRecord(site_hdr_id, null, site_hdr_desc, null, null, null);
    }

    public String getSiteHdrDesc(Integer site_hdr_id) throws SQLException {
        WebSiteHdrObject obj = null;
        String result;

        obj = getRecord(site_hdr_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.site_hdr_desc);
    }

    public void setCreated(Integer site_hdr_id, Date created) throws SQLException {
        putRecord(site_hdr_id, null, null, created, null, null);
    }

    public Date getCreated(Integer site_hdr_id) throws SQLException {
        WebSiteHdrObject obj = null;
        Date result;

        obj = getRecord(site_hdr_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.created);
    }

    public void setModifyDate(Integer site_hdr_id, Date modify_date) throws SQLException {
        putRecord(site_hdr_id, null, null, null, modify_date, null);
    }

    public Date getModifyDate(Integer site_hdr_id) throws SQLException {
        WebSiteHdrObject obj = null;
        Date result;

        obj = getRecord(site_hdr_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.modify_date);
    }

    public void setModifyBy(Integer site_hdr_id, Integer modify_by) throws SQLException {
        putRecord(site_hdr_id, null, null, null, null, modify_by);
    }

    public Integer getModifyBy(Integer site_hdr_id) throws SQLException {
        WebSiteHdrObject obj = null;
        Integer result;

        obj = getRecord(site_hdr_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.modify_by);
    }

    private class WebSiteHdrObjectWrapper {
        WebSiteHdrObject obj;
        Date lastUsed;

        WebSiteHdrObjectWrapper() {
            lastUsed = new Date(System.currentTimeMillis());
        }
    }

    private class RecordNotFoundException extends Exception {
    }

    private WebSiteHdrObject getRecord(Integer site_hdr_id) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String key = getKey(site_hdr_id);
        WebSiteHdrObject obj = null;
        WebSiteHdrObjectWrapper wobj = (WebSiteHdrObjectWrapper) cache.get(key);
        if (wobj != null) {
            wobj.lastUsed = new Date(System.currentTimeMillis());
            return (wobj.obj);
        }
        obj = new WebSiteHdrObject();
        String query = "SELECT * FROM WEB_SITE_HDR WHERE SITE_HDR_ID = " + site_hdr_id;
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
            obj.site_hdr_name = rs.getString(2);
            if (rs.wasNull())
                obj.site_hdr_name = null;
            obj.site_hdr_desc = rs.getString(3);
            if (rs.wasNull())
                obj.site_hdr_desc = null;
            obj.created = rs.getDate(4);
            if (rs.wasNull())
                obj.created = null;
            obj.modify_date = rs.getDate(5);
            if (rs.wasNull())
                obj.modify_date = null;
            obj.modify_by = new Integer(rs.getInt(6));
            if (rs.wasNull())
                obj.modify_by = null;
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
            wobj = new WebSiteHdrObjectWrapper();
            wobj.obj = obj;
            if (cache.size() >= MAXSIZE)
                trimCache();
            cache.put(key, wobj);
        }
        return (obj);
    }

    public int putRecord(Integer site_hdr_id, String site_hdr_name, String site_hdr_desc, Date created, Date modify_date, Integer modify_by) throws SQLException {
        String identifier = getKey(site_hdr_id);
        PreparedStatement ps = null;
        Connection conn = null;
        StringBuffer update = new StringBuffer();
        WebSiteHdrObjectWrapper obj = null;
        int count = 0;

        obj = (WebSiteHdrObjectWrapper) cache.get(getKey(site_hdr_id));
        update.append("UPDATE WEB_SITE_HDR SET ");
        if (site_hdr_name != null) {
            if (obj != null)
                obj.obj.site_hdr_name = site_hdr_name;
            if (count > 0)
                update.append(", ");
            update.append("SITE_HDR_NAME = '" + site_hdr_name + "'");
            count++;
        }
        if (site_hdr_desc != null) {
            if (obj != null)
                obj.obj.site_hdr_desc = site_hdr_desc;
            if (count > 0)
                update.append(", ");
            update.append("SITE_HDR_DESC = '" + site_hdr_desc + "'");
            count++;
        }
        if (created != null) {
            if (obj != null)
                obj.obj.created = created;
            if (count > 0)
                update.append(", ");
            update.append("CREATED = '" + created + "'");
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
        if (modify_by != null) {
            if (obj != null)
                obj.obj.modify_by = modify_by;
            if (count > 0)
                update.append(", ");
            update.append("MODIFY_BY = " + modify_by.intValue());
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

    public String list() throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Vector results = new Vector();
        String query = "SELECT SITE_HDR_ID FROM WEB_SITE_HDR";

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

    public String findBySiteHdrDesc(String site_hdr_desc) throws SQLException {
        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        Vector results = new Vector();
        String query = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            if (site_hdr_desc.indexOf('%') >= 0)
                query = "SELECT SITE_HDR_ID FROM WEB_SITE_HDR WHERE SITE_HDR_DESC LIKE '" + site_hdr_desc + "'";
            else
                query = "SELECT SITE_HDR_ID FROM WEB_SITE_HDR WHERE SITE_HDR_DESC = '" + site_hdr_desc + "'";
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
        WebSiteHdrObjectWrapper oldest = null;
        WebSiteHdrObjectWrapper current = null;
        Enumeration e;

        e = cache.elements();
        while (e.hasMoreElements()) {
            current = (WebSiteHdrObjectWrapper) e.nextElement();
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
