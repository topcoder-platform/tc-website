package com.topcoder.web.ejb.user;

import com.topcoder.shared.util.logging.Logger;

import javax.ejb.CreateException;
import javax.ejb.EJBException;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author Nathan Egge (negge@vt.edu)
 */
public class UserBean implements SessionBean {

    private final static String DATA_SOURCE = "java:comp/env/datasource_name";

    private final static Logger log = Logger.getLogger(UserBean.class);

    private transient InitialContext init_ctx = null;

    private SessionContext ctx;

    public void ejbActivate() {
        /* do nothing */
    }

    public void ejbPassivate() {
        /* do nothing */
    }

    public void ejbCreate() throws CreateException {
        try {
            init_ctx = new InitialContext();
        } catch (NamingException _ne) {
            _ne.printStackTrace();
        }
    }

    public void ejbRemove() {
        /* do nothing */
    }

    public void setSessionContext(SessionContext _ctx) {
        ctx = _ctx;
    }

    public void createUser(long _user_id, String _handle, char _status)
            throws EJBException, RemoteException {

        log.debug("createUser called. user_id=" + _user_id + " " +
                "handle=" + _handle + " " +
                "status=" + _status);

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String ds_name = (String) init_ctx.lookup(DATA_SOURCE);
            DataSource ds = (DataSource) init_ctx.lookup(ds_name);

            StringBuffer query = new StringBuffer(1024);
            query.append("INSERT ");
            query.append("INTO user (user_id,handle,status) ");
            query.append("VALUES (?,?,?)");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, _user_id);
            ps.setString(2, _handle);
            ps.setString(3, "" + _status);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows inserted into 'user'. " +
                        "Inserted " + rc + ", should have inserted 1."));
            }
        } catch (SQLException _sqle) {
            _sqle.printStackTrace();
            throw(new EJBException(_sqle.getMessage()));
        } catch (NamingException _ne) {
            _ne.printStackTrace();
            throw(new EJBException(_ne.getMessage()));
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception _e) {
                    log.debug("createUser error. Failed to close Connection");
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception _e) {
                    log.debug("createUser error. Failed to close PreparedStatement");
                }
            }
        }
    }

    public void setFirstName(long _user_id, String _first_name)
            throws EJBException, RemoteException {

        log.debug("setFirstName called. user_id=" + _user_id + " " +
                "first_name=" + _first_name);

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String ds_name = (String) init_ctx.lookup(DATA_SOURCE);
            DataSource ds = (DataSource) init_ctx.lookup(ds_name);

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE user ");
            query.append("SET first_name=? ");
            query.append("WHERE user_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setString(1, _first_name);
            ps.setLong(2, _user_id);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'user'. " +
                        "Updated " + rc + ", should have updated 1."));
            }
        } catch (SQLException _sqle) {
            _sqle.printStackTrace();
            throw(new EJBException(_sqle.getMessage()));
        } catch (NamingException _ne) {
            _ne.printStackTrace();
            throw(new EJBException(_ne.getMessage()));
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception _e) {
                    log.debug("setFirstName error. Failed to close Connection");
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception _e) {
                    log.debug("setFirstName error. Failed to close PreparedStatement");
                }
            }
        }
    }

    public void setLastName(long _user_id, String _last_name)
            throws EJBException, RemoteException {

        log.debug("setLastName called. user_id=" + _user_id + " " +
                "last_name=" + _last_name);

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String ds_name = (String) init_ctx.lookup(DATA_SOURCE);
            DataSource ds = (DataSource) init_ctx.lookup(ds_name);

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE user ");
            query.append("SET last_name=? ");
            query.append("WHERE user_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setString(1, _last_name);
            ps.setLong(2, _user_id);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'user'. " +
                        "Updated " + rc + ", should have updated 1."));
            }
        } catch (SQLException _sqle) {
            _sqle.printStackTrace();
            throw(new EJBException(_sqle.getMessage()));
        } catch (NamingException _ne) {
            _ne.printStackTrace();
            throw(new EJBException(_ne.getMessage()));
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception _e) {
                    log.debug("setLastName error. Failed to close Connection");
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception _e) {
                    log.debug("setLastName error. Failed to close PreparedStatement");
                }
            }
        }
    }

    public void setUserStatusId(long _user_id, long _user_status_id)
            throws EJBException, RemoteException {

        log.debug("setUserStatusId called. user_id=" + _user_id + " " +
                "user_status_id=" + _user_status_id);

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String ds_name = (String) init_ctx.lookup(DATA_SOURCE);
            DataSource ds = (DataSource) init_ctx.lookup(ds_name);

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE user ");
            query.append("SET user_status_id=? ");
            query.append("WHERE user_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, _user_status_id);
            ps.setLong(2, _user_id);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'user'. " +
                        "Updated " + rc + ", should have updated 1."));
            }
        } catch (SQLException _sqle) {
            _sqle.printStackTrace();
            throw(new EJBException(_sqle.getMessage()));
        } catch (NamingException _ne) {
            _ne.printStackTrace();
            throw(new EJBException(_ne.getMessage()));
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception _e) {
                    log.debug("setUserStatusId error. Failed to close Connection");
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception _e) {
                    log.debug("setUserStatusId error. Failed to close PreparedStatement");
                }
            }
        }
    }

    public String getFirstName(long _user_id)
            throws EJBException, RemoteException {

        log.debug("getFirstName called. user_id=" + _user_id);

        String first_name = null;

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String ds_name = (String) init_ctx.lookup(DATA_SOURCE);
            DataSource ds = (DataSource) init_ctx.lookup(ds_name);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT first_name ");
            query.append("FROM user ");
            query.append("WHERE user_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, _user_id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                first_name = rs.getString(1);
            } else {
                throw(new EJBException("No rows found when selecting from 'user' with " +
                        "user_id=" + _user_id + "."));
            }
        } catch (SQLException _sqle) {
            _sqle.printStackTrace();
            throw(new EJBException(_sqle.getMessage()));
        } catch (NamingException _ne) {
            _ne.printStackTrace();
            throw(new EJBException(_ne.getMessage()));
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception _e) {
                    log.debug("getFirstName error. Failed to close Connection");
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception _e) {
                    log.debug("getFirstName error. Failed to close PreparedStatement");
                }
            }
        }
        return (first_name);
    }

    public String getLastName(long _user_id)
            throws EJBException, RemoteException {

        log.debug("getLastName called. user_id=" + _user_id);

        String last_name = null;

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String ds_name = (String) init_ctx.lookup(DATA_SOURCE);
            DataSource ds = (DataSource) init_ctx.lookup(ds_name);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT last_name ");
            query.append("FROM user ");
            query.append("WHERE user_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, _user_id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                last_name = rs.getString(1);
            } else {
                throw(new EJBException("No rows found when selecting from 'user' with " +
                        "user_id=" + _user_id + "."));
            }
        } catch (SQLException _sqle) {
            _sqle.printStackTrace();
            throw(new EJBException(_sqle.getMessage()));
        } catch (NamingException _ne) {
            _ne.printStackTrace();
            throw(new EJBException(_ne.getMessage()));
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception _e) {
                    log.debug("getLastName error. Failed to close Connection");
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception _e) {
                    log.debug("getLastName error. Failed to close PreparedStatement");
                }
            }
        }
        return (last_name);
    }

    public long getUserStatusId(long _user_id)
            throws EJBException, RemoteException {

        log.debug("getUserStatusId called. user_id=" + _user_id);

        long user_status_id = 0;

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String ds_name = (String) init_ctx.lookup(DATA_SOURCE);
            DataSource ds = (DataSource) init_ctx.lookup(ds_name);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT user_status_id ");
            query.append("FROM user ");
            query.append("WHERE user_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, _user_id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user_status_id = rs.getLong(1);
            } else {
                throw(new EJBException("No rows found when selecting from 'user' with " +
                        "user_id=" + _user_id + "."));
            }
        } catch (SQLException _sqle) {
            _sqle.printStackTrace();
            throw(new EJBException(_sqle.getMessage()));
        } catch (NamingException _ne) {
            _ne.printStackTrace();
            throw(new EJBException(_ne.getMessage()));
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception _e) {
                    log.debug("getUserStatusId error. Failed to close Connection");
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception _e) {
                    log.debug("getUserStatusId error. Failed to close PreparedStatement");
                }
            }
        }
        return (user_status_id);
    }

    public boolean userExists(long userId) throws EJBException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;

        boolean userExists = false;

        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT 'X' ");
            query.append("FROM user ");
            query.append("WHERE user_id=?");

            String ds_name = (String) init_ctx.lookup(DATA_SOURCE);
            DataSource ds = (DataSource) init_ctx.lookup(ds_name);

            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);

            rs = ps.executeQuery();
            userExists =  rs.next();
        } catch (SQLException _sqle) {
            _sqle.printStackTrace();
            throw(new EJBException(_sqle.getMessage()));
        } catch (NamingException _ne) {
            _ne.printStackTrace();
            throw(new EJBException(_ne.getMessage()));
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet");
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement");
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection");
                }
            }
        }

        return userExists;
    }


}

;
