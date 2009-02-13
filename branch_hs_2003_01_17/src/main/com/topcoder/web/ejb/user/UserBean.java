package com.topcoder.web.ejb.user;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.*;
import com.topcoder.util.idgenerator.*;
import com.topcoder.util.idgenerator.sql.InformixDB;

import java.rmi.RemoteException;
import java.sql.*;
import javax.ejb.*;
import javax.naming.*;
import javax.sql.*;

/**
 * @author Nathan Egge (negge@vt.edu)
 */
public class UserBean implements SessionBean {

    private final static String DATA_SOURCE = "java:comp/env/datasource_name";

    private final static String JTS_DATA_SOURCE = "java:comp/env/jts_datasource_name";

    private final static Logger log = Logger.getLogger(UserBean.class);

    private transient InitialContext initCtx = null;

    private SessionContext ctx;

    public void ejbActivate() {
        /* do nothing */
    }

    public void ejbPassivate() {
        /* do nothing */
    }

    public void ejbCreate() throws CreateException {
        try {
            initCtx = new InitialContext();
        }
        catch (NamingException ne) {
            ne.printStackTrace();
        }
    }

    public void ejbRemove() {
        /* do nothing */
    }

    public void setSessionContext(SessionContext ctx) {
        this.ctx = ctx;
    }

    public void createUser(long userId, String handle, char status)
            throws EJBException, RemoteException {

        log.debug("createUser called. user_id=" + userId + " " +
                  "handle=" + handle + " " +
                  "status=" + status);

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String dsName = (String) initCtx.lookup(JTS_DATA_SOURCE);
            DataSource ds = (DataSource) initCtx.lookup(dsName);

            StringBuffer query = new StringBuffer(1024);
            query.append("INSERT ");
            query.append("INTO user (user_id,handle,status) ");
            query.append("VALUES (?,?,?)");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, userId);
            ps.setString(2, handle);
            ps.setString(3, "" + status);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows inserted into 'user'. " +
                                       "Inserted " + rc + ", should have inserted 1."));
            }
        }
        catch (SQLException sqle) {
            sqle.printStackTrace();
            throw(new EJBException(sqle.getMessage()));
        }
        catch (NamingException ne) {
            ne.printStackTrace();
            throw(new EJBException(ne.getMessage()));
        }
        finally {
            if (con != null) {
                try {
                    con.close();
                }
                catch (Exception _e) {
                    log.debug("createUser error. Failed to close Connection");
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                }
                catch (Exception e) {
                    log.debug("createUser error. Failed to close PreparedStatement");
                }
            }
        }
    }

    public void setFirstName(long userId, String firstName)
            throws EJBException, RemoteException {

        log.debug("setFirstName called. user_id=" + userId + " " +
                  "first_name=" + firstName);

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String dsName = (String) initCtx.lookup(JTS_DATA_SOURCE);
            DataSource ds = (DataSource) initCtx.lookup(dsName);

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE user ");
            query.append("SET first_name=? ");
            query.append("WHERE user_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setString(1, firstName);
            ps.setLong(2, userId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'user'. " +
                                       "Updated " + rc + ", should have updated 1."));
            }
        }
        catch (SQLException sqle) {
            sqle.printStackTrace();
            throw(new EJBException(sqle.getMessage()));
        }
        catch (NamingException ne) {
            ne.printStackTrace();
            throw(new EJBException(ne.getMessage()));
        }
        finally {
            if (con != null) {
                try {
                    con.close();
                }
                catch (Exception e) {
                    log.debug("setFirstName error. Failed to close Connection");
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                }
                catch (Exception e) {
                    log.debug("setFirstName error. Failed to close PreparedStatement");
                }
            }
        }
    }

    public void setLastName(long userId, String lastName)
            throws EJBException, RemoteException {

        log.debug("setLastName called. user_id=" + userId + " " +
                  "last_name=" + lastName);

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String dsName = (String) initCtx.lookup(JTS_DATA_SOURCE);
            DataSource ds = (DataSource) initCtx.lookup(dsName);

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE user ");
            query.append("SET last_name=? ");
            query.append("WHERE user_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setString(1, lastName);
            ps.setLong(2, userId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'user'. " +
                                       "Updated " + rc + ", should have updated 1."));
            }
        }
        catch (SQLException sqle) {
            sqle.printStackTrace();
            throw(new EJBException(sqle.getMessage()));
        }
        catch (NamingException ne) {
            ne.printStackTrace();
            throw(new EJBException(ne.getMessage()));
        }
        finally {
            if (con != null) {
                try {
                    con.close();
                }
                catch (Exception e) {
                    log.debug("setLastName error. Failed to close Connection");
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                }
                catch (Exception e) {
                    log.debug("setLastName error. Failed to close PreparedStatement");
                }
            }
        }
    }

    public void setUserStatusId(long userId, long userStatusId)
            throws EJBException, RemoteException {

        log.debug("setUserStatusId called. user_id=" + userId + " " +
                  "user_status_id=" + userStatusId);

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String dsName = (String) initCtx.lookup(JTS_DATA_SOURCE);
            DataSource ds = (DataSource) initCtx.lookup(dsName);

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE user ");
            query.append("SET user_status_id=? ");
            query.append("WHERE user_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, userStatusId);
            ps.setLong(2, userId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'user'. " +
                                       "Updated " + rc + ", should have updated 1."));
            }
        }
        catch (SQLException sqle) {
            sqle.printStackTrace();
            throw(new EJBException(sqle.getMessage()));
        }
        catch (NamingException ne) {
            ne.printStackTrace();
            throw(new EJBException(ne.getMessage()));
        }
        finally {
            if (con != null) {
                try {
                    con.close();
                }
                catch (Exception e) {
                    log.debug("setUserStatusId error. Failed to close Connection");
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                }
                catch (Exception e) {
                    log.debug("setUserStatusId error. Failed to close PreparedStatement");
                }
            }
        }
    }

    public String getFirstName(long userId)
            throws EJBException, RemoteException {

        log.debug("getFirstName called. user_id=" + userId);

        String firstName = null;

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String dsName = (String) initCtx.lookup(JTS_DATA_SOURCE);
            DataSource ds = (DataSource) initCtx.lookup(dsName);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT first_name ");
            query.append("FROM user ");
            query.append("WHERE user_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, userId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                firstName = rs.getString(1);
            }
            else {
                throw(new EJBException("No rows found when selecting from 'user' with " +
                                       "user_id=" + userId + "."));
            }
        }
        catch (SQLException sqle) {
            sqle.printStackTrace();
            throw(new EJBException(sqle.getMessage()));
        }
        catch (NamingException ne) {
            ne.printStackTrace();
            throw(new EJBException(ne.getMessage()));
        }
        finally {
            if (con != null) {
                try {
                    con.close();
                }
                catch (Exception e) {
                    log.debug("getFirstName error. Failed to close Connection");
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                }
                catch (Exception e) {
                    log.debug("getFirstName error. Failed to close PreparedStatement");
                }
            }
        }
        return (firstName);
    }

    public String getLastName(long userId)
            throws EJBException, RemoteException {

        log.debug("getLastName called. user_id=" + userId);

        String lastName = null;

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String dsName = (String) initCtx.lookup(JTS_DATA_SOURCE);
            DataSource ds = (DataSource) initCtx.lookup(dsName);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT last_name ");
            query.append("FROM user ");
            query.append("WHERE user_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, userId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                lastName = rs.getString(1);
            }
            else {
                throw(new EJBException("No rows found when selecting from 'user' with " +
                                       "user_id=" + userId + "."));
            }
        }
        catch (SQLException sqle) {
            sqle.printStackTrace();
            throw(new EJBException(sqle.getMessage()));
        }
        catch (NamingException ne) {
            ne.printStackTrace();
            throw(new EJBException(ne.getMessage()));
        }
        finally {
            if (con != null) {
                try {
                    con.close();
                }
                catch (Exception e) {
                    log.debug("getLastName error. Failed to close Connection");
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                }
                catch (Exception e) {
                    log.debug("getLastName error. Failed to close PreparedStatement");
                }
            }
        }
        return (lastName);
    }

    public long getUserStatusId(long userId)
            throws EJBException, RemoteException {

        log.debug("getUserStatusId called. user_id=" + userId);

        long userStatusId = 0;

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String dsName = (String) initCtx.lookup(JTS_DATA_SOURCE);
            DataSource ds = (DataSource) initCtx.lookup(dsName);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT user_status_id ");
            query.append("FROM user ");
            query.append("WHERE user_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, userId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                userStatusId = rs.getLong(1);
            }
            else {
                throw(new EJBException("No rows found when selecting from 'user' with " +
                                       "user_id=" + userId + "."));
            }
        }
        catch (SQLException sqle) {
            sqle.printStackTrace();
            throw(new EJBException(sqle.getMessage()));
        }
        catch (NamingException ne) {
            ne.printStackTrace();
            throw(new EJBException(ne.getMessage()));
        }
        finally {
            if (con != null) {
                try {
                    con.close();
                }
                catch (Exception e) {
                    log.debug("getUserStatusId error. Failed to close Connection");
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                }
                catch (Exception e) {
                    log.debug("getUserStatusId error. Failed to close PreparedStatement");
                }
            }
        }
        return (userStatusId);
    }

};
