package com.topcoder.web.ejb.user;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.web.ejb.idgeneratorclient.IdGeneratorClient;

import javax.ejb.EJBException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author Nathan Egge (negge@vt.edu)
 */
public class UserBean extends BaseEJB {

    private final static Logger log = Logger.getLogger(UserBean.class);

    public long createNewUser(String handle, char status, String dataSource) throws EJBException {
        long ret = 0;
        try {
            ret = IdGeneratorClient.getSeqId("main_sequence");
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw new EJBException(e);
        } catch (NamingException e) {
            throw new EJBException(e);
        }
        createUser(ret, handle, status, dataSource);
        return ret;
    }

    public void createUser(long userId, String handle, char status, String dataSource)
            throws EJBException {

        log.debug("createUser called. user_id=" + userId + " " +
                "handle=" + handle + " " +
                "status=" + status);

        Connection conn = null;
        PreparedStatement ps = null;
        InitialContext ctx = null;

        try {

            conn = DBMS.getConnection(dataSource);

            StringBuffer query = new StringBuffer(1024);
            query.append("INSERT ");
            query.append("INTO user (user_id,handle,status) ");
            query.append("VALUES (?,?,?)");

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);
            ps.setString(2, handle);
            ps.setString(3, "" + status);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows inserted into 'user'. " +
                        "Inserted " + rc + ", should have inserted 1."));
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw(new EJBException(sqle.getMessage()));
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public void setFirstName(long userId, String firstName, String dataSource)
            throws EJBException {

        log.debug("setFirstName called. user_id=" + userId + " " +
                "first_name=" + firstName);

        Connection conn = null;
        PreparedStatement ps = null;

        InitialContext ctx = null;

        try {

            conn = DBMS.getConnection(dataSource);

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE user ");
            query.append("SET first_name=? ");
            query.append("WHERE user_id=?");

            ps = conn.prepareStatement(query.toString());
            ps.setString(1, firstName);
            ps.setLong(2, userId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'user'. " +
                        "Updated " + rc + ", should have updated 1."));
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

    public void setLastName(long userId, String lastName, String dataSource)
            throws EJBException {

        log.debug("setLastName called. user_id=" + userId + " " +
                "last_name=" + lastName);

        Connection conn = null;
        PreparedStatement ps = null;

        InitialContext ctx = null;

        try {

            conn = DBMS.getConnection(dataSource);

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE user ");
            query.append("SET last_name=? ");
            query.append("WHERE user_id=?");

            ps = conn.prepareStatement(query.toString());
            ps.setString(1, lastName);
            ps.setLong(2, userId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'user'. " +
                        "Updated " + rc + ", should have updated 1."));
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


    public void setMiddleName(long userId, String middleName, String dataSource)
            throws EJBException {

        log.debug("setMiddleName called. user_id=" + userId + " " +
                "middle_name=" + middleName);

        Connection conn = null;
        PreparedStatement ps = null;

        InitialContext ctx = null;

        try {

            conn = DBMS.getConnection(dataSource);

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE user ");
            query.append("SET middle_name=? ");
            query.append("WHERE user_id=?");

            ps = conn.prepareStatement(query.toString());
            ps.setString(1, middleName);
            ps.setLong(2, userId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'user'. " +
                        "Updated " + rc + ", should have updated 1."));
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


    public void setActivationCode(long userId, String code, String dataSource)
            throws EJBException {

        log.debug("setActivationCode called. user_id=" + userId + " " +
                "code=" + code + " db=" + dataSource);

        Connection conn = null;
        PreparedStatement ps = null;

        InitialContext ctx = null;

        try {

            conn = DBMS.getConnection(dataSource);

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE user ");
            query.append("SET activation_code=? ");
            query.append("WHERE user_id=?");

            ps = conn.prepareStatement(query.toString());
            ps.setString(1, code);
            ps.setLong(2, userId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'user'. " +
                        "Updated " + rc + ", should have updated 1."));
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


    public void setStatus(long userId, char status, String dataSource)
            throws EJBException {

        log.debug("setStatus called. user_id=" + userId + " " +
                "status=" + status);

        Connection conn = null;
        PreparedStatement ps = null;

        InitialContext ctx = null;

        try {

            conn = DBMS.getConnection(dataSource);

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE user ");
            query.append("SET status=? ");
            query.append("WHERE user_id=?");

            ps = conn.prepareStatement(query.toString());
            ps.setString(1, String.valueOf(status));
            ps.setLong(2, userId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'user'. " +
                        "Updated " + rc + ", should have updated 1."));
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

    public String getFirstName(long userId, String dataSource)
            throws EJBException {

        log.debug("getFirstName called. user_id=" + userId);

        String first_name = null;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        InitialContext ctx = null;

        try {

            conn = DBMS.getConnection(dataSource);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT first_name ");
            query.append("FROM user ");
            query.append("WHERE user_id=?");

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);

            rs = ps.executeQuery();
            if (rs.next()) {
                first_name = rs.getString(1);
            } else {
                throw(new EJBException("No rows found when selecting from 'user' with " +
                        "user_id=" + userId + "."));
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
        return (first_name);
    }

    public String getMiddleName(long userId, String dataSource)
            throws EJBException {

        log.debug("getMiddleName called. user_id=" + userId);

        String middleName = null;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        InitialContext ctx = null;

        try {

            conn = DBMS.getConnection(dataSource);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT middle_name ");
            query.append("FROM user ");
            query.append("WHERE user_id=?");

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);

            rs = ps.executeQuery();
            if (rs.next()) {
                middleName = rs.getString(1);
            } else {
                throw(new EJBException("No rows found when selecting from 'user' with " +
                        "user_id=" + userId + "."));
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
        return (middleName);
    }


    public String getLastName(long userId, String dataSource)
            throws EJBException {

        log.debug("getLastName called. user_id=" + userId);

        String last_name = null;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        InitialContext ctx = null;

        try {

            conn = DBMS.getConnection(dataSource);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT last_name ");
            query.append("FROM user ");
            query.append("WHERE user_id=?");

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);

            rs = ps.executeQuery();
            if (rs.next()) {
                last_name = rs.getString(1);
            } else {
                throw(new EJBException("No rows found when selecting from 'user' with " +
                        "user_id=" + userId + "."));
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
        return (last_name);
    }


    public String getActivationCode(long userId, String dataSource)
            throws EJBException {

        log.debug("getActivationCode called. user_id=" + userId + " db=" + dataSource);

        String code = null;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        InitialContext ctx = null;

        try {

            conn = DBMS.getConnection(dataSource);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT activation_code ");
            query.append("FROM user ");
            query.append("WHERE user_id=?");

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);

            rs = ps.executeQuery();
            if (rs.next()) {
                code = rs.getString(1);
            } else {
                throw(new EJBException("No rows found when selecting from 'user' with " +
                        "user_id=" + userId + "."));
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
        return (code);
    }

    public void setHandle(long userId, String handle, String dataSource)
            throws EJBException {
        log.debug("setHandle called. user_id=" + userId);

        Connection conn = null;
        PreparedStatement ps = null;
        InitialContext ctx = null;

        try {

            conn = DBMS.getConnection(dataSource);

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE user ");
            query.append("SET handle = ? ");
            query.append("WHERE user_id=?");

            ps = conn.prepareStatement(query.toString());
            ps.setString(1, handle);
            ps.setLong(2, userId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'user'. " +
                        "Updated " + rc + ", should have updated 1."));
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

    public String getHandle(long userId, String dataSource)
            throws EJBException {
        log.debug("getHandle called. user_id=" + userId);

        String handle = "";

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        InitialContext ctx = null;

        try {

            conn = DBMS.getConnection(dataSource);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT handle ");
            query.append("FROM user ");
            query.append("WHERE user_id=?");

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);

            rs = ps.executeQuery();
            if (rs.next()) {
                handle = rs.getString(1);
            } else {
                throw(new EJBException("No rows found when selecting from 'user' with " +
                        "user_id=" + userId + "."));
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
        return (handle);
    }


    public char getStatus(long userId, String dataSource)
            throws EJBException {

        log.debug("getStatus called. user_id=" + userId);

        char status = 0;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        InitialContext ctx = null;

        try {

            conn = DBMS.getConnection(dataSource);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT status ");
            query.append("FROM user ");
            query.append("WHERE user_id=?");

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);

            rs = ps.executeQuery();
            if (rs.next()) {
                status = rs.getString(1).charAt(0);
            } else {
                throw(new EJBException("No rows found when selecting from 'user' with " +
                        "user_id=" + userId + "."));
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
        return (status);
    }

    public boolean userExists(long userId, String dataSource) throws EJBException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;

        boolean userExists = false;

        InitialContext ctx = null;

        try {

            conn = DBMS.getConnection(dataSource);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT 'X' ");
            query.append("FROM user ");
            query.append("WHERE user_id=?");

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);

            rs = ps.executeQuery();
            userExists = rs.next();
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return userExists;
    }

    public boolean userExists(String handle, String dataSource) throws EJBException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;

        boolean userExists = false;

        InitialContext ctx = null;

        try {

            conn = DBMS.getConnection(dataSource);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT 'X' ");
            query.append("FROM user ");
            query.append("WHERE handle_lower = lower(?)");

            ps = conn.prepareStatement(query.toString());
            ps.setString(1, handle);

            rs = ps.executeQuery();
            userExists = rs.next();
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return userExists;
    }

    public void setPassword(long userId, String password, String dataSource) throws EJBException {
        int ret = update("user",
                new String[]{"password"},
                new String[]{password},
                new String[]{"user_id"},
                new String[]{String.valueOf(userId)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows updated in " +
                    "'user'. Updated " + ret + ", " +
                    "should have updated 1."));
        }


    }

    public String getPassword(long userId, String dataSource) throws EJBException {
        return selectString("user",
                "password",
                new String[]{"user_id"},
                new String[]{String.valueOf(userId)},
                dataSource);
    }


}

