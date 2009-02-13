package com.topcoder.web.render.ejb;

import javax.ejb.EJBException;
import javax.ejb.SessionContext;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.io.InputStream;
import java.sql.*;
import java.util.Enumeration;
import java.util.Hashtable;

public class WebCountryLanguageBean implements javax.ejb.SessionBean {

    static Hashtable cache = new Hashtable();
    public SessionContext context = null;
    public static int MAXSIZE = -1;

    public String getKey(String language_cd, String country_code) {
        StringBuffer sb = null;
        String key = "";

        sb = new StringBuffer(language_cd);
        sb.setLength(2);
        key += sb.toString();
        sb = new StringBuffer(country_code);
        sb.setLength(3);
        key += sb.toString();
        return (key);
    }

    public String getKey(WebCountryLanguageObject obj) {
        return (getKey(obj.language_cd, obj.country_code));
    }

    public void create(String language_cd, String country_code) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;

        String insert = "INSERT INTO WEB_COUNTRY_LANGUAGE VALUES (  '" + language_cd + "', '" + country_code + "' )";

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

    public void delete(String language_cd, String country_code) throws SQLException {
        Connection conn = null;
        String delete = "DELETE FROM WEB_COUNTRY_LANGUAGE WHERE LANGUAGE_CD = '" + language_cd + "'" + " AND COUNTRY_CODE = '" + country_code + "'";
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
        cache.remove(getKey(language_cd, country_code));
        try {
            if (ps != null) ps.close();
        } catch (Exception f) {
        }
        try {
            if (conn != null) conn.close();
        } catch (Exception f) {
        }
    }

    public WebCountryLanguageObject request(int cmd, WebCountryLanguageObject obj) throws SQLException {

        switch (cmd) {

            case WebCountryLanguage.INSERT:
                create(obj.language_cd, obj.country_code);
                break;

            case WebCountryLanguage.SELECT:
                obj = getRecord(obj.language_cd, obj.country_code);
                if (obj == null)
                    throw new EJBException(
                            "no matching record");
                break;

            case WebCountryLanguage.UPDATE:
                putRecord(obj.language_cd, obj.country_code);
                break;

            case WebCountryLanguage.DELETE:
                delete(obj.language_cd, obj.country_code);
                break;

        }
        return (obj);
    }

    private class WebCountryLanguageObjectWrapper {
        WebCountryLanguageObject obj;
        Date lastUsed;

        WebCountryLanguageObjectWrapper() {
            lastUsed = new Date(System.currentTimeMillis());
        }
    }

    private class RecordNotFoundException extends Exception {
    }

    private WebCountryLanguageObject getRecord(String language_cd, String country_code) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String key = getKey(language_cd, country_code);
        WebCountryLanguageObject obj = null;
        WebCountryLanguageObjectWrapper wobj = (WebCountryLanguageObjectWrapper) cache.get(key);
        if (wobj != null) {
            wobj.lastUsed = new Date(System.currentTimeMillis());
            return (wobj.obj);
        }
        obj = new WebCountryLanguageObject();
        String query = "SELECT * FROM WEB_COUNTRY_LANGUAGE WHERE LANGUAGE_CD = '" + language_cd + "'" + " AND COUNTRY_CODE = '" + country_code + "'";
        InputStream is = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (!rs.next())
                throw new RecordNotFoundException();
            obj.language_cd = rs.getString(1);
            if (rs.wasNull())
                obj.language_cd = null;
            obj.country_code = rs.getString(2);
            if (rs.wasNull())
                obj.country_code = null;
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
            wobj = new WebCountryLanguageObjectWrapper();
            wobj.obj = obj;
            if (cache.size() >= MAXSIZE)
                trimCache();
            cache.put(key, wobj);
        }
        return (obj);
    }

    public int putRecord(String language_cd, String country_code) throws SQLException {
        String identifier = getKey(language_cd, country_code);
        PreparedStatement ps = null;
        Connection conn = null;
        StringBuffer update = new StringBuffer();
        WebCountryLanguageObjectWrapper obj = null;
        int count = 0;

        obj = (WebCountryLanguageObjectWrapper) cache.get(getKey(language_cd, country_code));
        update.append("UPDATE WEB_COUNTRY_LANGUAGE SET ");
        update.append(" WHERE LANGUAGE_CD = '" + language_cd + "'" + " AND COUNTRY_CODE = '" + country_code + "'");
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
        WebCountryLanguageObjectWrapper oldest = null;
        WebCountryLanguageObjectWrapper current = null;
        Enumeration e;

        e = cache.elements();
        while (e.hasMoreElements()) {
            current = (WebCountryLanguageObjectWrapper) e.nextElement();
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
