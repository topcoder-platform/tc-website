package com.topcoder.web.ejb.user;

import com.topcoder.shared.util.logging.Logger;
//import com.topcoder.util.idgenerator.IdGenerator;
import com.topcoder.util.idgenerator.*; // for SimpleDB() ?
import com.topcoder.shared.util.DBMS;

import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.ejb.EJBException;
import javax.naming.NamingException;
import java.rmi.RemoteException;
import java.sql.SQLException;

/**
*
* @author   George Nassar
* @version  $Revision$
*
*/

public class UserBean implements SessionBean {

    private SessionContext ctx;
    private static Logger log = Logger.getLogger(UserBean.class);
    private static final String dataSourceName = "CORP_OLTP";
    private static final String idGenDataSourceName = "SCREENING_OLTP";

    //required ejb methods

    public void ejbActivate() {
    }

    public void ejbPassivate() {
    }

    public void ejbCreate() {

      //InitContext = new InitialContext(); // from BaseEJB
    }

    public void ejbRemove() {
    }

    public void setSessionContext(SessionContext ctx) {

        this.ctx = ctx;
    }

    //business methods

    public long createUser() {

        log.debug("createUser called...");

        Context ctx = null;
        PreparedStatement ps = null; // could just use Statement
        Connection conn = null;
        DataSource ds = null;
        long ret = 0;

        try {
            ctx = new InitialContext();
            if (!IdGenerator.isInitialized()) {
                IdGenerator.init(new SimpleDB(), (DataSource)ctx.lookup(idGenDataSourceName), "sequence_object", "name", "current_value", 9999999999L, 1, true);
            }
            ret = IdGenerator.nextId("USER_SEQ");

            StringBuffer query = new StringBuffer();
            query.append("INSERT INTO user (user_id, create_date, modify_date) VALUES ('");
            query.append(Long.toString(ret));  // the reason we can just use Statement :-)
            query.append("','now','now')");

            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in insert: " + rows);

            return(ret);

        } catch (SQLException sqe) {
            printSqlException(true, sqe);
            throw new EJBException("SQLException creating user");
        } catch (NamingException e) {
            throw new EJBException("NamingException creating user");
        } catch (Exception e) {
            throw new EJBException("Exception creating user:\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in createUser");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in createUser");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in createUser");}}
        }
    }

    public void setFirstName(long userId, String firstName) {

        log.debug("setFirstName called...user_id: " + userId + " first_name: " + firstName);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;
        long ret = 0;

        try {
            StringBuffer query = new StringBuffer();
            query.append("UPDATE user SET first_name = '" + firstName + "', modify_date = 'now' WHERE user_id = ");
            query.append(Long.toString(userId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in update: " + rows + " for user_id: " + userId + " first_name: " + firstName);

        } catch (SQLException sqe) {
            printSqlException(true, sqe);
            throw new EJBException("SQLException updating user_id: " + userId + " first_name: " + firstName);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating user first name");
        } catch (Exception e) {
            throw new EJBException("Exception updating user_id: " + userId + " first_name: " + firstName + "\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setFirstName");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setFirstName");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setFirstName");}}
        }
    }

    public void setLastName(long userId, String lastName) {

        log.debug("setLastName called...user_id: " + userId + " last_name: " + lastName);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;
        long ret = 0;

        try {
            StringBuffer query = new StringBuffer();
            query.append("UPDATE user SET last_name = '" + lastName + "', modify_date = 'now' WHERE user_id = ");
            query.append(Long.toString(userId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in update: " + rows + " for user_id: " + userId + " last_name: " + lastName);

        } catch (SQLException sqe) {
            printSqlException(true, sqe);
            throw new EJBException("SQLException updating user_id: " + userId + " last_name: " + lastName);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating user last name");
        } catch (Exception e) {
            throw new EJBException("Exception updating user_id: " + userId + " last_name: " + lastName + "\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setLastName");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setLastName");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setLastName");}}
        }
    }

    public void setUserStatusId(long userId, long userStatusId) {

        log.debug("setUserStatusId called...user_id: " + userId + " user_status_id: " + userStatusId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;
        long ret = 0;

        try {
            StringBuffer query = new StringBuffer();
            query.append("UPDATE user SET user_status_id = " + userStatusId + ", modify_date = 'now' WHERE user_id = ");
            query.append(Long.toString(userId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in update: " + rows + " for user_id: " + userId + " user_status_id: " + userStatusId);

        } catch (SQLException sqe) {
            printSqlException(true, sqe);
            throw new EJBException("SQLException updating user_id: " + userId + " user_status_id: " + userStatusId);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating user status ID");
        } catch (Exception e) {
            throw new EJBException("Exception updating user_id: " + userId + " user_status_id: " + userStatusId + "\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setUserStatusId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setUserStatusId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setUserStatusId");}}
        }
    }

    public String getFirstName(long userId) {

        log.debug("getFirstName called...user_id: " + userId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        String ret = null;

        try {
            StringBuffer query = new StringBuffer();
            query.append("SELECT first_name FROM user WHERE user_id = ");
            query.append(Long.toString(userId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            if (rs.next()) ret = rs.getString("first_name");

        } catch (SQLException sqe) {
            printSqlException(true, sqe);
            throw new EJBException("SQLException getting first_name for user_id: " + userId);
        } catch (NamingException e) {
            throw new EJBException("NamingException getting user first name");
        } catch (Exception e) {
            throw new EJBException("Exception getting first_name for user_id: " + userId + "\n" + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getFirstName");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getFirstName");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getFirstName");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getFirstName");}}
        }
    }

    public String getLastName(long userId) {

        log.debug("getLastName called...user_id: " + userId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        String ret = null;

        try {
            StringBuffer query = new StringBuffer();
            query.append("SELECT last_name FROM user WHERE user_id = ");
            query.append(Long.toString(userId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            if (rs.next()) ret = rs.getString("last_name");

        } catch (SQLException sqe) {
            printSqlException(true, sqe);
            throw new EJBException("SQLException getting last_name for user_id: " + userId);
        } catch (NamingException e) {
            throw new EJBException("NamingException getting user last name");
        } catch (Exception e) {
            throw new EJBException("Exception getting last_name for user_id: " + userId + "\n" + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getLastName");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getLastName");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getLastName");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getLastName");}}
        }
    }

    public long getUserStatusId(long userId) {

        log.debug("getUserStatusId called...user_id: " + userId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        String ret = null;

        try {
            StringBuffer query = new StringBuffer();
            query.append("SELECT user_status_id FROM user WHERE user_id = ");
            query.append(Long.toString(userId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            if (rs.next()) ret = rs.getString("user_status_id");

        } catch (SQLException sqe) {
            printSqlException(true, sqe);
            throw new EJBException("SQLException getting user_status_id for user_id: " + userId);
        } catch (NamingException e) {
            throw new EJBException("NamingException getting user status ID");
        } catch (Exception e) {
            throw new EJBException("Exception getting user_status_id for user_id: " + userId + "\n" + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getUserStatusId");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getUserStatusId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getUserStatusId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getUserStatusId");}}
        }
    }
}