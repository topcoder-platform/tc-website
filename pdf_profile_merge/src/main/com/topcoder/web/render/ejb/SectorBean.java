package com.topcoder.web.render.ejb;

import com.topcoder.shared.util.DBMS;

import javax.ejb.EJBException;
import javax.ejb.SessionContext;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.sql.*;
import java.text.DecimalFormat;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Vector;

public class SectorBean implements javax.ejb.SessionBean {

    static Hashtable cache = new Hashtable();
    public SessionContext context = null;
    public static int MAXSIZE = -1;
    public static final DecimalFormat fmt0 = new DecimalFormat("0000000000");

    public String getKey(Integer sector_id) {
        String key = "";

        key += fmt0.format(sector_id);
        return (key);
    }

    public String getKey(SectorObject obj) {
        return (getKey(obj.sector_id));
    }

    public void create(Integer sector_id, String sector_desc) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;

        String insert = "INSERT INTO SECTOR VALUES (  " + sector_id + ", '" + sector_desc + "' )";

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

    public Integer create(String sector_desc) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        int keyValue = 0;

        String insert = "INSERT INTO SECTOR VALUES ( ?, '" + sector_desc + "' )";

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(insert);
            keyValue = DBMS.getSeqId(conn, DBMS.SECTOR_SEQ);
            ps.setInt(1, keyValue);
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
        return (new Integer(keyValue));
    }

    public void delete(Integer sector_id) throws SQLException {
        Connection conn = null;
        String delete = "DELETE FROM SECTOR WHERE SECTOR_ID = " + sector_id;
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

    public SectorObject request(int cmd, SectorObject obj) throws SQLException {

        switch (cmd) {

            case Sector.INSERT:
                if (obj.sector_id == null)
                    obj.sector_id = create(obj.sector_desc);
                else
                    create(obj.sector_id, obj.sector_desc);
                break;

            case Sector.SELECT:
                obj = getRecord(obj.sector_id);
                if (obj == null)
                    throw new EJBException(
                            "no matching record");
                break;

            case Sector.UPDATE:
                putRecord(obj.sector_id, obj.sector_desc);
                break;

            case Sector.DELETE:
                delete(obj.sector_id);
                break;

        }
        return (obj);
    }

    public void setSectorDesc(Integer sector_id, String sector_desc) throws SQLException {
        putRecord(sector_id, sector_desc);
    }

    public String getSectorDesc(Integer sector_id) throws SQLException {
        SectorObject obj = null;
        String result;

        obj = getRecord(sector_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.sector_desc);
    }

    private class SectorObjectWrapper {
        SectorObject obj;
        Date lastUsed;

        SectorObjectWrapper() {
            lastUsed = new Date(System.currentTimeMillis());
        }
    }

    private class RecordNotFoundException extends Exception {
    }


    private SectorObject getRecord(Integer sector_id) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        SectorObject obj = null;
        try {
            String key = getKey(sector_id);
            SectorObjectWrapper wobj = (SectorObjectWrapper) cache.get(key);
            if (wobj != null) {
                wobj.lastUsed = new Date(System.currentTimeMillis());
                return (wobj.obj);
            }
            obj = new SectorObject();
            String query = "SELECT * FROM SECTOR WHERE SECTOR_ID = " + sector_id;
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (!rs.next()) throw new RecordNotFoundException();
            obj.sector_id = new Integer(rs.getInt(1));
            if (rs.wasNull()) obj.sector_id = null;
            obj.sector_desc = rs.getString(2);
            if (rs.wasNull()) obj.sector_desc = null;
            if (MAXSIZE < 0) MAXSIZE = getMaxCacheSize();
            if (MAXSIZE > 0) {
                wobj = new SectorObjectWrapper();
                wobj.obj = obj;
                if (cache.size() >= MAXSIZE) trimCache();
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


    public int putRecord(Integer sector_id, String sector_desc) throws SQLException {
        String identifier = getKey(sector_id);
        PreparedStatement ps = null;
        Connection conn = null;
        StringBuffer update = new StringBuffer();
        SectorObjectWrapper obj = null;
        int count = 0;

        obj = (SectorObjectWrapper) cache.get(getKey(sector_id));
        update.append("UPDATE SECTOR SET ");
        if (sector_desc != null) {
            if (obj != null)
                obj.obj.sector_desc = sector_desc;
            if (count > 0)
                update.append(", ");
            update.append("SECTOR_DESC = '" + sector_desc + "'");
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

    public String findBySectorDesc(String sector_desc) throws SQLException {
        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        Vector results = new Vector();
        String query = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            if (sector_desc.indexOf('%') >= 0)
                query = "SELECT SECTOR_ID FROM SECTOR WHERE SECTOR_DESC LIKE '" + sector_desc + "'";
            else
                query = "SELECT SECTOR_ID FROM SECTOR WHERE SECTOR_DESC = '" + sector_desc + "'";
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
        SectorObjectWrapper oldest = null;
        SectorObjectWrapper current = null;
        Enumeration e;

        e = cache.elements();
        while (e.hasMoreElements()) {
            current = (SectorObjectWrapper) e.nextElement();
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
