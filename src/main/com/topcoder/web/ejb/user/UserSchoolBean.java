package com.topcoder.web.ejb.user;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;

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
public class UserSchoolBean implements SessionBean {

    private final static String DATA_SOURCE = "java:comp/env/datasource_name";

    private final static Logger log = Logger.getLogger(UserSchoolBean.class);

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

    public void createUserSchool(long userId, long schoolId)
            throws EJBException, RemoteException {

        log.debug("createUserSchool called. user_id=" + userId + " " +
                "school_id=" + schoolId);

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String ds_name = (String) init_ctx.lookup(DATA_SOURCE);
            DataSource ds = (DataSource) init_ctx.lookup(ds_name);

            StringBuffer query = new StringBuffer(1024);
            query.append("INSERT ");
            query.append("INTO user_school_xref (user_id,school_id) ");
            query.append("VALUES (?,?)");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, userId);
            ps.setLong(2, schoolId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows inserted into " +
                        "'user_school_xref'. Inserted " + rc + ", " +
                        "should have inserted 1."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true,_sqle);
            throw(new EJBException(_sqle.getMessage()));
        } catch (NamingException _ne) {
            _ne.printStackTrace();
            throw(new EJBException(_ne.getMessage()));
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception _e) {
                    log.error("createUserSchool error. " +
                            "Failed to close PreparedStatement");
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (Exception _e) {
                    log.error("createUserSchool error. " +
                            "Failed to close Connection");
                }
            }
        }
    }

    public void removeUserSchool(long userId, long schoolId)
            throws EJBException, RemoteException {

        log.debug("removeUserSchool called. user_id=" + userId + " " +
                "school_id=" + schoolId);

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String ds_name = (String) init_ctx.lookup(DATA_SOURCE);
            DataSource ds = (DataSource) init_ctx.lookup(ds_name);

            StringBuffer query = new StringBuffer(1024);
            query.append("DELETE ");
            query.append("FROM user_school_xref ");
            query.append("WHERE user_id=? AND school_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, userId);
            ps.setLong(2, schoolId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows deleted from " +
                        "'user_school_xref'. Deleted " + rc + ", should " +
                        "have deleted 1."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true,_sqle);
            throw(new EJBException(_sqle.getMessage()));
        } catch (NamingException _ne) {
            _ne.printStackTrace();
            throw(new EJBException(_ne.getMessage()));
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception _e) {
                    log.error("removeUserSchool error. " +
                            "Failed to close PreparedStatement");
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (Exception _e) {
                    log.error("removeUserSchool error. " +
                            "Failed to close Connection");
                }
            }
        }
    }

    public void setCurrentUserSchoolId(long userId, long schoolId)
            throws EJBException, RemoteException {

        log.debug("setCurrentUserSchoolId called. user_id=" + userId + " " +
                "school_id=" + schoolId);

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String ds_name = (String) init_ctx.lookup(DATA_SOURCE);
            DataSource ds = (DataSource) init_ctx.lookup(ds_name);

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE user_school_xref ");
            query.append("SET current_ind=0 ");
            query.append("WHERE user_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, userId);

            int rc = ps.executeUpdate();
            if (rc < 1) {
                throw(new EJBException("Wrong number of rows updated in " +
                        "'user_school_xref'. Updated " + rc + ", should " +
                        "have updated at least 1."));
            }

            query = new StringBuffer(1024);
            query.append("UPDATE user_school_xref ");
            query.append("SET current_ind=1 ");
            query.append("WHERE user_id=? AND school_id=?");

            ps = con.prepareStatement(query.toString());
            ps.setLong(1, userId);
            ps.setLong(2, schoolId);

            rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in " +
                        "'user_school_xref'. Updated " + rc + ", should " +
                        "have updated 1."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true,_sqle);
            throw(new EJBException(_sqle.getMessage()));
        } catch (NamingException _ne) {
            _ne.printStackTrace();
            throw(new EJBException(_ne.getMessage()));
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception _e) {
                    log.error("setCurrentUserSchoolId error. " +
                            "Failed to close PreparedStatement");
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (Exception _e) {
                    log.error("setCurrentUserSchoolId error. " +
                            "Failed to close Connection");
                }
            }
        }
    }

    public long getCurrentUserSchoolId(long userId)
            throws EJBException, RemoteException {

        log.debug("getCurrentUserSchoolId called. user_id=" + userId);

        long school_id = 0;

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            String ds_name = (String) init_ctx.lookup(DATA_SOURCE);
            DataSource ds = (DataSource) init_ctx.lookup(ds_name);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT school_id ");
            query.append("FROM user_school_xref ");
            query.append("WHERE user_id=? AND current_ind=1");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, userId);

            rs = ps.executeQuery();
            if (rs.next()) {
                school_id = rs.getLong(1);
            } else {
                throw(new EJBException("No rows found when selecting from " +
                        "'user_school_xref' with user_id=" + userId +
                        " AND current_ind=1."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true,_sqle);
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
                } catch (Exception _e) {
                    log.error("getCurrentUserSchoolId error. " +
                            "Failed to close PreparedStatement");
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (Exception _e) {
                    log.error("getCurrentUserSchoolId error. " +
                            "Failed to close Connection");
                }
            }
        }
        return (school_id);
    }

    public boolean isCurrentUserSchoolId(long userId, long schoolId)
            throws EJBException, RemoteException {

        log.debug("isCurrentUserSchoolId called. user_id=" + userId + " " +
                "school_id=" + schoolId);

        boolean current = false;

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {

            String ds_name = (String) init_ctx.lookup(DATA_SOURCE);
            DataSource ds = (DataSource) init_ctx.lookup(ds_name);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT current_ind ");
            query.append("FROM user_school_xref ");
            query.append("WHERE user_id=? AND school_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, userId);
            ps.setLong(2, schoolId);

            rs = ps.executeQuery();
            if (rs.next()) {
                current = rs.getBoolean(1);
            } else {
                throw(new EJBException("No rows found when selecting from " +
                        "'user_school_xref' with user_id=" + userId +
                        " AND school_id=" + schoolId + "."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true,_sqle);
            throw(new EJBException(_sqle.getMessage()));
        } catch (NamingException _ne) {
            _ne.printStackTrace();
            throw(new EJBException(_ne.getMessage()));
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception _e) {
                    log.error("isCurrentUserSchoolId error. " +
                            "Failed to close PreparedStatement");
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (Exception _e) {
                    log.error("isCurrentUserSchoolId error. " +
                            "Failed to close Connection");
                }
            }
        }
        return (current);
    }

    public boolean exists(long userId, long schoolId)
            throws EJBException, RemoteException {

        log.debug("exists called. user_id=" + userId + " " +
                "school_id=" + schoolId);

        boolean exists = true;

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {

            String ds_name = (String) init_ctx.lookup(DATA_SOURCE);
            DataSource ds = (DataSource) init_ctx.lookup(ds_name);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT current_ind ");
            query.append("FROM user_school_xref ");
            query.append("WHERE user_id=? AND school_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, userId);
            ps.setLong(2, schoolId);

            rs = ps.executeQuery();
            if (!rs.next()) {
                exists = false;
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true,_sqle);
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
                } catch (Exception _e) {
                    log.error("exists error. " +
                            "Failed to close PreparedStatement");
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (Exception _e) {
                    log.error("exists error. " +
                            "Failed to close Connection");
                }
            }
        }
        return (exists);
    }

}

;
