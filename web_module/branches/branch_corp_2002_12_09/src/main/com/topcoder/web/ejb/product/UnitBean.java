package com.topcoder.web.ejb.product;

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

public class UnitBean implements SessionBean {

    private SessionContext ctx;
    private static Logger log = Logger.getLogger(UnitBean.class);
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

    public void createUnit(long productId, long unitTypeId, int numUnits) {

        log.debug("createUnit called...");

        Context ctx = null;
        PreparedStatement ps = null; // could just use Statement
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("INSERT INTO unit (product_id, unit_type_id, num_units) VALUES (");
            query.append(Long.toString(productId) + "," + Long.toString(unitTypeId) + ",");
            query.append(Integer.toString(numUnits));
            query.append(")");

            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in insert: " + rows);

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException creating unit");
        } catch (NamingException e) {
            throw new EJBException("NamingException creating unit");
        } catch (Exception e) {
            throw new EJBException("Exception creating unit:\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in createUnit");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in createUnit");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in createUnit");}}
        }
    }

    public int getNumUnits(long productId, long unitTypeId) {

        log.debug("getNumUnits called...product_id: " + productId + " unitTypeId: " + unitTypeId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        int ret = 0;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("SELECT num_units FROM unit WHERE product_id = ");
            query.append(Long.toString(productId));
            query.append(" AND unit_type_id = ");
            query.append(Long.toString(unitTypeId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            if (rs.next()) ret = rs.getInt("num_units");

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting unit_type_id");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting unit_type_id");
        } catch (Exception e) {
            throw new EJBException("Exception getting unit_type_id\n" + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getNumUnits");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getNumUnits");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getNumUnits");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getNumUnits");}}
        }
        return(ret);
    }

    public void setNumUnits(long productId, long unitTypeId, int numUnits) {

        log.debug("setNumUnits called...productId: " + productId + " unitTypeId: " + unitTypeId + " numUnits: " + numUnits);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("UPDATE unit SET num_units = " + numUnits + " WHERE product_id = ");
            query.append(Long.toString(productId));
            query.append(" AND unit_type_id = ");
            query.append(Long.toString(unitTypeId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong cost of rows in update: " + rows);

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating num_units");
        } catch (NamingException e) {
            throw new EJBException("NamingException updating num_units");
        } catch (Exception e) {
            throw new EJBException("Exception updating num_units\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setNumUnits");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setNumUnits");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setNumUnits");}}
        }
    }
}