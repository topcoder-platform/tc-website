package com.topcoder.web.ejb.user;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.*;

import java.rmi.RemoteException;
import java.sql.*;
import javax.ejb.*;
import javax.naming.*;
import javax.sql.*;

/**
 * @author Nathan Egge (negge@vt.edu)
 */
public class UserSchoolBean implements SessionBean {

    private final static String DATA_SOURCE = "java:comp/env/datasource_name";

    private final static String JTS_DATA_SOURCE = "java:comp/env/jts_datasource_name";

    private final static Logger log = Logger.getLogger(UserSchoolBean.class);

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

    public void createUserSchool(long userId, long schoolId)
            throws EJBException, RemoteException {

        log.debug("createUserSchool called. user_id=" + userId + " " +
                  "school_id=" + schoolId);

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String dsName = (String) initCtx.lookup(JTS_DATA_SOURCE);
            DataSource ds = (DataSource) initCtx.lookup(dsName);

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
                    log.error("createUserSchool error. " +
                              "Failed to close Connection");
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                }
                catch (Exception e) {
                    log.error("createUserSchool error. " +
                              "Failed to close PreparedStatement");
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

            String dsName = (String) initCtx.lookup(JTS_DATA_SOURCE);
            DataSource ds = (DataSource) initCtx.lookup(dsName);

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
                    log.error("removeUserSchool error. " +
                              "Failed to close Connection");
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                }
                catch (Exception e) {
                    log.error("removeUserSchool error. " +
                              "Failed to close PreparedStatement");
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

            String dsName = (String) initCtx.lookup(JTS_DATA_SOURCE);
            DataSource ds = (DataSource) initCtx.lookup(dsName);

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
                    log.error("setCurrentUserSchoolId error. " +
                              "Failed to close Connection");
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                }
                catch (Exception e) {
                    log.error("setCurrentUserSchoolId error. " +
                              "Failed to close PreparedStatement");
                }
            }
        }
    }

    public long getCurrentUserSchoolId(long userId)
            throws EJBException, RemoteException {

        log.debug("getCurrentUserSchoolId called. user_id=" + userId);

        long schoolId = 0;

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String dsName = (String) initCtx.lookup(JTS_DATA_SOURCE);
            DataSource ds = (DataSource) initCtx.lookup(dsName);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT school_id ");
            query.append("FROM user_school_xref ");
            query.append("WHERE user_id=? AND current_ind=1");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, userId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                schoolId = rs.getLong(1);
            }
            else {
                throw(new EJBException("No rows found when selecting from " +
                                       "'user_school_xref' with user_id=" + userId +
                                       " AND current_ind=1."));
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
                    log.error("getCurrentUserSchoolId error. " +
                              "Failed to close Connection");
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                }
                catch (Exception e) {
                    log.error("getCurrentUserSchoolId error. " +
                              "Failed to close PreparedStatement");
                }
            }
        }
        return (schoolId);
    }

    public boolean isCurrentUserSchoolId(long userId, long schoolId)
            throws EJBException, RemoteException {

        log.debug("isCurrentUserSchoolId called. user_id=" + userId + " " +
                  "school_id=" + schoolId);

        boolean current = false;

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String dsName = (String) initCtx.lookup(JTS_DATA_SOURCE);
            DataSource ds = (DataSource) initCtx.lookup(dsName);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT current_ind ");
            query.append("FROM user_school_xref ");
            query.append("WHERE user_id=? AND school_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, userId);
            ps.setLong(2, schoolId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                current = rs.getBoolean(1);
            }
            else {
                throw(new EJBException("No rows found when selecting from " +
                                       "'user_school_xref' with user_id=" + userId +
                                       " AND school_id=" + schoolId + "."));
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
                    log.error("isCurrentUserSchoolId error. " +
                              "Failed to close Connection");
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                }
                catch (Exception e) {
                    log.error("isCurrentUserSchoolId error. " +
                              "Failed to close PreparedStatement");
                }
            }
        }
        return (current);
    }

    public boolean existsUserSchoolId(long userId, long schoolId)
            throws EJBException, RemoteException {

        log.debug("existsUserSchoolId called. user_id=" + userId + " " +
                  "school_id=" + schoolId);

        boolean exists = true;

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String dsName = (String) initCtx.lookup(JTS_DATA_SOURCE);
            DataSource ds = (DataSource) initCtx.lookup(dsName);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT current_ind ");
            query.append("FROM user_school_xref ");
            query.append("WHERE user_id=? AND school_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, userId);
            ps.setLong(2, schoolId);

            ResultSet rs = ps.executeQuery();
            if (!rs.next()) {
                exists = false;
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
                    log.error("existsUserSchoolId error. " +
                              "Failed to close Connection");
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                }
                catch (Exception e) {
                    log.error("existsUserSchoolId error. " +
                              "Failed to close PreparedStatement");
                }
            }
        }
        return (exists);
    }

}

;
