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
import java.util.Vector;

public class SectorFileBean implements javax.ejb.SessionBean {

    static Hashtable cache = new Hashtable();
    public SessionContext context = null;
    public static int MAXSIZE = -1;
    public static final DecimalFormat fmt0 = new DecimalFormat("0000000000");

    public String getKey(Integer sector_id) {
        String key = "";

        key += fmt0.format(sector_id);
        return (key);
    }

    public String getKey(SectorFileObject obj) {
        return (getKey(obj.sector_id));
    }

    public void create(Integer sector_id, String file, String system, String status, String language_cd, String path, String link, String country_code, Integer modify_by, Date modify_date) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;

        String insert = "INSERT INTO SECTOR_FILE VALUES (  " + sector_id + ", '" + file + "', '" + system + "', '" + status + "', '" + language_cd + "', '" + path + "', '" + link + "', '" + country_code + "', " + modify_by + ", ? )";

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

    public void delete(Integer sector_id) throws SQLException {
        Connection conn = null;
        String delete = "DELETE FROM SECTOR_FILE WHERE SECTOR_ID = " + sector_id;
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
        cache.remove(getKey(sector_id));
        try {
            if (ps != null) ps.close();
        } catch (Exception f) {
        }
        try {
            if (conn != null) conn.close();
        } catch (Exception f) {
        }
    }

    public SectorFileObject request(int cmd, SectorFileObject obj) throws SQLException {

        switch (cmd) {

            case SectorFile.INSERT:
                create(obj.sector_id, obj.file, obj.system, obj.status, obj.language_cd, obj.path, obj.link, obj.country_code, obj.modify_by, obj.modify_date);
                break;

            case SectorFile.SELECT:
                obj = getRecord(obj.sector_id);
                if (obj == null)
                    throw new EJBException(
                            "no matching record");
                break;

            case SectorFile.UPDATE:
                putRecord(obj.sector_id, obj.file, obj.system, obj.status, obj.language_cd, obj.path, obj.link, obj.country_code, obj.modify_by, obj.modify_date);
                break;

            case SectorFile.DELETE:
                delete(obj.sector_id);
                break;

        }
        return (obj);
    }

    public void setFile(Integer sector_id, String file) throws SQLException {
        putRecord(sector_id, file, null, null, null, null, null, null, null, null);
    }

    public String getFile(Integer sector_id) throws SQLException {
        SectorFileObject obj = null;
        String result;

        obj = getRecord(sector_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.file);
    }

    public void setSystem(Integer sector_id, String system) throws SQLException {
        putRecord(sector_id, null, system, null, null, null, null, null, null, null);
    }

    public String getSystem(Integer sector_id) throws SQLException {
        SectorFileObject obj = null;
        String result;

        obj = getRecord(sector_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.system);
    }

    public void setStatus(Integer sector_id, String status) throws SQLException {
        putRecord(sector_id, null, null, status, null, null, null, null, null, null);
    }

    public String getStatus(Integer sector_id) throws SQLException {
        SectorFileObject obj = null;
        String result;

        obj = getRecord(sector_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.status);
    }

    public void setLanguageCd(Integer sector_id, String language_cd) throws SQLException {
        putRecord(sector_id, null, null, null, language_cd, null, null, null, null, null);
    }

    public String getLanguageCd(Integer sector_id) throws SQLException {
        SectorFileObject obj = null;
        String result;

        obj = getRecord(sector_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.language_cd);
    }

    public void setPath(Integer sector_id, String path) throws SQLException {
        putRecord(sector_id, null, null, null, null, path, null, null, null, null);
    }

    public String getPath(Integer sector_id) throws SQLException {
        SectorFileObject obj = null;
        String result;

        obj = getRecord(sector_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.path);
    }

    public void setLink(Integer sector_id, String link) throws SQLException {
        putRecord(sector_id, null, null, null, null, null, link, null, null, null);
    }

    public String getLink(Integer sector_id) throws SQLException {
        SectorFileObject obj = null;
        String result;

        obj = getRecord(sector_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.link);
    }

    public void setCountryCode(Integer sector_id, String country_code) throws SQLException {
        putRecord(sector_id, null, null, null, null, null, null, country_code, null, null);
    }

    public String getCountryCode(Integer sector_id) throws SQLException {
        SectorFileObject obj = null;
        String result;

        obj = getRecord(sector_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.country_code);
    }

    public void setModifyBy(Integer sector_id, Integer modify_by) throws SQLException {
        putRecord(sector_id, null, null, null, null, null, null, null, modify_by, null);
    }

    public Integer getModifyBy(Integer sector_id) throws SQLException {
        SectorFileObject obj = null;
        Integer result;

        obj = getRecord(sector_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.modify_by);
    }

    public void setModifyDate(Integer sector_id, Date modify_date) throws SQLException {
        putRecord(sector_id, null, null, null, null, null, null, null, null, modify_date);
    }

    public Date getModifyDate(Integer sector_id) throws SQLException {
        SectorFileObject obj = null;
        Date result;

        obj = getRecord(sector_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.modify_date);
    }

    private class SectorFileObjectWrapper {
        SectorFileObject obj;
        Date lastUsed;

        SectorFileObjectWrapper() {
            lastUsed = new Date(System.currentTimeMillis());
        }
    }

    private class RecordNotFoundException extends Exception {
    }

    private SectorFileObject getRecord(Integer sector_id) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String key = getKey(sector_id);
        SectorFileObject obj = null;
        SectorFileObjectWrapper wobj = (SectorFileObjectWrapper) cache.get(key);
        if (wobj != null) {
            wobj.lastUsed = new Date(System.currentTimeMillis());
            return (wobj.obj);
        }
        obj = new SectorFileObject();
        String query = "SELECT * FROM SECTOR_FILE WHERE SECTOR_ID = " + sector_id;
        InputStream is = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (!rs.next())
                throw new RecordNotFoundException();
            obj.sector_id = new Integer(rs.getInt(1));
            if (rs.wasNull())
                obj.sector_id = null;
            obj.file = rs.getString(2);
            if (rs.wasNull())
                obj.file = null;
            obj.system = rs.getString(3);
            if (rs.wasNull())
                obj.system = null;
            obj.status = rs.getString(4);
            if (rs.wasNull())
                obj.status = null;
            obj.language_cd = rs.getString(5);
            if (rs.wasNull())
                obj.language_cd = null;
            obj.path = rs.getString(6);
            if (rs.wasNull())
                obj.path = null;
            obj.link = rs.getString(7);
            if (rs.wasNull())
                obj.link = null;
            obj.country_code = rs.getString(8);
            if (rs.wasNull())
                obj.country_code = null;
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
            wobj = new SectorFileObjectWrapper();
            wobj.obj = obj;
            if (cache.size() >= MAXSIZE)
                trimCache();
            cache.put(key, wobj);
        }
        return (obj);
    }

    public int putRecord(Integer sector_id, String file, String system, String status, String language_cd, String path, String link, String country_code, Integer modify_by, Date modify_date) throws SQLException {
        String identifier = getKey(sector_id);
        PreparedStatement ps = null;
        Connection conn = null;
        StringBuffer update = new StringBuffer();
        SectorFileObjectWrapper obj = null;
        int count = 0;

        obj = (SectorFileObjectWrapper) cache.get(getKey(sector_id));
        update.append("UPDATE SECTOR_FILE SET ");
        if (file != null) {
            if (obj != null)
                obj.obj.file = file;
            if (count > 0)
                update.append(", ");
            update.append("FILE = '" + file + "'");
            count++;
        }
        if (system != null) {
            if (obj != null)
                obj.obj.system = system;
            if (count > 0)
                update.append(", ");
            update.append("SYSTEM = '" + system + "'");
            count++;
        }
        if (status != null) {
            if (obj != null)
                obj.obj.status = status;
            if (count > 0)
                update.append(", ");
            update.append("STATUS = '" + status + "'");
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
        if (path != null) {
            if (obj != null)
                obj.obj.path = path;
            if (count > 0)
                update.append(", ");
            update.append("PATH = '" + path + "'");
            count++;
        }
        if (link != null) {
            if (obj != null)
                obj.obj.link = link;
            if (count > 0)
                update.append(", ");
            update.append("LINK = '" + link + "'");
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
        update.append(" WHERE SECTOR_ID = " + sector_id);
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
        String query = "SELECT SECTOR_ID FROM SECTOR_FILE";

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

    public String findByFile(String file) throws SQLException {
        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        Vector results = new Vector();
        String query = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            if (file.indexOf('%') >= 0)
                query = "SELECT SECTOR_ID FROM SECTOR_FILE WHERE FILE LIKE '" + file + "'";
            else
                query = "SELECT SECTOR_ID FROM SECTOR_FILE WHERE FILE = '" + file + "'";
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

    public String findByLink(String link) throws SQLException {
        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        Vector results = new Vector();
        String query = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            if (link.indexOf('%') >= 0)
                query = "SELECT SECTOR_ID FROM SECTOR_FILE WHERE LINK LIKE '" + link + "'";
            else
                query = "SELECT SECTOR_ID FROM SECTOR_FILE WHERE LINK = '" + link + "'";
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
        SectorFileObjectWrapper oldest = null;
        SectorFileObjectWrapper current = null;
        Enumeration e;

        e = cache.elements();
        while (e.hasMoreElements()) {
            current = (SectorFileObjectWrapper) e.nextElement();
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
