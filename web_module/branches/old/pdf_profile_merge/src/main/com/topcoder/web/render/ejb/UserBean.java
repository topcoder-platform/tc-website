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

public class UserBean implements javax.ejb.SessionBean {

    static Hashtable cache = new Hashtable();
    public SessionContext context = null;
    public static int MAXSIZE = -1;
    public static final DecimalFormat fmt0 = new DecimalFormat("0000000000");

    public String getKey(Integer user_id) {
        String key = "";

        key += fmt0.format(user_id);
        return (key);
    }

    public String getKey(UserObject obj) {
        return (getKey(obj.user_id));
    }

    public void create(Integer user_id, String handle, String password, String status, Integer user_type_id, String email, String logged_in, String terms, Date last_login, Integer path_id) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;

        String insert = "INSERT INTO USER VALUES (  " + user_id + ", '" + handle + "', '" + password + "', '" + status + "', " + user_type_id + ", '" + email + "', '" + logged_in + "', '" + terms + "', ? )";

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(insert);
            ps.setDate(1, last_login);
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

    public void delete(Integer user_id) throws SQLException {
        Connection conn = null;
        String delete = "DELETE FROM USER WHERE USER_ID = " + user_id;
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
        cache.remove(getKey(user_id));
        try {
            if (ps != null) ps.close();
        } catch (Exception f) {
        }
        try {
            if (conn != null) conn.close();
        } catch (Exception f) {
        }
    }

    public UserObject request(int cmd, UserObject obj) throws SQLException {

        switch (cmd) {

            case User.INSERT:
                create(obj.user_id, obj.handle, obj.password, obj.status, obj.user_type_id, obj.email, obj.logged_in, obj.terms, obj.last_login, obj.path_id);
                break;

            case User.SELECT:
                obj = getRecord(obj.user_id);
                if (obj == null)
                    throw new EJBException(
                            "no matching record");
                break;

            case User.UPDATE:
                putRecord(obj.user_id, obj.handle, obj.password, obj.status, obj.user_type_id, obj.email, obj.logged_in, obj.terms, obj.last_login, obj.path_id);
                break;

            case User.DELETE:
                delete(obj.user_id);
                break;

        }
        return (obj);
    }

    public void setHandle(Integer user_id, String handle) throws SQLException {
        putRecord(user_id, handle, null, null, null, null, null, null, null, null);
    }

    public String getHandle(Integer user_id) throws SQLException {
        UserObject obj = null;
        String result;

        obj = getRecord(user_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.handle);
    }

    public void setPassword(Integer user_id, String password) throws SQLException {
        putRecord(user_id, null, password, null, null, null, null, null, null, null);
    }

    public String getPassword(Integer user_id) throws SQLException {
        UserObject obj = null;
        String result;

        obj = getRecord(user_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.password);
    }

    public void setStatus(Integer user_id, String status) throws SQLException {
        putRecord(user_id, null, null, status, null, null, null, null, null, null);
    }

    public String getStatus(Integer user_id) throws SQLException {
        UserObject obj = null;
        String result;

        obj = getRecord(user_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.status);
    }

    public void setUserTypeId(Integer user_id, Integer user_type_id) throws SQLException {
        putRecord(user_id, null, null, null, user_type_id, null, null, null, null, null);
    }

    public Integer getUserTypeId(Integer user_id) throws SQLException {
        UserObject obj = null;
        Integer result;

        obj = getRecord(user_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.user_type_id);
    }

    public void setEmail(Integer user_id, String email) throws SQLException {
        putRecord(user_id, null, null, null, null, email, null, null, null, null);
    }

    public String getEmail(Integer user_id) throws SQLException {
        UserObject obj = null;
        String result;

        obj = getRecord(user_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.email);
    }

    public void setLoggedIn(Integer user_id, String logged_in) throws SQLException {
        putRecord(user_id, null, null, null, null, null, logged_in, null, null, null);
    }

    public String getLoggedIn(Integer user_id) throws SQLException {
        UserObject obj = null;
        String result;

        obj = getRecord(user_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.logged_in);
    }

    public void setTerms(Integer user_id, String terms) throws SQLException {
        putRecord(user_id, null, null, null, null, null, null, terms, null, null);
    }

    public String getTerms(Integer user_id) throws SQLException {
        UserObject obj = null;
        String result;

        obj = getRecord(user_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.terms);
    }

    public void setLastLogin(Integer user_id, Date last_login) throws SQLException {
        putRecord(user_id, null, null, null, null, null, null, null, last_login, null);
    }

    public Date getLastLogin(Integer user_id) throws SQLException {
        UserObject obj = null;
        Date result;

        obj = getRecord(user_id);
        if (obj == null)
            throw new EJBException("record not found");
        return (obj.last_login);
    }

    public void setPathId(Integer user_id, Integer path_id) throws SQLException {
        //putRecord( user_id, null, null, null, null, null, null, null, null, path_id );
    }

    public Integer getPathId(Integer user_id) throws SQLException {
/*
		UserObject	obj = null;
		Integer	result;

		obj = getRecord( user_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.path_id );
*/
        return new Integer(0);
    }

    private class UserObjectWrapper {
        UserObject obj;
        Date lastUsed;

        UserObjectWrapper() {
            lastUsed = new Date(System.currentTimeMillis());
        }
    }

    private class RecordNotFoundException extends Exception {
    }

    private UserObject getRecord(Integer user_id) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String key = getKey(user_id);
        UserObject obj = null;
        UserObjectWrapper wobj = (UserObjectWrapper) cache.get(key);
        if (wobj != null) {
            wobj.lastUsed = new Date(System.currentTimeMillis());
            return (wobj.obj);
        }
        obj = new UserObject();
        StringBuffer query = new StringBuffer(200);
        query.append(" SELECT");
        query.append(" user_id");
        query.append(" ,handle");
        query.append(" ,password");
        query.append(" ,status");
        query.append(" ,user_type_id");
        query.append(" ,email");
        query.append(" ,logged_in");
        query.append(" ,terms");
        query.append(" ,last_login");
        //query.append (   " ,path_id" );
        query.append(" FROM");
        query.append(" user");
        query.append(" WHERE");
        query.append(" user_id = ");
        query.append(user_id);

        InputStream is = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            if (!rs.next())
                throw new RecordNotFoundException();
            obj.user_id = new Integer(rs.getInt(1));
            if (rs.wasNull())
                obj.user_id = null;
            obj.handle = rs.getString(2);
            if (rs.wasNull())
                obj.handle = null;
            obj.password = rs.getString(3);
            if (rs.wasNull())
                obj.password = null;
            obj.status = rs.getString(4);
            if (rs.wasNull())
                obj.status = null;
            obj.user_type_id = new Integer(rs.getInt(5));
            if (rs.wasNull())
                obj.user_type_id = null;
            obj.email = rs.getString(6);
            if (rs.wasNull())
                obj.email = null;
            obj.logged_in = rs.getString(7);
            if (rs.wasNull())
                obj.logged_in = null;
            obj.terms = rs.getString(8);
            if (rs.wasNull())
                obj.terms = null;
            obj.last_login = rs.getDate(9);
            if (rs.wasNull())
                obj.last_login = null;
            //obj.path_id = new Integer( rs.getInt( 10 ) );
            //if( rs.wasNull() )
            //obj.path_id = null;
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
            wobj = new UserObjectWrapper();
            wobj.obj = obj;
            if (cache.size() >= MAXSIZE)
                trimCache();
            cache.put(key, wobj);
        }
        return (obj);
    }

    public int putRecord(Integer user_id, String handle, String password, String status, Integer user_type_id, String email, String logged_in, String terms, Date last_login, Integer path_id) throws SQLException {
        String identifier = getKey(user_id);
        PreparedStatement ps = null;
        Connection conn = null;
        StringBuffer update = new StringBuffer();
        UserObjectWrapper obj = null;
        int count = 0;

        obj = (UserObjectWrapper) cache.get(getKey(user_id));
        update.append("UPDATE USER SET ");
        if (handle != null) {
            if (obj != null)
                obj.obj.handle = handle;
            if (count > 0)
                update.append(", ");
            update.append("HANDLE = '" + handle + "'");
            count++;
        }
        if (password != null) {
            if (obj != null)
                obj.obj.password = password;
            if (count > 0)
                update.append(", ");
            update.append("PASSWORD = '" + password + "'");
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
        if (user_type_id != null) {
            if (obj != null)
                obj.obj.user_type_id = user_type_id;
            if (count > 0)
                update.append(", ");
            update.append("USER_TYPE_ID = " + user_type_id.intValue());
            count++;
        }
        if (email != null) {
            if (obj != null)
                obj.obj.email = email;
            if (count > 0)
                update.append(", ");
            update.append("EMAIL = '" + email + "'");
            count++;
        }
        if (logged_in != null) {
            if (obj != null)
                obj.obj.logged_in = logged_in;
            if (count > 0)
                update.append(", ");
            update.append("LOGGED_IN = '" + logged_in + "'");
            count++;
        }
        if (terms != null) {
            if (obj != null)
                obj.obj.terms = terms;
            if (count > 0)
                update.append(", ");
            update.append("TERMS = '" + terms + "'");
            count++;
        }
        if (last_login != null) {
            if (obj != null)
                obj.obj.last_login = last_login;
            if (count > 0)
                update.append(", ");
            update.append("LAST_LOGIN = '" + last_login + "'");
            count++;
        }
/*
		if( path_id != null ) {
			if( obj != null )
				obj.obj.path_id = path_id;
			if( count > 0 )
				update.append( ", " );
			update.append( "PATH_ID = " + path_id.intValue() );
			count++;
		}
*/
        update.append(" WHERE USER_ID = " + user_id);
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

    public String findByHandle(String handle) throws SQLException {
        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        Vector results = new Vector();
        String query = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            if (handle.indexOf('%') >= 0)
                query = "SELECT USER_ID FROM USER WHERE HANDLE LIKE '" + handle + "'";
            else
                query = "SELECT USER_ID FROM USER WHERE HANDLE = '" + handle + "'";
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

    public String findByPassword(String password) throws SQLException {
        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        Vector results = new Vector();
        String query = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            if (password.indexOf('%') >= 0)
                query = "SELECT USER_ID FROM USER WHERE PASSWORD LIKE '" + password + "'";
            else
                query = "SELECT USER_ID FROM USER WHERE PASSWORD = '" + password + "'";
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

    public String findByStatus(String status) throws SQLException {
        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        Vector results = new Vector();
        String query = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            if (status.indexOf('%') >= 0)
                query = "SELECT USER_ID FROM USER WHERE STATUS LIKE '" + status + "'";
            else
                query = "SELECT USER_ID FROM USER WHERE STATUS = '" + status + "'";
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

    public String findByLoggedIn(String logged_in) throws SQLException {
        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        Vector results = new Vector();
        String query = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            if (logged_in.indexOf('%') >= 0)
                query = "SELECT USER_ID FROM USER WHERE LOGGED_IN LIKE '" + logged_in + "'";
            else
                query = "SELECT USER_ID FROM USER WHERE LOGGED_IN = '" + logged_in + "'";
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

    public String findByTerms(String terms) throws SQLException {
        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        Vector results = new Vector();
        String query = null;

        try {
            conn = com.topcoder.shared.util.DBMS.getConnection();
            if (terms.indexOf('%') >= 0)
                query = "SELECT USER_ID FROM USER WHERE TERMS LIKE '" + terms + "'";
            else
                query = "SELECT USER_ID FROM USER WHERE TERMS = '" + terms + "'";
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
        UserObjectWrapper oldest = null;
        UserObjectWrapper current = null;
        Enumeration e;

        e = cache.elements();
        while (e.hasMoreElements()) {
            current = (UserObjectWrapper) e.nextElement();
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
