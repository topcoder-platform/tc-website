package com.topcoder.web.ejb.user;

import com.topcoder.shared.util.logging.Logger;
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

public class ContactBean implements SessionBean {

    private SessionContext ctx;
    private static Logger log = Logger.getLogger(UserBean.class);
    private static final String dataSourceName = "CORP_OLTP";

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

    public void createContact(long companyId, long contactId) {

        log.debug("createContact called...");

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer();
            query.append("INSERT INTO contact (contact_id, company_id, create_date, modify_date) VALUES (");
            query.append(Long.toString(contactId) + "," + Long.toString(companyId) + ",'now','now')");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in insert: " + rows);

        } catch (SQLException sqe) {
            printSqlException(true, sqe);
            throw new EJBException("SQLException creating contact");
        } catch (NamingException e) {
            throw new EJBException("NamingException creating contact");
        } catch (Exception e) {
            throw new EJBException("Exception creating contact:\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in createContact");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in createContact");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in createContact");}}
        }
        return(ret);
    }

    public void setCompany(long contactId, long companyId) {

        log.debug("setCompany called...contactId: " + contactId + " companyId: " + companyId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;
        long ret = 0;

        try {
            StringBuffer query = new StringBuffer();
            query.append("UPDATE contact SET company_id = " + companyId + ", modify_date = 'now' WHERE contact_id = ");
            query.append(Long.toString(contactId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in update: " + rows + " for contact_id: " + contactId + " company_id: " + companyId);

        } catch (SQLException sqe) {
            printSqlException(true, sqe);
            throw new EJBException("SQLException updating contact_id: " + contactId + " company_id: " + companyId);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating company ID");
        } catch (Exception e) {
            throw new EJBException("Exception updating contact_id: " + contactId + " company_id: " + companyId + "\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setCompany");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setCompany");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setCompany");}}
        }
    }

    public long getCompanyId(long contactId) {

        log.debug("getCompanyId called...contact_id: " + contactId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        long ret = 0;

        try {
            StringBuffer query = new StringBuffer();
            query.append("SELECT company_id FROM contact WHERE contact_id = ");
            query.append(Long.toString(contactId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            if (rs.next()) ret = rs.getLong("company_id");

        } catch (SQLException sqe) {
            printSqlException(true, sqe);
            throw new EJBException("SQLException getting company_id for contact_id: " + contactId);
        } catch (NamingException e) {
            throw new EJBException("NamingException getting contact ID");
        } catch (Exception e) {
            throw new EJBException("Exception getting company_id for contact_id: " + contactId + "\n" + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getCompanyId");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getCompanyId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getCompanyId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getCompanyId");}}
        }
        return (ret);
    }

    public String getTitle(long contactId) {

        log.debug("getTitle called...contact_id: " + contactId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        String ret = null;

        try {
            StringBuffer query = new StringBuffer();
            query.append("SELECT title FROM user WHERE contact_id = ");
            query.append(Long.toString(contactId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            if (rs.next()) ret = rs.getString("title");

        } catch (SQLException sqe) {
            printSqlException(true, sqe);
            throw new EJBException("SQLException getting title for contact_id: " + contactId);
        } catch (NamingException e) {
            throw new EJBException("NamingException getting contact title");
        } catch (Exception e) {
            throw new EJBException("Exception getting title for contact_id: " + contactId + "\n" + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getTitle");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getTitle");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getTitle");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getTitle");}}
        }
        return (ret);
    }

    public void setTitle(long contactId, String title) {

        log.debug("setTitle called...contactId: " + contactId + " title: " + title);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer();
            query.append("UPDATE contact SET title = '" + title + "', modify_date = 'now' WHERE contact_id = ");
            query.append(Long.toString(contactId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in update: " + rows + " for contact_id: " + contactId + " title: " + title);

        } catch (SQLException sqe) {
            printSqlException(true, sqe);
            throw new EJBException("SQLException updating contact_id: " + contactId + " title: " + title);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating title");
        } catch (Exception e) {
            throw new EJBException("Exception updating contact_id: " + contactId + " title: " + title + "\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setTitle");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setTitle");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setTitle");}}
        }
    }