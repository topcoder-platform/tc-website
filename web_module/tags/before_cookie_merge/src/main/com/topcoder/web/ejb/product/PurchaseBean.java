package com.topcoder.web.ejb.product;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.idgenerator.IdGenerator;
import com.topcoder.util.idgenerator.sql.SimpleDB;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;


/**
 * Bean which modifies Purchase table
 *
 * @author George Nassar
 * @version $Revision$
 */
public class PurchaseBean extends BaseEJB {
    private static Logger log = Logger.getLogger(PurchaseBean.class);
    private static final String DATA_SOURCE = "java:comp/env/datasource_name";
    private static final String JTS_DATA_SOURCE = "java:comp/env/jts_datasource_name";


    /**
     *
     *
     * @param productId the product ID to assign to a purchase
     * @param userId the contact ID to assign to a purchase
     * @param paid
     * @return a long with the unique purchase ID created
     */
    public long createPurchase(long productId, long userId, double paid) {
        log.debug("createPurchase called...");

        Context ctx = null;
        PreparedStatement ps = null; // could just use Statement
        Connection conn = null;
        DataSource ds = null;
        long ret = 0;

        try {
            ctx = new InitialContext();

            if (!IdGenerator.isInitialized()) {
                IdGenerator.init(
                        new SimpleDB(),
                        (DataSource) ctx.lookup(DATA_SOURCE),
                        "sequence_object",
                        "name",
                        "current_value",
                        9999999999L,
                        1,
                        false
                );
            }

            ret = IdGenerator.nextId("PURCHASE_SEQ");

            ds = (DataSource) ctx.lookup(JTS_DATA_SOURCE);
            conn = ds.getConnection();

            ps = conn.prepareStatement(
                    "INSERT INTO purchase (purchase_id, product_id, " +
                    "user_id, paid) VALUES (?,?,?,?)"
            );
            ps.setLong(1, ret);
            ps.setLong(2, productId);
            ps.setLong(3, userId);
            ps.setDouble(4, paid);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in insert: " + rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException creating purchase");
        } catch (NamingException e) {
            throw new EJBException("NamingException creating purchase");
        } catch (Exception e) {
            throw new EJBException("Exception creating purchase:\n" +
                    e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }

        return (ret);
    }

    /**
     *
     *
     * @param purchaseId purchase ID of entry to set
     * @param companyId the company ID to set to
     */
    public void setCompanyId(long purchaseId, long companyId) {
        log.debug("setCompanyId called...purchaseId: " + purchaseId +
                " companyId: " + companyId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(JTS_DATA_SOURCE);
            conn = ds.getConnection();

            ps = conn.prepareStatement("UPDATE purchase SET company_id = ? " +
                    "WHERE purchase_id = ?");
            ps.setLong(1, companyId);
            ps.setLong(2, purchaseId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " +
                        rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating company_id");
        } catch (NamingException e) {
            throw new EJBException("NamingException updating company_id");
        } catch (Exception e) {
            throw new EJBException("Exception updating company_id\n" +
                    e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    /**
     *
     *
     * @param purchaseId purchase ID of entry to set
     * @param productId the product ID to set to
     */
    public void setProductId(long purchaseId, long productId) {
        log.debug("setProductId called...purchaseId: " + purchaseId +
                " productId: " + productId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(JTS_DATA_SOURCE);
            conn = ds.getConnection();

            ps = conn.prepareStatement("UPDATE purchase SET product_id = ? " +
                    "WHERE purchase_id = ?");
            ps.setLong(1, productId);
            ps.setLong(2, purchaseId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " +
                        rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating product_id");
        } catch (NamingException e) {
            throw new EJBException("NamingException updating product_id");
        } catch (Exception e) {
            throw new EJBException("Exception updating product_id\n" +
                    e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    /**
     *
     *
     * @param purchaseId purchase ID of entry to set
     * @param contactId the contact ID to set to
     */
    public void setContactId(long purchaseId, long contactId) {
        log.debug("setContactId called...purchaseId: " + purchaseId +
                " contactId: " + contactId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(JTS_DATA_SOURCE);
            conn = ds.getConnection();

            ps = conn.prepareStatement("UPDATE purchase SET contact_id = ? " +
                    "WHERE purchase_id = ?");
            ps.setLong(1, contactId);
            ps.setLong(2, purchaseId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " +
                        rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating contact_id");
        } catch (NamingException e) {
            throw new EJBException("NamingException updating contact_id");
        } catch (Exception e) {
            throw new EJBException("Exception updating contact_id\n" +
                    e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    /**
     *
     *
     * @param purchaseId purchase ID of entry to set
     * @param startDate the start date to set to
     */
    public void setStartDate(long purchaseId, Date startDate) {
        log.debug("setStartDate called...purchaseId: " + purchaseId +
                " startDate: " + startDate);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(JTS_DATA_SOURCE);
            conn = ds.getConnection();

            ps = conn.prepareStatement("UPDATE purchase SET start_date = ? " +
                    "WHERE purchase_id = ?");
            ps.setDate(1, startDate);
            ps.setLong(2, purchaseId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " +
                        rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating start_date");
        } catch (NamingException e) {
            throw new EJBException("NamingException updating start_date");
        } catch (Exception e) {
            throw new EJBException("Exception updating start_date\n" +
                    e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    /**
     *
     *
     * @param purchaseId purchase ID of entry to set
     * @param endDate the end date to set to
     */
    public void setEndDate(long purchaseId, Date endDate) {
        log.debug("setEndDate called...purchaseId: " + purchaseId +
                " endDate: " + endDate);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(JTS_DATA_SOURCE);
            conn = ds.getConnection();

            ps = conn.prepareStatement("UPDATE purchase SET end_date = ? " +
                    "WHERE purchase_id = ?");
            ps.setDate(1, endDate);
            ps.setLong(2, purchaseId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " +
                        rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating end_date");
        } catch (NamingException e) {
            throw new EJBException("NamingException updating end_date");
        } catch (Exception e) {
            throw new EJBException("Exception updating end_date\n" +
                    e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    /**
     *
     *
     * @param purchaseId purchase ID of the entry
     *
     * @return a long with the entry's company ID
     */
    public long getCompanyId(long purchaseId) {
        log.debug("getCompanyId called... purchase_id: " + purchaseId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        long ret = 0;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(JTS_DATA_SOURCE);
            conn = ds.getConnection();

            ps = conn.prepareStatement("SELECT company_id FROM purchase " +
                    "WHERE purchase_id = ?");
            ps.setLong(1, purchaseId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getLong("company_id");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting companyId");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting companyId");
        } catch (Exception e) {
            throw new EJBException("Exception getting companyId\n" +
                    e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return (ret);
    }

    /**
     *
     *
     * @param purchaseId purchase ID of the entry
     *
     * @return a long with the entry's product ID
     */
    public long getProductId(long purchaseId) {
        log.debug("getProductId called... purchase_id: " + purchaseId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        long ret = 0;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(JTS_DATA_SOURCE);
            conn = ds.getConnection();

            ps = conn.prepareStatement("SELECT product_id FROM purchase " +
                    "WHERE purchase_id = ?");
            ps.setLong(1, purchaseId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getLong("product_id");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting productId");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting productId");
        } catch (Exception e) {
            throw new EJBException("Exception getting productId\n" +
                    e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return (ret);
    }

    /**
     *
     *
     * @param purchaseId purchase ID of the entry
     *
     * @return a long with the entry's contact ID
     */
    public long getContactId(long purchaseId) {
        log.debug("getContactId called... purchase_id: " + purchaseId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        long ret = 0;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(JTS_DATA_SOURCE);
            conn = ds.getConnection();

            ps = conn.prepareStatement("SELECT contact_id FROM purchase " +
                    "WHERE purchase_id = ?");
            ps.setLong(1, purchaseId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getLong("contact_id");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting contactId");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting contactId");
        } catch (Exception e) {
            throw new EJBException("Exception getting contactId\n" +
                    e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return (ret);
    }

    /**
     *
     *
     * @param purchaseId purchase ID of the entry
     *
     * @return a long with the entry's start date
     */
    public Date getStartDate(long purchaseId) {
        log.debug("getStartDate called... purchase_id: " + purchaseId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        Date ret = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(JTS_DATA_SOURCE);
            conn = ds.getConnection();

            ps = conn.prepareStatement("SELECT start_date FROM purchase " +
                    "WHERE purchase_id = ?");
            ps.setLong(1, purchaseId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getDate("start_date");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting startDate");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting startDate");
        } catch (Exception e) {
            throw new EJBException("Exception getting startDate\n" +
                    e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return (ret);
    }

    /**
     *
     *
     * @param purchaseId purchase ID of the entry
     *
     * @return a long with the entry's end date
     */
    public Date getEndDate(long purchaseId) {
        log.debug("getEndDate called... purchase_id: " + purchaseId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        Date ret = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(JTS_DATA_SOURCE);
            conn = ds.getConnection();

            ps = conn.prepareStatement("SELECT end_date FROM purchase " +
                    "WHERE purchase_id = ?");
            ps.setLong(1, purchaseId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getDate("end_date");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting endDate");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting endDate");
        } catch (Exception e) {
            throw new EJBException("Exception getting endDate\n" +
                    e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return (ret);
    }

    public double getPaid(long purchaseId) {
        log.debug("getPaid called... purchase_id: " + purchaseId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        double ret = 0.0;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(JTS_DATA_SOURCE);
            conn = ds.getConnection();

            ps = conn.prepareStatement("SELECT paid FROM purchase " +
                    "WHERE purchase_id = ?");
            ps.setLong(1, purchaseId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getDouble("paid");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting paid");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting paid");
        } catch (Exception e) {
            throw new EJBException("Exception getting paid\n" +
                    e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return (ret);
    }


    /**
     *
     *
     * @param purchaseId purchaes ID of the entry
     *
     * @return when the purchase was created
     */
    public Date getCreateDate(long purchaseId) {
        log.debug("getCreateDate called...purchase_id: " + purchaseId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        Date ret = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(JTS_DATA_SOURCE);
            conn = ds.getConnection();

            ps = conn.prepareStatement("SELECT create_date FROM purchase WHERE " +
                    "purchase_id = ?");
            ps.setLong(1, purchaseId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getDate("create_date");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting create_date");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting create_date");
        } catch (Exception e) {
            throw new EJBException("Exception getting create_date\n" +
                    e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return (ret);
    }


    /**
     *
     *
     * @param purchaseId purchase ID of entry to set
     * @param paid the paid value to set to
     */
    public void setPaid(long purchaseId, double paid) {
        log.debug("setPaid called...purchaseId: " + purchaseId +
                " paid: " + paid);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(JTS_DATA_SOURCE);
            conn = ds.getConnection();

            ps = conn.prepareStatement("UPDATE purchase SET paid = ? " +
                    "WHERE purchase_id = ?");
            ps.setDouble(1, paid);
            ps.setLong(2, purchaseId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " +
                        rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating paid");
        } catch (NamingException e) {
            throw new EJBException("NamingException updating paid");
        } catch (Exception e) {
            throw new EJBException("Exception updating paid\n" +
                    e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }
}
