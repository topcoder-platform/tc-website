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

public class WebPageBean implements javax.ejb.SessionBean {

    static Hashtable cache = new Hashtable();
    public SessionContext context = null;
    public static int MAXSIZE = -1;
    public static final DecimalFormat fmt0 = new DecimalFormat("0000000000");

    public String getKey(Integer page_id) {
        String key = "";

        key += fmt0.format(page_id);
        return (key);
    }

    public String getKey(WebPageObject obj) {
        return (getKey(obj.page_id));
    }

    public void create(Integer page_id, String language_cd, String page_name, Integer status_id, String page_title, String page_path, Integer sort_number, Integer site_hdr_id, String country_code, Integer modify_by, Date modify_date) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;

        String insert = "INSERT INTO WEB_PAGE VALUES (  " + page_id + ", '" + language_cd + "', '" + page_name + "', " + status_id + ", '" + page_title + "', '" + page_path + "', " + sort_number + ", " + site_hdr_id + ", '" + country_code + "', " + modify_by + ", ? )";

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

    public void delete(Integer page_id) throws SQLException {
        Connection conn = null;
        String delete = "DELETE FROM WEB_PAGE WHERE PAGE_ID = " + page_id;
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
        cache.remove(getKey(page_id));
        try {
            if (ps != null) ps.close();
        } catch (Exception f) {
        }
        try {
            if (conn != null) conn.close();
        } catch (Exception f) {
        }
    }

    public WebPageObject request(int cmd, WebPageObject obj) throws SQLException {

        switch (cmd) {

            case WebPage.INSERT:
                create(obj.page_id, obj.language_cd, obj.page_name, obj.status_id, obj.page_title, obj.page_path, obj.sort_number, obj.site_hdr_id, obj.country_code, obj.modify_by, obj.modify_date);
                break;

            case WebPage.SELECT:
                obj = getRecord(obj.page_id);
                if (obj == null)
                    throw new EJBException(
                            "no matching record");
                break;

            case WebPage.UPDATE:
                putRecord(obj.page_id, obj.language_cd, obj.page_name, obj.status_id, obj.page_title, obj.page_path, obj.sort_number, obj.site_hdr_id, obj.country_code, obj.modify_by, obj.modify_date);
                break;

            case WebPage.DELETE:
                delete(obj.page_id);
                break;

        }
        return (obj);
    }

    public void setLanguageCd(Integer page_id, String language_cd) throws SQLException {
        putRecord(page_id, language_cd, null, null, null, null, null, null, null, null, null);
    }

    public String getLanguageCd(Integer page_id) throws SQLException {
        WebPageObject obj = null;
        String result;

        obj = getRecord(page_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.language_cd);
    }

    public void setPageName(Integer page_id, String page_name) throws SQLException {
        putRecord(page_id, null, page_name, null, null, null, null, null, null, null, null);
    }

    public String getPageName(Integer page_id) throws SQLException {
        WebPageObject obj = null;
        String result;

        obj = getRecord(page_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.page_name);
    }

    public void setStatusId(Integer page_id, Integer status_id) throws SQLException {
        putRecord(page_id, null, null, status_id, null, null, null, null, null, null, null);
    }

    public Integer getStatusId(Integer page_id) throws SQLException {
        WebPageObject obj = null;
        Integer result;

        obj = getRecord(page_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.status_id);
    }

    public void setPageTitle(Integer page_id, String page_title) throws SQLException {
        putRecord(page_id, null, null, null, page_title, null, null, null, null, null, null);
    }

    public String getPageTitle(Integer page_id) throws SQLException {
        WebPageObject obj = null;
        String result;

        obj = getRecord(page_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.page_title);
    }

    public void setPagePath(Integer page_id, String page_path) throws SQLException {
        putRecord(page_id, null, null, null, null, page_path, null, null, null, null, null);
    }

    public String getPagePath(Integer page_id) throws SQLException {
        WebPageObject obj = null;
        String result;

        obj = getRecord(page_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.page_path);
    }

    public void setSortNumber(Integer page_id, Integer sort_number) throws SQLException {
        putRecord(page_id, null, null, null, null, null, sort_number, null, null, null, null);
    }

    public Integer getSortNumber(Integer page_id) throws SQLException {
        WebPageObject obj = null;
        Integer result;

        obj = getRecord(page_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.sort_number);
    }

    public void setSiteHdrId(Integer page_id, Integer site_hdr_id) throws SQLException {
        putRecord(page_id, null, null, null, null, null, null, site_hdr_id, null, null, null);
    }

    public Integer getSiteHdrId(Integer page_id) throws SQLException {
        WebPageObject obj = null;
        Integer result;

        obj = getRecord(page_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.site_hdr_id);
    }

    public void setCountryCode(Integer page_id, String country_code) throws SQLException {
        putRecord(page_id, null, null, null, null, null, null, null, country_code, null, null);
    }

    public String getCountryCode(Integer page_id) throws SQLException {
        WebPageObject obj = null;
        String result;

        obj = getRecord(page_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.country_code);
    }

    public void setModifyBy(Integer page_id, Integer modify_by) throws SQLException {
        putRecord(page_id, null, null, null, null, null, null, null, null, modify_by, null);
    }

    public Integer getModifyBy(Integer page_id) throws SQLException {
        WebPageObject obj = null;
        Integer result;

        obj = getRecord(page_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.modify_by);
    }

    public void setModifyDate(Integer page_id, Date modify_date) throws SQLException {
        putRecord(page_id, null, null, null, null, null, null, null, null, null, modify_date);
    }

    public Date getModifyDate(Integer page_id) throws SQLException {
        WebPageObject obj = null;
        Date result;

        obj = getRecord(page_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.modify_date);
    }

    private class WebPageObjectWrapper {
        WebPageObject obj;
        Date lastUsed;

        WebPageObjectWrapper() {
            lastUsed = new Date(System.currentTimeMillis());
        }
    }

    private class RecordNotFoundException extends Exception {
    }

    private WebPageObject getRecord(Integer page_id) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String key = getKey(page_id);
        WebPageObject obj = null;
        WebPageObjectWrapper wobj = (WebPageObjectWrapper) cache.get(key);
        if (wobj != null) {
            wobj.lastUsed = new Date(System.currentTimeMillis());
            return (wobj.obj);
        }
        obj = new WebPageObject();
        String query = "SELECT * FROM WEB_PAGE WHERE PAGE_ID = " + page_id;
        InputStream is = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (!rs.next())
                throw new RecordNotFoundException();
            obj.page_id = new Integer(rs.getInt(1));
            if (rs.wasNull())
                obj.page_id = null;
            obj.language_cd = rs.getString(2);
            if (rs.wasNull())
                obj.language_cd = null;
            obj.page_name = rs.getString(3);
            if (rs.wasNull())
                obj.page_name = null;
            obj.status_id = new Integer(rs.getInt(4));
            if (rs.wasNull())
                obj.status_id = null;
            obj.page_title = rs.getString(5);
            if (rs.wasNull())
                obj.page_title = null;
            obj.page_path = rs.getString(6);
            if (rs.wasNull())
                obj.page_path = null;
            obj.sort_number = new Integer(rs.getInt(7));
            if (rs.wasNull())
                obj.sort_number = null;
            obj.site_hdr_id = new Integer(rs.getInt(8));
            if (rs.wasNull())
                obj.site_hdr_id = null;
            obj.country_code = rs.getString(9);
            if (rs.wasNull())
                obj.country_code = null;
            obj.modify_by = new Integer(rs.getInt(10));
            if (rs.wasNull())
                obj.modify_by = null;
            obj.modify_date = rs.getDate(11);
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
            wobj = new WebPageObjectWrapper();
            wobj.obj = obj;
            if (cache.size() >= MAXSIZE)
                trimCache();
            cache.put(key, wobj);
        }
        return (obj);
    }

    public int putRecord(Integer page_id, String language_cd, String page_name, Integer status_id, String page_title, String page_path, Integer sort_number, Integer site_hdr_id, String country_code, Integer modify_by, Date modify_date) throws SQLException {
        String identifier = getKey(page_id);
        PreparedStatement ps = null;
        Connection conn = null;
        StringBuffer update = new StringBuffer();
        WebPageObjectWrapper obj = null;
        int count = 0;

        obj = (WebPageObjectWrapper) cache.get(getKey(page_id));
        update.append("UPDATE WEB_PAGE SET ");
        if (language_cd != null) {
            if (obj != null)
                obj.obj.language_cd = language_cd;
            if (count > 0)
                update.append(", ");
            update.append("LANGUAGE_CD = '" + language_cd + "'");
            count++;
        }
        if (page_name != null) {
            if (obj != null)
                obj.obj.page_name = page_name;
            if (count > 0)
                update.append(", ");
            update.append("PAGE_NAME = '" + page_name + "'");
            count++;
        }
        if (status_id != null) {
            if (obj != null)
                obj.obj.status_id = status_id;
            if (count > 0)
                update.append(", ");
            update.append("STATUS_ID = " + status_id.intValue());
            count++;
        }
        if (page_title != null) {
            if (obj != null)
                obj.obj.page_title = page_title;
            if (count > 0)
                update.append(", ");
            update.append("PAGE_TITLE = '" + page_title + "'");
            count++;
        }
        if (page_path != null) {
            if (obj != null)
                obj.obj.page_path = page_path;
            if (count > 0)
                update.append(", ");
            update.append("PAGE_PATH = '" + page_path + "'");
            count++;
        }
        if (sort_number != null) {
            if (obj != null)
                obj.obj.sort_number = sort_number;
            if (count > 0)
                update.append(", ");
            update.append("SORT_NUMBER = " + sort_number.intValue());
            count++;
        }
        if (site_hdr_id != null) {
            if (obj != null)
                obj.obj.site_hdr_id = site_hdr_id;
            if (count > 0)
                update.append(", ");
            update.append("SITE_HDR_ID = " + site_hdr_id.intValue());
            count++;
        }
        if (country_code != null) {
            if (obj != null)
                obj.obj.country_code = country_code;
            if (count > 0)
                update.append(", ");
            update.append("COUNTRY_CODE = '" + country_code + "'");
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
        update.append(" WHERE PAGE_ID = " + page_id);
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

    public String findByPageName(String page_name) throws SQLException {
        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        Vector results = new Vector();
        String query = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            if (page_name.indexOf('%') >= 0)
                query = "SELECT PAGE_ID FROM WEB_PAGE WHERE PAGE_NAME LIKE '" + page_name + "'";
            else
                query = "SELECT PAGE_ID FROM WEB_PAGE WHERE PAGE_NAME = '" + page_name + "'";
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

    public String findByPageTitle(String page_title) throws SQLException {
        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        Vector results = new Vector();
        String query = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            if (page_title.indexOf('%') >= 0)
                query = "SELECT PAGE_ID FROM WEB_PAGE WHERE PAGE_TITLE LIKE '" + page_title + "'";
            else
                query = "SELECT PAGE_ID FROM WEB_PAGE WHERE PAGE_TITLE = '" + page_title + "'";
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

    public String findBySiteHdrId(Integer site_hdr_id) throws SQLException {
        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        Vector results = new Vector();
        String query = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            query = "SELECT PAGE_ID FROM WEB_PAGE WHERE SITE_HDR_ID = " + site_hdr_id;
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
        WebPageObjectWrapper oldest = null;
        WebPageObjectWrapper current = null;
        Enumeration e;

        e = cache.elements();
        while (e.hasMoreElements()) {
            current = (WebPageObjectWrapper) e.nextElement();
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
