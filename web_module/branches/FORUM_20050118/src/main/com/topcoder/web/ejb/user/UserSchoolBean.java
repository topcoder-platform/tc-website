package com.topcoder.web.ejb.user;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author Nathan Egge (negge@vt.edu)
 */
public class UserSchoolBean extends BaseEJB {

    private final static Logger log = Logger.getLogger(UserSchoolBean.class);

    public void createUserSchool(long userId, long schoolId, String dataSource)
            throws EJBException {

        log.debug("createUserSchool called. user_id=" + userId + " " +
                "school_id=" + schoolId);

        Connection conn = null;
        PreparedStatement ps = null;
        InitialContext ctx = null;
        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("INSERT ");
            query.append("INTO user_school_xref (user_id,school_id) ");
            query.append("VALUES (?,?)");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);
            ps.setLong(2, schoolId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows inserted into " +
                        "'user_school_xref'. Inserted " + rc + ", " +
                        "should have inserted 1."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public void removeUserSchool(long userId, long schoolId, String dataSource)
            throws EJBException {

        log.debug("removeUserSchool called. user_id=" + userId + " " +
                "school_id=" + schoolId);

        Connection conn = null;
        PreparedStatement ps = null;

        InitialContext ctx = null;
        try {


            StringBuffer query = new StringBuffer(1024);
            query.append("DELETE ");
            query.append("FROM user_school_xref ");
            query.append("WHERE user_id=? AND school_id=?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);
            ps.setLong(2, schoolId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows deleted from " +
                        "'user_school_xref'. Deleted " + rc + ", should " +
                        "have deleted 1."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public void setCurrentUserSchoolId(long userId, long schoolId, String dataSource)
            throws EJBException {

        log.debug("setCurrentUserSchoolId called. user_id=" + userId + " " +
                "school_id=" + schoolId);

        Connection conn = null;
        PreparedStatement ps = null;

        InitialContext ctx = null;
        try {


            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE user_school_xref ");
            query.append("SET current_ind=0 ");
            query.append("WHERE user_id=?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
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

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);
            ps.setLong(2, schoolId);

            rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in " +
                        "'user_school_xref'. Updated " + rc + ", should " +
                        "have updated 1."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public long getCurrentUserSchoolId(long userId, String dataSource)
            throws EJBException {

        log.debug("getCurrentUserSchoolId called. user_id=" + userId);

        long school_id = 0;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        InitialContext ctx = null;
        try {


            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT school_id ");
            query.append("FROM user_school_xref ");
            query.append("WHERE user_id=? AND current_ind=1");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
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
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return (school_id);
    }

    public boolean isCurrentUserSchoolId(long userId, long schoolId, String dataSource)
            throws EJBException {

        log.debug("isCurrentUserSchoolId called. user_id=" + userId + " " +
                "school_id=" + schoolId);

        boolean current = false;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        InitialContext ctx = null;
        try {


            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT current_ind ");
            query.append("FROM user_school_xref ");
            query.append("WHERE user_id=? AND school_id=?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
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
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return (current);
    }

    public boolean exists(long userId, long schoolId, String dataSource)
            throws EJBException {

        log.debug("exists called. user_id=" + userId + " " +
                "school_id=" + schoolId);

        boolean exists = true;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        InitialContext ctx = null;
        try {


            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT current_ind ");
            query.append("FROM user_school_xref ");
            query.append("WHERE user_id=? AND school_id=?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);
            ps.setLong(2, schoolId);

            rs = ps.executeQuery();
            if (!rs.next()) {
                exists = false;
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return (exists);
    }

}
