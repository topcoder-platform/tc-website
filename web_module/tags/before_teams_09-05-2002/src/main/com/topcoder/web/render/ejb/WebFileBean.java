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

public class WebFileBean implements javax.ejb.SessionBean {

    static Hashtable cache = new Hashtable();
    public SessionContext context = null;
    public static int MAXSIZE = -1;
    public static final DecimalFormat fmt0 = new DecimalFormat("0000000000");

    public String getKey(Integer file_id) {
        String key = "";

        key += fmt0.format(file_id);
        return (key);
    }

    public String getKey(WebFileObject obj) {
        return (getKey(obj.file_id));
    }

    public void create(Integer file_id, String file_desc, Integer image_height, Integer image_width, Integer modify_by, Date modify_date) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;

        String insert = "INSERT INTO WEB_FILE VALUES (  " + file_id + ", '" + file_desc + "', " + image_height + ", " + image_width + ", " + modify_by + ", ? )";

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

    public void delete(Integer file_id) throws SQLException {
        Connection conn = null;
        String delete = "DELETE FROM WEB_FILE WHERE FILE_ID = " + file_id;
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
        cache.remove(getKey(file_id));
        try {
            if (ps != null) ps.close();
        } catch (Exception f) {
        }
        try {
            if (conn != null) conn.close();
        } catch (Exception f) {
        }
    }

    public WebFileObject request(int cmd, WebFileObject obj) throws SQLException {

        switch (cmd) {

            case WebFile.INSERT:
                create(obj.file_id, obj.file_desc, obj.image_height, obj.image_width, obj.modify_by, obj.modify_date);
                break;

            case WebFile.SELECT:
                obj = getRecord(obj.file_id);
                if (obj == null)
                    throw new EJBException(
                            "no matching record");
                break;

            case WebFile.UPDATE:
                putRecord(obj.file_id, obj.file_desc, obj.image_height, obj.image_width, obj.modify_by, obj.modify_date);
                break;

            case WebFile.DELETE:
                delete(obj.file_id);
                break;

        }
        return (obj);
    }

    public void setFileDesc(Integer file_id, String file_desc) throws SQLException {
        putRecord(file_id, file_desc, null, null, null, null);
    }

    public String getFileDesc(Integer file_id) throws SQLException {
        WebFileObject obj = null;
        String result;

        obj = getRecord(file_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.file_desc);
    }

    public void setImageHeight(Integer file_id, Integer image_height) throws SQLException {
        putRecord(file_id, null, image_height, null, null, null);
    }

    public Integer getImageHeight(Integer file_id) throws SQLException {
        WebFileObject obj = null;
        Integer result;

        obj = getRecord(file_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.image_height);
    }

    public void setImageWidth(Integer file_id, Integer image_width) throws SQLException {
        putRecord(file_id, null, null, image_width, null, null);
    }

    public Integer getImageWidth(Integer file_id) throws SQLException {
        WebFileObject obj = null;
        Integer result;

        obj = getRecord(file_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.image_width);
    }

    public void setModifyBy(Integer file_id, Integer modify_by) throws SQLException {
        putRecord(file_id, null, null, null, modify_by, null);
    }

    public Integer getModifyBy(Integer file_id) throws SQLException {
        WebFileObject obj = null;
        Integer result;

        obj = getRecord(file_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.modify_by);
    }

    public void setModifyDate(Integer file_id, Date modify_date) throws SQLException {
        putRecord(file_id, null, null, null, null, modify_date);
    }

    public Date getModifyDate(Integer file_id) throws SQLException {
        WebFileObject obj = null;
        Date result;

        obj = getRecord(file_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.modify_date);
    }

    private class WebFileObjectWrapper {
        WebFileObject obj;
        Date lastUsed;

        WebFileObjectWrapper() {
            lastUsed = new Date(System.currentTimeMillis());
        }
    }

    private class RecordNotFoundException extends Exception {
    }

    private WebFileObject getRecord(Integer file_id) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String key = getKey(file_id);
        WebFileObject obj = null;
        WebFileObjectWrapper wobj = (WebFileObjectWrapper) cache.get(key);
        if (wobj != null) {
            wobj.lastUsed = new Date(System.currentTimeMillis());
            return (wobj.obj);
        }
        obj = new WebFileObject();
        String query = "SELECT * FROM WEB_FILE WHERE FILE_ID = " + file_id;
        InputStream is = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (!rs.next())
                throw new RecordNotFoundException();
            obj.file_id = new Integer(rs.getInt(1));
            if (rs.wasNull())
                obj.file_id = null;
            obj.file_desc = rs.getString(2);
            if (rs.wasNull())
                obj.file_desc = null;
            obj.image_height = new Integer(rs.getInt(3));
            if (rs.wasNull())
                obj.image_height = null;
            obj.image_width = new Integer(rs.getInt(4));
            if (rs.wasNull())
                obj.image_width = null;
            obj.modify_by = new Integer(rs.getInt(5));
            if (rs.wasNull())
                obj.modify_by = null;
            obj.modify_date = rs.getDate(6);
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
            wobj = new WebFileObjectWrapper();
            wobj.obj = obj;
            if (cache.size() >= MAXSIZE)
                trimCache();
            cache.put(key, wobj);
        }
        return (obj);
    }

    public int putRecord(Integer file_id, String file_desc, Integer image_height, Integer image_width, Integer modify_by, Date modify_date) throws SQLException {
        String identifier = getKey(file_id);
        PreparedStatement ps = null;
        Connection conn = null;
        StringBuffer update = new StringBuffer();
        WebFileObjectWrapper obj = null;
        int count = 0;

        obj = (WebFileObjectWrapper) cache.get(getKey(file_id));
        update.append("UPDATE WEB_FILE SET ");
        if (file_desc != null) {
            if (obj != null)
                obj.obj.file_desc = file_desc;
            if (count > 0)
                update.append(", ");
            update.append("FILE_DESC = '" + file_desc + "'");
            count++;
        }
        if (image_height != null) {
            if (obj != null)
                obj.obj.image_height = image_height;
            if (count > 0)
                update.append(", ");
            update.append("IMAGE_HEIGHT = " + image_height.intValue());
            count++;
        }
        if (image_width != null) {
            if (obj != null)
                obj.obj.image_width = image_width;
            if (count > 0)
                update.append(", ");
            update.append("IMAGE_WIDTH = " + image_width.intValue());
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
        update.append(" WHERE FILE_ID = " + file_id);
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
        WebFileObjectWrapper oldest = null;
        WebFileObjectWrapper current = null;
        Enumeration e;

        e = cache.elements();
        while (e.hasMoreElements()) {
            current = (WebFileObjectWrapper) e.nextElement();
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
