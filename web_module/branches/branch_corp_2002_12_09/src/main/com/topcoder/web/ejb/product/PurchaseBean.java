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
import java.sql.Date;

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

public class PurchaseBean implements SessionBean {

    private SessionContext ctx;
    private static Logger log = Logger.getLogger(PurchaseBean.class);
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

    public long createPurchase(long companyId, long productId, long contactId) {

        log.debug("createPurchase called...");

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
            ret = IdGenerator.nextId("PURCHASE_SEQ");

            StringBuffer query = new StringBuffer(100);
            query.append("INSERT INTO purchase (purchase_id, company_id, product_id, contact_id, create_date, modify_date) VALUES (");
            query.append(Long.toString(ret) + "," + Long.toString(companyId) + "," + Long.toString(productId) + "," + Long.toString(contactId));
            query.append(",'now','now')");

            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in insert: " + rows);

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException creating purchase");
        } catch (NamingException e) {
            throw new EJBException("NamingException creating purchase");
        } catch (Exception e) {
            throw new EJBException("Exception creating purchase:\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in createPurchase");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in createPurchase");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in createPurchase");}}
        }
        return(ret);
    }

    public void setCompanyId(long purchaseId, long companyId) {

        log.debug("setCompanyId called...purchaseId: " + purchaseId + " companyId: " + companyId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("UPDATE purchase SET company_id = " + companyId + ", modify_date = 'now' WHERE purchase_id = ");
            query.append(Long.toString(purchaseId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in update: " + rows);

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating company_id");
        } catch (NamingException e) {
            throw new EJBException("NamingException updating company_id");
        } catch (Exception e) {
            throw new EJBException("Exception updating company_id\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setCompanyId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setCompanyId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setCompanyId");}}
        }
    }

    public void setProductId(long purchaseId, long productId) {

        log.debug("setProductId called...purchaseId: " + purchaseId + " productId: " + productId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("UPDATE purchase SET product_id = " + productId + ", modify_date = 'now' WHERE purchase_id = ");
            query.append(Long.toString(purchaseId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in update: " + rows);

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating product_id");
        } catch (NamingException e) {
            throw new EJBException("NamingException updating product_id");
        } catch (Exception e) {
            throw new EJBException("Exception updating product_id\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setProductId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setProductId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setProductId");}}
        }
    }

    public void setContactId(long purchaseId, long contactId) {

        log.debug("setContactId called...purchaseId: " + purchaseId + " contactId: " + contactId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("UPDATE purchase SET contact_id = " + contactId + ", modify_date = 'now' WHERE purchase_id = ");
            query.append(Long.toString(purchaseId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in update: " + rows);

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating contact_id");
        } catch (NamingException e) {
            throw new EJBException("NamingException updating contact_id");
        } catch (Exception e) {
            throw new EJBException("Exception updating contact_id\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setContactId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setContactId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setContactId");}}
        }
    }

    public void setStartDate(long purchaseId, Date startDate) {

        log.debug("setStartDate called...purchaseId: " + purchaseId + " startDate: " + startDate);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("UPDATE purchase SET start_date = {d '" + startDate + "'}, modify_date = 'now' WHERE purchase_id = ");
            query.append(Long.toString(purchaseId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in update: " + rows);

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating start_date");
        } catch (NamingException e) {
            throw new EJBException("NamingException updating start_date");
        } catch (Exception e) {
            throw new EJBException("Exception updating start_date\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setStartDate");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setStartDate");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setStartDate");}}
        }
    }

    public void setEndDate(long purchaseId, Date endDate) {

        log.debug("setEndDate called...purchaseId: " + purchaseId + " endDate: " + endDate);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("UPDATE purchase SET end_date = {d '" + endDate + "', modify_date = 'now' WHERE purchase_id = ");
            query.append(Long.toString(purchaseId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in update: " + rows);

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating end_date");
        } catch (NamingException e) {
            throw new EJBException("NamingException updating end_date");
        } catch (Exception e) {
            throw new EJBException("Exception updating end_date\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setEndDate");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setEndDate");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setEndDate");}}
        }
    }

    public long getCompanyId(long purchaseId) {

        log.debug("getCompanyId called... purchase_id: " + purchaseId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        long ret = 0;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("SELECT company_id FROM purchase WHERE purchase_id = ");
            query.append(Long.toString(purchaseId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            if (rs.next()) ret = rs.getLong("company_id");

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting companyId");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting companyId");
        } catch (Exception e) {
            throw new EJBException("Exception getting companyId\n" + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getCompanyId");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getCompanyId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getCompanyId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getCompanyId");}}
        }
        return(ret);
    }

    public long getProductId(long purchaseId) {

        log.debug("getProductId called... purchase_id: " + purchaseId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        long ret = 0;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("SELECT product_id FROM purchase WHERE purchase_id = ");
            query.append(Long.toString(purchaseId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            if (rs.next()) ret = rs.getLong("product_id");

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting productId");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting productId");
        } catch (Exception e) {
            throw new EJBException("Exception getting productId\n" + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getProductId");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getProductId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getProductId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getProductId");}}
        }
        return(ret);
    }

    public long getContactId(long purchaseId) {

        log.debug("getContactId called... purchase_id: " + purchaseId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        long ret = 0;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("SELECT contact_id FROM purchase WHERE purchase_id = ");
            query.append(Long.toString(purchaseId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            if (rs.next()) ret = rs.getLong("contact_id");

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting contactId");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting contactId");
        } catch (Exception e) {
            throw new EJBException("Exception getting contactId\n" + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getContactId");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getContactId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getContactId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getContactId");}}
        }
        return(ret);
    }

    public Date getStartDate(long purchaseId) {

        log.debug("getStartDate called... purchase_id: " + purchaseId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        Date ret = null;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("SELECT start_date FROM purchase WHERE purchase_id = ");
            query.append(Long.toString(purchaseId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            if (rs.next()) ret = rs.getDate("start_date");

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting startDate");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting startDate");
        } catch (Exception e) {
            throw new EJBException("Exception getting startDate\n" + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getStartDate");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getStartDate");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getStartDate");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getStartDate");}}
        }
        return(ret);
    }

    public Date getEndDate(long purchaseId) {

        log.debug("getEndDate called... purchase_id: " + purchaseId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        Date ret = null;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("SELECT end_date FROM purchase WHERE purchase_id = ");
            query.append(Long.toString(purchaseId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            if (rs.next()) ret = rs.getDate("end_date");

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting endDate");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting endDate");
        } catch (Exception e) {
            throw new EJBException("Exception getting endDate\n" + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getEndDate");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getEndDate");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getEndDate");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getEndDate");}}
        }
        return(ret);
    }
}