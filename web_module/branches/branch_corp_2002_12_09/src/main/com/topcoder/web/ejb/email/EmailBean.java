package com.topcoder.web.ejb.email;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.idgenerator.IdGenerator;
import com.topcoder.util.idgenerator.sql.SimpleDB;
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

public class EmailBean implements SessionBean {

    private SessionContext ctx;
    private static Logger log = Logger.getLogger(EmailBean.class);
    private static final String dataSourceName = "CORP_OLTP";
    private static final String idGenDataSourceName = "CORP_OLTP";

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

    public long createEmail(long userId) {

        log.debug("createEmail called...");

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
            ret = IdGenerator.nextId("EMAIL_SEQ");

            StringBuffer query = new StringBuffer(100);
            query.append("INSERT INTO email (user_id, email_id, create_date, modify_date) VALUES (");
            query.append(Long.toString(userId) + "," + Long.toString(ret));
            query.append(",'now','now')");

            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in insert: " + rows);

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException creating email");
        } catch (NamingException e) {
            throw new EJBException("NamingException creating email");
        } catch (Exception e) {
            throw new EJBException("Exception creating email:\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in createEmail");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in createEmail");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in createEmail");}}
        }
        return(ret);
    }

    public long getEmailTypeId(long userId, long emailId) {

        log.debug("getEmailTypeId called...user_id: " + userId + " email_id: " + emailId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        long ret = 0;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("SELECT email_type_id FROM email WHERE user_id = ");
            query.append(Long.toString(userId));
            query.append(" AND email_id = ");
            query.append(Long.toString(emailId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            if (rs.next()) ret = rs.getLong("email_type_id");

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting email_type_id");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting email_type_id");
        } catch (Exception e) {
            throw new EJBException("Exception getting email_type_id\n" + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getEmailTypeId");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getEmailTypeId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getEmailTypeId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getEmailTypeId");}}
        }
        return(ret);
    }

    public String getAddress(long userId, long emailId) {

        log.debug("getAddress called...user_id: " + userId + " email_id: " + emailId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        String ret = null;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("SELECT address FROM email WHERE user_id = ");
            query.append(Long.toString(userId));
            query.append(" AND email_id = ");
            query.append(Long.toString(emailId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            if (rs.next()) ret = rs.getString("address");

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting email address");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting email address");
        } catch (Exception e) {
            throw new EJBException("Exception getting email address\n" + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getAddress");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getAddress");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getAddress");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getAddress");}}
        }
        return(ret);
    }

    public void setEmailTypeId(long userId, long emailId, long emailTypeId) {

        log.debug("setEmailTypeId called...userId: " + userId + " emailId: " + emailId + " emailTypeId: " + emailTypeId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("UPDATE email SET email_type_id = " + emailTypeId + ", modify_date = 'now' WHERE user_id = ");
            query.append(Long.toString(userId));
            query.append(" AND email_id = ");
            query.append(Long.toString(emailId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in update: " + rows);

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating emailTypeId");
        } catch (NamingException e) {
            throw new EJBException("NamingException updating emailTypeId");
        } catch (Exception e) {
            throw new EJBException("Exception updating emailTypeId\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setEmailTypeId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setEmailTypeId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setEmailTypeId");}}
        }
    }

    public void setAddress(long userId, long emailId, String address) {

        log.debug("setAddress called...userId: " + userId + " emailId: " + emailId + " address: " + address);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("UPDATE email SET address = '" + address + "', modify_date = 'now' WHERE user_id = ");
            query.append(Long.toString(userId));
            query.append(" AND email_id = ");
            query.append(Long.toString(emailId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in update: " + rows);

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating email_address");
        } catch (NamingException e) {
            throw new EJBException("NamingException updating email_address");
        } catch (Exception e) {
            throw new EJBException("Exception updating email_address\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setAddress");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setAddress");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setAddress");}}
        }
    }
}