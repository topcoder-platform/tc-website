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

public class WebMenuHdrBean implements javax.ejb.SessionBean {

    static Hashtable cache = new Hashtable();
    public SessionContext context = null;
    public static int MAXSIZE = -1;
    public static final DecimalFormat fmt0 = new DecimalFormat("0000000000");

    public String getKey(Integer menu_hdr_id) {
        String key = "";

        key += fmt0.format(menu_hdr_id);
        return (key);
    }

    public String getKey(WebMenuHdrObject obj) {
        return (getKey(obj.menu_hdr_id));
    }

    public void create(Integer menu_hdr_id, String country_code, String language_cd, Integer style_id, Integer menu_type_id, String menu_hdr_name, String menu_hdr_desc, Date created, Integer modify_by, Date modify_date) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;

        String insert = "INSERT INTO WEB_MENU_HDR VALUES (  " + menu_hdr_id + ", '" + country_code + "', '" + language_cd + "', " + style_id + ", " + menu_type_id + ", '" + menu_hdr_name + "', '" + menu_hdr_desc + "', ?, " + modify_by + ", ? )";

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

    public void delete(Integer menu_hdr_id) throws SQLException {
        Connection conn = null;
        String delete = "DELETE FROM WEB_MENU_HDR WHERE MENU_HDR_ID = " + menu_hdr_id;
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
        cache.remove(getKey(menu_hdr_id));
        try {
            if (ps != null) ps.close();
        } catch (Exception f) {
        }
        try {
            if (conn != null) conn.close();
        } catch (Exception f) {
        }
    }

    public WebMenuHdrObject request(int cmd, WebMenuHdrObject obj) throws SQLException {

        switch (cmd) {

            case WebMenuHdr.INSERT:
                create(obj.menu_hdr_id, obj.country_code, obj.language_cd, obj.style_id, obj.menu_type_id, obj.menu_hdr_name, obj.menu_hdr_desc, obj.created, obj.modify_by, obj.modify_date);
                break;

            case WebMenuHdr.SELECT:
                obj = getRecord(obj.menu_hdr_id);
                if (obj == null)
                    throw new EJBException(
                            "no matching record");
                break;

            case WebMenuHdr.UPDATE:
                putRecord(obj.menu_hdr_id, obj.country_code, obj.language_cd, obj.style_id, obj.menu_type_id, obj.menu_hdr_name, obj.menu_hdr_desc, obj.created, obj.modify_by, obj.modify_date);
                break;

            case WebMenuHdr.DELETE:
                delete(obj.menu_hdr_id);
                break;

        }
        return (obj);
    }

    public void setCountryCode(Integer menu_hdr_id, String country_code) throws SQLException {
        putRecord(menu_hdr_id, country_code, null, null, null, null, null, null, null, null);
    }

    public String getCountryCode(Integer menu_hdr_id) throws SQLException {
        WebMenuHdrObject obj = null;
        String result;

        obj = getRecord(menu_hdr_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.country_code);
    }

    public void setLanguageCd(Integer menu_hdr_id, String language_cd) throws SQLException {
        putRecord(menu_hdr_id, null, language_cd, null, null, null, null, null, null, null);
    }

    public String getLanguageCd(Integer menu_hdr_id) throws SQLException {
        WebMenuHdrObject obj = null;
        String result;

        obj = getRecord(menu_hdr_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.language_cd);
    }

    public void setStyleId(Integer menu_hdr_id, Integer style_id) throws SQLException {
        putRecord(menu_hdr_id, null, null, style_id, null, null, null, null, null, null);
    }

    public Integer getStyleId(Integer menu_hdr_id) throws SQLException {
        WebMenuHdrObject obj = null;
        Integer result;

        obj = getRecord(menu_hdr_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.style_id);
    }

    public void setMenuTypeId(Integer menu_hdr_id, Integer menu_type_id) throws SQLException {
        putRecord(menu_hdr_id, null, null, null, menu_type_id, null, null, null, null, null);
    }

    public Integer getMenuTypeId(Integer menu_hdr_id) throws SQLException {
        WebMenuHdrObject obj = null;
        Integer result;

        obj = getRecord(menu_hdr_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.menu_type_id);
    }

    public void setMenuHdrName(Integer menu_hdr_id, String menu_hdr_name) throws SQLException {
        putRecord(menu_hdr_id, null, null, null, null, menu_hdr_name, null, null, null, null);
    }

    public String getMenuHdrName(Integer menu_hdr_id) throws SQLException {
        WebMenuHdrObject obj = null;
        String result;

        obj = getRecord(menu_hdr_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.menu_hdr_name);
    }

    public void setMenuHdrDesc(Integer menu_hdr_id, String menu_hdr_desc) throws SQLException {
        putRecord(menu_hdr_id, null, null, null, null, null, menu_hdr_desc, null, null, null);
    }

    public String getMenuHdrDesc(Integer menu_hdr_id) throws SQLException {
        WebMenuHdrObject obj = null;
        String result;

        obj = getRecord(menu_hdr_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.menu_hdr_desc);
    }

    public void setCreated(Integer menu_hdr_id, Date created) throws SQLException {
        putRecord(menu_hdr_id, null, null, null, null, null, null, created, null, null);
    }

    public Date getCreated(Integer menu_hdr_id) throws SQLException {
        WebMenuHdrObject obj = null;
        Date result;

        obj = getRecord(menu_hdr_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.created);
    }

    public void setModifyBy(Integer menu_hdr_id, Integer modify_by) throws SQLException {
        putRecord(menu_hdr_id, null, null, null, null, null, null, null, modify_by, null);
    }

    public Integer getModifyBy(Integer menu_hdr_id) throws SQLException {
        WebMenuHdrObject obj = null;
        Integer result;

        obj = getRecord(menu_hdr_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.modify_by);
    }

    public void setModifyDate(Integer menu_hdr_id, Date modify_date) throws SQLException {
        putRecord(menu_hdr_id, null, null, null, null, null, null, null, null, modify_date);
    }

    public Date getModifyDate(Integer menu_hdr_id) throws SQLException {
        WebMenuHdrObject obj = null;
        Date result;

        obj = getRecord(menu_hdr_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.modify_date);
    }

    private class WebMenuHdrObjectWrapper {
        WebMenuHdrObject obj;
        Date lastUsed;

        WebMenuHdrObjectWrapper() {
            lastUsed = new Date(System.currentTimeMillis());
        }
    }

    private class RecordNotFoundException extends Exception {
    }

    private WebMenuHdrObject getRecord(Integer menu_hdr_id) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String key = getKey(menu_hdr_id);
        WebMenuHdrObject obj = null;
        WebMenuHdrObjectWrapper wobj = (WebMenuHdrObjectWrapper) cache.get(key);
        if (wobj != null) {
            wobj.lastUsed = new Date(System.currentTimeMillis());
            return (wobj.obj);
        }
        obj = new WebMenuHdrObject();
        String query = "SELECT * FROM WEB_MENU_HDR WHERE MENU_HDR_ID = " + menu_hdr_id;
        InputStream is = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (!rs.next())
                throw new RecordNotFoundException();
            obj.menu_hdr_id = new Integer(rs.getInt(1));
            if (rs.wasNull())
                obj.menu_hdr_id = null;
            obj.country_code = rs.getString(2);
            if (rs.wasNull())
                obj.country_code = null;
            obj.language_cd = rs.getString(3);
            if (rs.wasNull())
                obj.language_cd = null;
            obj.style_id = new Integer(rs.getInt(4));
            if (rs.wasNull())
                obj.style_id = null;
            obj.menu_type_id = new Integer(rs.getInt(5));
            if (rs.wasNull())
                obj.menu_type_id = null;
            obj.menu_hdr_name = rs.getString(6);
            if (rs.wasNull())
                obj.menu_hdr_name = null;
            obj.menu_hdr_desc = rs.getString(7);
            if (rs.wasNull())
                obj.menu_hdr_desc = null;
            obj.created = rs.getDate(8);
            if (rs.wasNull())
                obj.created = null;
            obj.modify_by = new Integer(rs.getInt(9));
            if (rs.wasNull())
                obj.modify_by = null;
            obj.modify_date = rs.getDate(10);
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
            wobj = new WebMenuHdrObjectWrapper();
            wobj.obj = obj;
            if (cache.size() >= MAXSIZE)
                trimCache();
            cache.put(key, wobj);
        }
        return (obj);
    }

    public int putRecord(Integer menu_hdr_id, String country_code, String language_cd, Integer style_id, Integer menu_type_id, String menu_hdr_name, String menu_hdr_desc, Date created, Integer modify_by, Date modify_date) throws SQLException {
        String identifier = getKey(menu_hdr_id);
        PreparedStatement ps = null;
        Connection conn = null;
        StringBuffer update = new StringBuffer();
        WebMenuHdrObjectWrapper obj = null;
        int count = 0;

        obj = (WebMenuHdrObjectWrapper) cache.get(getKey(menu_hdr_id));
        update.append("UPDATE WEB_MENU_HDR SET ");
        if (country_code != null) {
            if (obj != null)
                obj.obj.country_code = country_code;
            if (count > 0)
                update.append(", ");
            update.append("COUNTRY_CODE = '" + country_code + "'");
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
        if (style_id != null) {
            if (obj != null)
                obj.obj.style_id = style_id;
            if (count > 0)
                update.append(", ");
            update.append("STYLE_ID = " + style_id.intValue());
            count++;
        }
        if (menu_type_id != null) {
            if (obj != null)
                obj.obj.menu_type_id = menu_type_id;
            if (count > 0)
                update.append(", ");
            update.append("MENU_TYPE_ID = " + menu_type_id.intValue());
            count++;
        }
        if (menu_hdr_name != null) {
            if (obj != null)
                obj.obj.menu_hdr_name = menu_hdr_name;
            if (count > 0)
                update.append(", ");
            update.append("MENU_HDR_NAME = '" + menu_hdr_name + "'");
            count++;
        }
        if (menu_hdr_desc != null) {
            if (obj != null)
                obj.obj.menu_hdr_desc = menu_hdr_desc;
            if (count > 0)
                update.append(", ");
            update.append("MENU_HDR_DESC = '" + menu_hdr_desc + "'");
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
        update.append(" WHERE MENU_HDR_ID = " + menu_hdr_id);
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
        WebMenuHdrObjectWrapper oldest = null;
        WebMenuHdrObjectWrapper current = null;
        Enumeration e;

        e = cache.elements();
        while (e.hasMoreElements()) {
            current = (WebMenuHdrObjectWrapper) e.nextElement();
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
