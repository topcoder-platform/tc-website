package com.topcoder.web.render.ejb;

import javax.ejb.EJBException;
import javax.ejb.SessionContext;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.io.InputStream;
import java.sql.*;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Vector;

public class CountryBean implements javax.ejb.SessionBean {

    static Hashtable cache = new Hashtable();
    public SessionContext context = null;
    public static int MAXSIZE = -1;

    public String getKey(String country_code) {
        StringBuffer sb = null;
        String key = "";

        sb = new StringBuffer(country_code);
        sb.setLength(3);
        key += sb.toString();
        return (key);
    }

    public String getKey(CountryObject obj) {
        return (getKey(obj.country_code));
    }

    public void create(String country_code, String country_name) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;

        String insert = "INSERT INTO COUNTRY VALUES (  '" + country_code + "', '" + country_name + "' )";

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

    public void delete(String country_code) throws SQLException {
        Connection conn = null;
        String delete = "DELETE FROM COUNTRY WHERE COUNTRY_CODE = '" + country_code + "'";
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
        cache.remove(getKey(country_code));
        try {
            if (ps != null) ps.close();
        } catch (Exception f) {
        }
        try {
            if (conn != null) conn.close();
        } catch (Exception f) {
        }
    }

    public CountryObject request(int cmd, CountryObject obj) throws SQLException {

        switch (cmd) {

            case Country.INSERT:
                create(obj.country_code, obj.country_name);
                break;

            case Country.SELECT:
                obj = getRecord(obj.country_code);
                if (obj == null)
                    throw new EJBException(
                            "no matching record");
                break;

            case Country.UPDATE:
                putRecord(obj.country_code, obj.country_name);
                break;

            case Country.DELETE:
                delete(obj.country_code);
                break;

        }
        return (obj);
    }

    public void setCountryName(String country_code, String country_name) throws SQLException {
        putRecord(country_code, country_name);
    }

    public String getCountryName(String country_code) throws SQLException {
        CountryObject obj = null;
        String result;

        obj = getRecord(country_code);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.country_name);
    }

    private class CountryObjectWrapper {
        CountryObject obj;
        Date lastUsed;

        CountryObjectWrapper() {
            lastUsed = new Date(System.currentTimeMillis());
        }
    }

    private class RecordNotFoundException extends Exception {
    }

    private CountryObject getRecord(String country_code) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String key = getKey(country_code);
        CountryObject obj = null;
        CountryObjectWrapper wobj = (CountryObjectWrapper) cache.get(key);
        if (wobj != null) {
            wobj.lastUsed = new Date(System.currentTimeMillis());
            return (wobj.obj);
        }
        obj = new CountryObject();
        String query = "SELECT * FROM COUNTRY WHERE COUNTRY_CODE = '" + country_code + "'";
        InputStream is = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (!rs.next())
                throw new RecordNotFoundException();
            obj.country_code = rs.getString(1);
            if (rs.wasNull())
                obj.country_code = null;
            obj.country_name = rs.getString(2);
            if (rs.wasNull())
                obj.country_name = null;
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
            wobj = new CountryObjectWrapper();
            wobj.obj = obj;
            if (cache.size() >= MAXSIZE)
                trimCache();
            cache.put(key, wobj);
        }
        return (obj);
    }

    public int putRecord(String country_code, String country_name) throws SQLException {
        String identifier = getKey(country_code);
        PreparedStatement ps = null;
        Connection conn = null;
        StringBuffer update = new StringBuffer();
        CountryObjectWrapper obj = null;
        int count = 0;

        obj = (CountryObjectWrapper) cache.get(getKey(country_code));
        update.append("UPDATE COUNTRY SET ");
        if (country_name != null) {
            if (obj != null)
                obj.obj.country_name = country_name;
            if (count > 0)
                update.append(", ");
            update.append("COUNTRY_NAME = '" + country_name + "'");
            count++;
        }
        update.append(" WHERE COUNTRY_CODE = '" + country_code + "'");
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

    public String findByCountryName(String country_name) throws SQLException {
        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        Vector results = new Vector();
        String query = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            if (country_name.indexOf('%') >= 0)
                query = "SELECT COUNTRY_CODE FROM COUNTRY WHERE COUNTRY_NAME LIKE '" + country_name + "'";
            else
                query = "SELECT COUNTRY_CODE FROM COUNTRY WHERE COUNTRY_NAME = '" + country_name + "'";
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
        CountryObjectWrapper oldest = null;
        CountryObjectWrapper current = null;
        Enumeration e;

        e = cache.elements();
        while (e.hasMoreElements()) {
            current = (CountryObjectWrapper) e.nextElement();
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
