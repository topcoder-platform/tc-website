package com.topcoder.web.ejb.company;

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

public class CompanyBean implements SessionBean {

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

    public long createCompany() {

        log.debug("createCompany called...");

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
            ret = IdGenerator.nextId("COMPANY_SEQ");

            StringBuffer query = new StringBuffer();
            query.append("INSERT INTO company (company_id, create_date, modify_date) VALUES ('");
            query.append(Long.toString(ret));
            query.append("','now','now')");

            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in insert: " + rows);

        } catch (SQLException sqe) {
            printSqlException(true, sqe);
            throw new EJBException("SQLException creating company");
        } catch (NamingException e) {
            throw new EJBException("NamingException creating company");
        } catch (Exception e) {
            throw new EJBException("Exception creating company:\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in createCompany");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in createCompany");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in createCompany");}}
        }
        return(ret);
    }

    public String getName(long companyId) {

        log.debug("getName called...company_id: " + companyId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        String ret = null;

        try {
            StringBuffer query = new StringBuffer();
            query.append("SELECT company_name FROM company WHERE company_id = ");
            query.append(Long.toString(companyId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            if (rs.next()) ret = rs.getString("company_name");

        } catch (SQLException sqe) {
            printSqlException(true, sqe);
            throw new EJBException("SQLException getting company_name for company_id: " + companyId);
        } catch (NamingException e) {
            throw new EJBException("NamingException getting company name");
        } catch (Exception e) {
            throw new EJBException("Exception getting company_name for company_id: " + companyId + "\n" + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getName");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getName");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getName");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getName");}}
        }
        return(ret);
    }

    public long getPrimaryContactId(long companyId) {

        log.debug("getPrimaryContactId called...company_id: " + companyId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        long ret = 0;

        try {
            StringBuffer query = new StringBuffer();
            query.append("SELECT primary_contact_id FROM company WHERE company_id = ");
            query.append(Long.toString(companyId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            if (rs.next()) ret = rs.getLong("primary_contact_id");

        } catch (SQLException sqe) {
            printSqlException(true, sqe);
            throw new EJBException("SQLException getting primary_contact_id for company_id: " + companyId);
        } catch (NamingException e) {
            throw new EJBException("NamingException getting primary contact id");
        } catch (Exception e) {
            throw new EJBException("Exception getting primary_contact_id for company_id: " + companyId + "\n" + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getPrimaryContactId");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getPrimaryContactId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getPrimaryContactId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getPrimaryContactId");}}
        }
        return(ret);
    }

    public void setName(long companyId, String name) {

        log.debug("setName called...companyId: " + companyId + " name: " + name);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer();
            query.append("UPDATE company SET company_name = '" + name + "', modify_date = 'now' WHERE company_id = ");
            query.append(Long.toString(companyId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in update: " + rows + " for company_id: " + companyId + " company_name: " + name);

        } catch (SQLException sqe) {
            printSqlException(true, sqe);
            throw new EJBException("SQLException updating company_id: " + companyId + " company_name: " + name);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating company name");
        } catch (Exception e) {
            throw new EJBException("Exception updating company_id: " + companyId + " company_name: " + name + "\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setName");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setName");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setName");}}
        }
    }

    public void setPrimaryContactId(long companyId, long primaryContactId) {

        log.debug("setPrimaryContactId called...companyId: " + companyId + " primaryContactId: " + primaryContactId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer();
            query.append("UPDATE company SET primary_contact_id = " + primaryContactId + ", modify_date = 'now' WHERE company_id = ");
            query.append(Long.toString(companyId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in update: " + rows + " for company_id: " + companyId + " primary_contact_id: " + primaryContactId);

        } catch (SQLException sqe) {
            printSqlException(true, sqe);
            throw new EJBException("SQLException updating company_id: " + companyId + " primary_contact_id: " + primaryContactId);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating company primaryContactId");
        } catch (Exception e) {
            throw new EJBException("Exception updating company_id: " + companyId + " primary_contact_id: " + primaryContactId + "\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setPrimaryContactId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setPrimaryContactId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setPrimaryContactId");}}
        }
    }
}