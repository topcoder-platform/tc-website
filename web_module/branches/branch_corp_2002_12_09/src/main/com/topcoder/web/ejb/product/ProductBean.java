package com.topcoder.web.ejb.product;

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

public class ProductBean implements SessionBean {

    private SessionContext ctx;
    private static Logger log = Logger.getLogger(ProductBean.class);
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

    public long createProduct(float cost) {

        log.debug("createProduct called...");

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
            ret = IdGenerator.nextId("PRODUCT_SEQ");

            StringBuffer query = new StringBuffer(100);
            query.append("INSERT INTO product (product_id, cost, create_date, modify_date) VALUES (");
            query.append(Long.toString(ret) + "," + Float.toString(cost));
            query.append(",'now','now')");

            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in insert: " + rows);

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException creating product");
        } catch (NamingException e) {
            throw new EJBException("NamingException creating product");
        } catch (Exception e) {
            throw new EJBException("Exception creating product:\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in createProduct");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in createProduct");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in createProduct");}}
        }
        return(ret);
    }

    public String getProductDesc(long productId) {

        log.debug("getProductDesc called...product_id: " + productId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        String ret = null;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("SELECT product_desc FROM product WHERE product_id = ");
            query.append(Long.toString(productId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            if (rs.next()) ret = rs.getString("product_desc");

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting product_desc");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting product_desc");
        } catch (Exception e) {
            throw new EJBException("Exception getting product_desc\n" + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getProductDesc");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getProductDesc");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getProductDesc");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getProductDesc");}}
        }
        return(ret);
    }

    public float getCost(long productId) {

        log.debug("getCost called...product_id: " + productId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        float ret = (float)0.0;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("SELECT cost FROM product WHERE product_id = ");
            query.append(Long.toString(productId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            if (rs.next()) ret = rs.getFloat("cost");

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting cost");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting cost");
        } catch (Exception e) {
            throw new EJBException("Exception getting cost\n" + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getCost");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getCost");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getCost");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getCost");}}
        }
        return(ret);
    }

    public void setProductDesc(long productId, String productDesc) {

        log.debug("setProductDesc called...productId: " + productId + " productDesc: " + productDesc);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("UPDATE product SET product_desc = '" + productDesc + "', modify_date = 'now' WHERE product_id = ");
            query.append(Long.toString(productId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in update: " + rows);

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating productDesc");
        } catch (NamingException e) {
            throw new EJBException("NamingException updating productDesc");
        } catch (Exception e) {
            throw new EJBException("Exception updating productDesc\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setProductDesc");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setProductDesc");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setProductDesc");}}
        }
    }

    public void setCost(long productId, float cost) {

        log.debug("setCost called...productId: " + productId + "cost: " + cost);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("UPDATE product SET cost = " + cost + ", modify_date = 'now' WHERE product_id = ");
            query.append(Long.toString(productId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong cost of rows in update: " + rows);

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating cost");
        } catch (NamingException e) {
            throw new EJBException("NamingException updating cost");
        } catch (Exception e) {
            throw new EJBException("Exception updating cost\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setCost");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setCost");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setCost");}}
        }
    }
}