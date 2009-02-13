package com.topcoder.web.ejb.user;

import com.topcoder.shared.util.logging.Logger;

import java.sql.*;
import javax.ejb.*;
import javax.naming.*;
import javax.sql.*;

public class UserBean implements SessionBean {

    private static Logger log = Logger.getLogger(UserBean.class);
    private transient InitialContext init_ctx = null;
    private DataSource ds = null;
    private DataSource transDs = null;
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
            ds = (DataSource) init_ctx.lookup("java:comp/env/datasource");
            transDs = (DataSource) init_ctx.lookup("java:comp/env/jts_datasource");
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

    public void createUser(long userId, String handle, char status) throws EJBException {
        PreparedStatement ps = null;
        Connection conn = null;
        try {

            StringBuffer query=new StringBuffer(1024);
            query.append("INSERT ");
            query.append("INTO user (user_id,handle,status) ");
            query.append("VALUES (?,?,?)");

            conn=transDs.getConnection();
            ps=conn.prepareStatement(query.toString());
            ps.setLong(1,userId);
            ps.setString(2,handle);
            ps.setString(3,""+status);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows inserted into 'user'. " +
                        "Inserted " + rc + ", should have inserted 1."));
            }
        } catch (SQLException _sqle) {
            _sqle.printStackTrace();
            throw(new EJBException(_sqle.getMessage()));
        } finally {
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
    }

    public void setFirstName(long _user_id, String _first_name)
            throws EJBException {
        PreparedStatement ps = null;
        Connection conn = null;
        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE user ");
            query.append("SET first_name=? ");
            query.append("WHERE user_id=?");

            conn = transDs.getConnection();
            ps = conn.prepareStatement(query.toString());
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
        } finally {
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
    }

    public void setLastName(long _user_id, String _last_name)
            throws EJBException {
        PreparedStatement ps = null;
        Connection conn = null;
        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE user ");
            query.append("SET last_name=? ");
            query.append("WHERE user_id=?");

            conn = transDs.getConnection();
            ps = conn.prepareStatement(query.toString());
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
        } finally {
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
    }

    public void setUserStatusId(long _user_id, long _user_status_id)
            throws EJBException {
        PreparedStatement ps = null;
        Connection conn = null;
        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE user ");
            query.append("SET user_status_id=? ");
            query.append("WHERE user_id=?");

            conn = transDs.getConnection();
            ps = conn.prepareStatement(query.toString());
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
        } finally {
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
    }

    public String getFirstName(long _user_id) throws EJBException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;

        String first_name = null;

        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT first_name ");
            query.append("FROM user ");
            query.append("WHERE user_id=?");

            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, _user_id);

            rs = ps.executeQuery();
            if (rs.next()) {
                first_name = rs.getString(1);
            } else {
                throw(new EJBException("No rows found when selecting from 'user' " +
                        "with user_id=" + _user_id + "."));
            }
        } catch (SQLException _sqle) {
            _sqle.printStackTrace();
            throw(new EJBException(_sqle.getMessage()));
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
        return first_name;
    }

    public String getLastName(long _user_id) throws EJBException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;

        String last_name = null;

        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT last_name ");
            query.append("FROM user ");
            query.append("WHERE user_id=?");

            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, _user_id);

            rs = ps.executeQuery();
            if (rs.next()) {
                last_name = rs.getString(1);
            } else {
                throw(new EJBException("No rows found when selecting from 'user' " +
                        "with user_id=" + _user_id + "."));
            }
        } catch (SQLException _sqle) {
            _sqle.printStackTrace();
            throw(new EJBException(_sqle.getMessage()));
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
        return last_name;
    }

    public long getUserStatusId(long _user_id) throws EJBException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;

        long user_status_id = 0;

        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT user_status_id ");
            query.append("FROM user ");
            query.append("WHERE user_id=?");

            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, _user_id);

            rs = ps.executeQuery();
            if (rs.next()) {
                user_status_id = rs.getLong(1);
            } else {
                throw(new EJBException("No rows found when selecting from 'user' " +
                        "with user_id=" + _user_id + "."));
            }
        } catch (SQLException _sqle) {
            _sqle.printStackTrace();
            throw(new EJBException(_sqle.getMessage()));
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
        return user_status_id;
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

            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);

            rs = ps.executeQuery();
            userExists =  rs.next();
        } catch (SQLException _sqle) {
            throw(new EJBException(_sqle.getMessage()));
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
};
