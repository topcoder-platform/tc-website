package com.topcoder.web.render.ejb;

import com.topcoder.shared.util.DBMS;

import javax.ejb.EJBException;
import javax.ejb.SessionContext;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.sql.*;
import java.sql.Date;
import java.text.DecimalFormat;
import java.util.*;

public class WebContentBean implements javax.ejb.SessionBean {

    static Hashtable cache = new Hashtable();
    public SessionContext context = null;
    public static int MAXSIZE = -1;
    public static final DecimalFormat fmt0 = new DecimalFormat("0000000000");

    public String getKey(Integer content_id) {
        String key = "";

        key += fmt0.format(content_id);
        return (key);
    }

    public String getKey(WebContentObject obj) {
        return (getKey(obj.content_id));
    }

    public void create(Integer content_id, Integer content_group_id, Object content, String content_name, Integer status_id, String language_cd, String country_code, Integer modify_by, Date modify_date) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;

        String insert = "INSERT INTO WEB_CONTENT VALUES (  " + content_id + ", " + content_group_id + ", ?, '" + content_name + "', " + status_id + ", '" + language_cd + "', '" + country_code + "', " + modify_by + ", ? )";

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(insert);
            ps.setBytes(1, DBMS.serializeBlobObject(content));
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

    public void delete(Integer content_id) throws SQLException {
        Connection conn = null;
        String delete = "DELETE FROM WEB_CONTENT WHERE CONTENT_ID = " + content_id;
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
        cache.remove(getKey(content_id));
        try {
            if (ps != null) ps.close();
        } catch (Exception f) {
        }
        try {
            if (conn != null) conn.close();
        } catch (Exception f) {
        }
    }

    public WebContentObject request(int cmd, WebContentObject obj) throws SQLException {

        switch (cmd) {

            case WebContent.INSERT:
                create(obj.content_id, obj.content_group_id, obj.content, obj.content_name, obj.status_id, obj.language_cd, obj.country_code, obj.modify_by, obj.modify_date);
                break;

            case WebContent.SELECT:
                obj = getRecord(obj.content_id);
                if (obj == null)
                    throw new EJBException(
                            "no matching record");
                break;

            case WebContent.UPDATE:
                putRecord(obj.content_id, obj.content_group_id, obj.content, obj.content_name, obj.status_id, obj.language_cd, obj.country_code, obj.modify_by, obj.modify_date);
                break;

            case WebContent.DELETE:
                delete(obj.content_id);
                break;

        }
        return (obj);
    }

    public void setContentGroupId(Integer content_id, Integer content_group_id) throws SQLException {
        putRecord(content_id, content_group_id, null, null, null, null, null, null, null);
    }

    public Integer getContentGroupId(Integer content_id) throws SQLException {
        WebContentObject obj = null;
        Integer result;

        obj = getRecord(content_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.content_group_id);
    }

    public void setContent(Integer content_id, Object content) throws SQLException {
        putRecord(content_id, null, content, null, null, null, null, null, null);
    }

    public Object getContent(Integer content_id) throws SQLException {
        WebContentObject obj = null;
        Object result;

        obj = getRecord(content_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.content);
    }

    public void setContentName(Integer content_id, String content_name) throws SQLException {
        putRecord(content_id, null, null, content_name, null, null, null, null, null);
    }

    public String getContentName(Integer content_id) throws SQLException {
        WebContentObject obj = null;
        String result;

        obj = getRecord(content_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.content_name);
    }

    public void setStatusId(Integer content_id, Integer status_id) throws SQLException {
        putRecord(content_id, null, null, null, status_id, null, null, null, null);
    }

    public Integer getStatusId(Integer content_id) throws SQLException {
        WebContentObject obj = null;
        Integer result;

        obj = getRecord(content_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.status_id);
    }

    public void setLanguageCd(Integer content_id, String language_cd) throws SQLException {
        putRecord(content_id, null, null, null, null, language_cd, null, null, null);
    }

    public String getLanguageCd(Integer content_id) throws SQLException {
        WebContentObject obj = null;
        String result;

        obj = getRecord(content_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.language_cd);
    }

    public void setCountryCode(Integer content_id, String country_code) throws SQLException {
        putRecord(content_id, null, null, null, null, null, country_code, null, null);
    }

    public String getCountryCode(Integer content_id) throws SQLException {
        WebContentObject obj = null;
        String result;

        obj = getRecord(content_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.country_code);
    }

    public void setModifyBy(Integer content_id, Integer modify_by) throws SQLException {
        putRecord(content_id, null, null, null, null, null, null, modify_by, null);
    }

    public Integer getModifyBy(Integer content_id) throws SQLException {
        WebContentObject obj = null;
        Integer result;

        obj = getRecord(content_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.modify_by);
    }

    public void setModifyDate(Integer content_id, Date modify_date) throws SQLException {
        putRecord(content_id, null, null, null, null, null, null, null, modify_date);
    }

    public Date getModifyDate(Integer content_id) throws SQLException {
        WebContentObject obj = null;
        Date result;

        obj = getRecord(content_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.modify_date);
    }

    private class WebContentObjectWrapper {
        WebContentObject obj;
        Date lastUsed;

        WebContentObjectWrapper() {
            lastUsed = new Date(System.currentTimeMillis());
        }
    }

    private class RecordNotFoundException extends Exception {
    }


    private WebContentObject getRecord(Integer content_id) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        WebContentObject obj = null;
        try {
            String key = getKey(content_id);
            WebContentObjectWrapper wobj = (WebContentObjectWrapper) cache.get(key);
            if (wobj != null) {
                wobj.lastUsed = new Date(System.currentTimeMillis());
                return (wobj.obj);
            }
            obj = new WebContentObject();
            String query = "SELECT * FROM WEB_CONTENT WHERE CONTENT_ID = " + content_id;
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (!rs.next())
                throw new RecordNotFoundException();
            obj.content_id = new Integer(rs.getInt(1));
            if (rs.wasNull())
                obj.content_id = null;
            obj.content_group_id = new Integer(rs.getInt(2));
            if (rs.wasNull())
                obj.content_group_id = null;
            obj.content = DBMS.getBlobObject(rs, 3);
            if (rs.wasNull())
                obj.content = null;
            obj.content_name = rs.getString(4);
            if (rs.wasNull())
                obj.content_name = null;
            obj.status_id = new Integer(rs.getInt(5));
            if (rs.wasNull())
                obj.status_id = null;
            obj.language_cd = rs.getString(6);
            if (rs.wasNull())
                obj.language_cd = null;
            obj.country_code = rs.getString(7);
            if (rs.wasNull())
                obj.country_code = null;
            obj.modify_by = new Integer(rs.getInt(8));
            if (rs.wasNull())
                obj.modify_by = null;
            obj.modify_date = rs.getDate(9);
            if (rs.wasNull())
                obj.modify_date = null;
            rs.close();
            if (MAXSIZE < 0)
                MAXSIZE = getMaxCacheSize();
            if (MAXSIZE > 0) {
                wobj = new WebContentObjectWrapper();
                wobj.obj = obj;
                if (cache.size() >= MAXSIZE)
                    trimCache();
                cache.put(key, wobj);
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            throw sqle;
        } catch (Exception e) {
            e.printStackTrace();
            obj = null;
        } finally {
            try {
                if (rs != null) rs.close();
            } catch (Exception f) {
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
        return obj;
    }


    public int putRecord(Integer content_id, Integer content_group_id, Object content, String content_name, Integer status_id, String language_cd, String country_code, Integer modify_by, Date modify_date) throws SQLException {
        String identifier = getKey(content_id);
        PreparedStatement ps = null;
        Connection conn = null;
        StringBuffer update = new StringBuffer();
        WebContentObjectWrapper obj = null;
        int count = 0;

        obj = (WebContentObjectWrapper) cache.get(getKey(content_id));
        update.append("UPDATE WEB_CONTENT SET ");
        if (content_group_id != null) {
            if (obj != null)
                obj.obj.content_group_id = content_group_id;
            if (count > 0)
                update.append(", ");
            update.append("CONTENT_GROUP_ID = " + content_group_id.intValue());
            count++;
        }
        if (content != null) {
            if (obj != null)
                obj.obj.content = content;
            if (count > 0)
                update.append(", ");
            update.append("CONTENT =  ?"
            );
            count++;
        }
        if (content_name != null) {
            if (obj != null)
                obj.obj.content_name = content_name;
            if (count > 0)
                update.append(", ");
            update.append("CONTENT_NAME = '" + content_name + "'");
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
        if (language_cd != null) {
            if (obj != null)
                obj.obj.language_cd = language_cd;
            if (count > 0)
                update.append(", ");
            update.append("LANGUAGE_CD = '" + language_cd + "'");
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
        update.append(" WHERE CONTENT_ID = " + content_id);
        if (count == 0)
            return (0);
        int rc = 0;
        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(update.toString());
            int index = 1;
            if (content != null)
                ps.setBytes(index++, DBMS.serializeBlobObject(content));
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

    public String findByContentGroupId(Integer content_group_id) throws SQLException {
        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        Vector results = new Vector();
        String query = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            query = "SELECT CONTENT_ID FROM WEB_CONTENT WHERE CONTENT_GROUP_ID = " + content_group_id;
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

    public String findByContent(Object content) throws SQLException {
        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        Vector results = new Vector();
        String query = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
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

    public String findByContentName(String content_name) throws SQLException {
        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        Vector results = new Vector();
        String query = null;
        Integer recId = null;
        /*
         * modified to lookup in cache first
         */

        if ((recId = findInCacheByName(content_name)) != null) return recId.toString();

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            if (content_name.indexOf('%') >= 0)
                query = "SELECT CONTENT_ID FROM WEB_CONTENT WHERE CONTENT_NAME LIKE '" + content_name + "'";
            else
                query = "SELECT CONTENT_ID FROM WEB_CONTENT WHERE CONTENT_NAME = '" + content_name + "'";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next())
                results.add(new Integer(rs.getInt(1)));
            rs.close();
        } catch (SQLException e) {
            throw e;
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception f) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception f) {
                }
            }
        }
        return flatten(results);
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

    private Integer findInCacheByName(String name) {
        WebContentObjectWrapper wobj = null;
        WebContentObject obj = null;
        Enumeration e;

        if (name == null)
            return (null);
        e = cache.elements();
        while (e.hasMoreElements()) {
            wobj = (WebContentObjectWrapper) e.nextElement();
            obj = wobj.obj;
            if ((obj == null) || (obj.content_name == null))
                continue;
            if (name.equals(obj.content_name))
                return (obj.content_id);
        }
        return (null);
    }

    private void trimCache() {
        WebContentObjectWrapper oldest = null;
        WebContentObjectWrapper current = null;
        Enumeration e;

        e = cache.elements();
        while (e.hasMoreElements()) {
            current = (WebContentObjectWrapper) e.nextElement();
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
