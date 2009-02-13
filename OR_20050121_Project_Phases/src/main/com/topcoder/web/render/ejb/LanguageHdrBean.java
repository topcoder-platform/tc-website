package com.topcoder.web.render.ejb;

import javax.ejb.EJBException;
import javax.ejb.SessionContext;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.io.InputStream;
import java.sql.*;
import java.util.Enumeration;
import java.util.Hashtable;

public class LanguageHdrBean implements javax.ejb.SessionBean {

    static Hashtable cache = new Hashtable();
    public SessionContext context = null;
    public static int MAXSIZE = -1;

    public String getKey(String language_cd) {
        StringBuffer sb = null;
        String key = "";

        sb = new StringBuffer(language_cd);
        sb.setLength(2);
        key += sb.toString();
        return (key);
    }

    public String getKey(LanguageHdrObject obj) {
        return (getKey(obj.language_cd));
    }

    public void create(String language_cd, String language_decode, String language_desc) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;

        String insert = "INSERT INTO LANGUAGE_HDR VALUES (  '" + language_cd + "', '" + language_decode + "', '" + language_desc + "' )";

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

    public void delete(String language_cd) throws SQLException {
        Connection conn = null;
        String delete = "DELETE FROM LANGUAGE_HDR WHERE LANGUAGE_CD = '" + language_cd + "'";
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
        cache.remove(getKey(language_cd));
        try {
            if (ps != null) ps.close();
        } catch (Exception f) {
        }
        try {
            if (conn != null) conn.close();
        } catch (Exception f) {
        }
    }

    public LanguageHdrObject request(int cmd, LanguageHdrObject obj) throws SQLException {

        switch (cmd) {

            case LanguageHdr.INSERT:
                create(obj.language_cd, obj.language_decode, obj.language_desc);
                break;

            case LanguageHdr.SELECT:
                obj = getRecord(obj.language_cd);
                if (obj == null)
                    throw new EJBException(
                            "no matching record");
                break;

            case LanguageHdr.UPDATE:
                putRecord(obj.language_cd, obj.language_decode, obj.language_desc);
                break;

            case LanguageHdr.DELETE:
                delete(obj.language_cd);
                break;

        }
        return (obj);
    }

    public void setLanguageDecode(String language_cd, String language_decode) throws SQLException {
        putRecord(language_cd, language_decode, null);
    }

    public String getLanguageDecode(String language_cd) throws SQLException {
        LanguageHdrObject obj = null;
        String result;

        obj = getRecord(language_cd);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.language_decode);
    }

    public void setLanguageDesc(String language_cd, String language_desc) throws SQLException {
        putRecord(language_cd, null, language_desc);
    }

    public String getLanguageDesc(String language_cd) throws SQLException {
        LanguageHdrObject obj = null;
        String result;

        obj = getRecord(language_cd);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.language_desc);
    }

    private class LanguageHdrObjectWrapper {
        LanguageHdrObject obj;
        Date lastUsed;

        LanguageHdrObjectWrapper() {
            lastUsed = new Date(System.currentTimeMillis());
        }
    }

    private class RecordNotFoundException extends Exception {
    }

    private LanguageHdrObject getRecord(String language_cd) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String key = getKey(language_cd);
        LanguageHdrObject obj = null;
        LanguageHdrObjectWrapper wobj = (LanguageHdrObjectWrapper) cache.get(key);
        if (wobj != null) {
            wobj.lastUsed = new Date(System.currentTimeMillis());
            return (wobj.obj);
        }
        obj = new LanguageHdrObject();
        String query = "SELECT * FROM LANGUAGE_HDR WHERE LANGUAGE_CD = '" + language_cd + "'";
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
            obj.language_decode = rs.getString(2);
            if (rs.wasNull())
                obj.language_decode = null;
            obj.language_desc = rs.getString(3);
            if (rs.wasNull())
                obj.language_desc = null;
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
            wobj = new LanguageHdrObjectWrapper();
            wobj.obj = obj;
            if (cache.size() >= MAXSIZE)
                trimCache();
            cache.put(key, wobj);
        }
        return (obj);
    }

    public int putRecord(String language_cd, String language_decode, String language_desc) throws SQLException {
        String identifier = getKey(language_cd);
        PreparedStatement ps = null;
        Connection conn = null;
        StringBuffer update = new StringBuffer();
        LanguageHdrObjectWrapper obj = null;
        int count = 0;

        obj = (LanguageHdrObjectWrapper) cache.get(getKey(language_cd));
        update.append("UPDATE LANGUAGE_HDR SET ");
        if (language_decode != null) {
            if (obj != null)
                obj.obj.language_decode = language_decode;
            if (count > 0)
                update.append(", ");
            update.append("LANGUAGE_DECODE = '" + language_decode + "'");
            count++;
        }
        if (language_desc != null) {
            if (obj != null)
                obj.obj.language_desc = language_desc;
            if (count > 0)
                update.append(", ");
            update.append("LANGUAGE_DESC = '" + language_desc + "'");
            count++;
        }
        update.append(" WHERE LANGUAGE_CD = '" + language_cd + "'");
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
        LanguageHdrObjectWrapper oldest = null;
        LanguageHdrObjectWrapper current = null;
        Enumeration e;

        e = cache.elements();
        while (e.hasMoreElements()) {
            current = (LanguageHdrObjectWrapper) e.nextElement();
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
