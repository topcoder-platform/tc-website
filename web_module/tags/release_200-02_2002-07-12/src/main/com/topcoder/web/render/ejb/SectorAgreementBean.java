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

public class SectorAgreementBean implements javax.ejb.SessionBean {

    static Hashtable cache = new Hashtable();
    public SessionContext context = null;
    public static int MAXSIZE = -1;
    public static final DecimalFormat fmt0 = new DecimalFormat("0000000000");

    public String getKey(Integer sector_id) {
        String key = "";

        key += fmt0.format(sector_id);
        return (key);
    }

    public String getKey(SectorAgreementObject obj) {
        return (getKey(obj.sector_id));
    }

    public void create(Integer sector_id, Integer user_id, Date agree_date) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;

        String insert = "INSERT INTO SECTOR_AGREEMENT VALUES (  " + sector_id + ", " + user_id + ", ? )";

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(insert);
            ps.setDate(1, agree_date);
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
        String delete = "DELETE FROM SECTOR_AGREEMENT WHERE SECTOR_ID = " + sector_id;
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

    public SectorAgreementObject request(int cmd, SectorAgreementObject obj) throws SQLException {

        switch (cmd) {

            case SectorAgreement.INSERT:
                create(obj.sector_id, obj.user_id, obj.agree_date);
                break;

            case SectorAgreement.SELECT:
                obj = getRecord(obj.sector_id);
                if (obj == null)
                    throw new EJBException(
                            "no matching record");
                break;

            case SectorAgreement.UPDATE:
                putRecord(obj.sector_id, obj.user_id, obj.agree_date);
                break;

            case SectorAgreement.DELETE:
                delete(obj.sector_id);
                break;

        }
        return (obj);
    }

    public void setUserId(Integer sector_id, Integer user_id) throws SQLException {
        putRecord(sector_id, user_id, null);
    }

    public Integer getUserId(Integer sector_id) throws SQLException {
        SectorAgreementObject obj = null;
        Integer result;

        obj = getRecord(sector_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.user_id);
    }

    public void setAgreeDate(Integer sector_id, Date agree_date) throws SQLException {
        putRecord(sector_id, null, agree_date);
    }

    public Date getAgreeDate(Integer sector_id) throws SQLException {
        SectorAgreementObject obj = null;
        Date result;

        obj = getRecord(sector_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.agree_date);
    }

    private class SectorAgreementObjectWrapper {
        SectorAgreementObject obj;
        Date lastUsed;

        SectorAgreementObjectWrapper() {
            lastUsed = new Date(System.currentTimeMillis());
        }
    }

    private class RecordNotFoundException extends Exception {
    }

    private SectorAgreementObject getRecord(Integer sector_id) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String key = getKey(sector_id);
        SectorAgreementObject obj = null;
        SectorAgreementObjectWrapper wobj = (SectorAgreementObjectWrapper) cache.get(key);
        if (wobj != null) {
            wobj.lastUsed = new Date(System.currentTimeMillis());
            return (wobj.obj);
        }
        obj = new SectorAgreementObject();
        String query = "SELECT * FROM SECTOR_AGREEMENT WHERE SECTOR_ID = " + sector_id;
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
            obj.user_id = new Integer(rs.getInt(2));
            if (rs.wasNull())
                obj.user_id = null;
            obj.agree_date = rs.getDate(3);
            if (rs.wasNull())
                obj.agree_date = null;
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
            wobj = new SectorAgreementObjectWrapper();
            wobj.obj = obj;
            if (cache.size() >= MAXSIZE)
                trimCache();
            cache.put(key, wobj);
        }
        return (obj);
    }

    public int putRecord(Integer sector_id, Integer user_id, Date agree_date) throws SQLException {
        String identifier = getKey(sector_id);
        PreparedStatement ps = null;
        Connection conn = null;
        StringBuffer update = new StringBuffer();
        SectorAgreementObjectWrapper obj = null;
        int count = 0;

        obj = (SectorAgreementObjectWrapper) cache.get(getKey(sector_id));
        update.append("UPDATE SECTOR_AGREEMENT SET ");
        if (user_id != null) {
            if (obj != null)
                obj.obj.user_id = user_id;
            if (count > 0)
                update.append(", ");
            update.append("USER_ID = " + user_id.intValue());
            count++;
        }
        if (agree_date != null) {
            if (obj != null)
                obj.obj.agree_date = agree_date;
            if (count > 0)
                update.append(", ");
            update.append("AGREE_DATE = '" + agree_date + "'");
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
        String query = "SELECT SECTOR_ID FROM SECTOR_AGREEMENT";

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

    public String findByUserId(Integer user_id) throws SQLException {
        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        Vector results = new Vector();
        String query = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            query = "SELECT SECTOR_ID FROM SECTOR_AGREEMENT WHERE USER_ID = " + user_id;
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
        SectorAgreementObjectWrapper oldest = null;
        SectorAgreementObjectWrapper current = null;
        Enumeration e;

        e = cache.elements();
        while (e.hasMoreElements()) {
            current = (SectorAgreementObjectWrapper) e.nextElement();
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
