package com.topcoder.web.ejb.product;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;
import javax.naming.Context;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 * Bean which modifies ProductUnit table
 *
 * @author George Nassar
 * @version $Revision$
 */
public class ProductUnitBean extends BaseEJB {
    private static final String DATA_SOURCE = "java:comp/env/datasource_name";
    private static final String JTS_DATA_SOURCE = "java:comp/env/jts_datasource_name";
    private static Logger log = Logger.getLogger(ProductUnitBean.class);

    /**
     *
     *
     * @param productId the product ID to insert
     * @param unitId the unit type ID to insert
     * @param numUnits the number of units to insert
     */
    public void createProductUnit(long productId, long unitId, int numUnits)
            throws EJBException {
        log.debug("createProductUnit called...");

        Context ctx = null;
        PreparedStatement ps = null; // could just use Statement
        Connection conn = null;
        DataSource ds = null;

        try {
            conn = DBMS.getConnection(JTS_DATA_SOURCE);

            ps = conn.prepareStatement("INSERT INTO product_unit_xref (product_id, " +
                    "unit_id, num_units) " +
                    "VALUES (?,?,?)");
            ps.setLong(1, productId);
            ps.setLong(2, unitId);
            ps.setInt(3, numUnits);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in insert: " +
                        rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException creating unit");
        } catch (Exception e) {
            throw new EJBException("Exception creating unit:\n" +
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
     * @param productId product ID of the entry
     * @param unitId unit type ID of the entry
     *
     * @return the entry's number of units
     */
    public int getNumUnits(long productId, long unitId)
            throws EJBException {
        log.debug("getNumUnits called...product_id: " + productId +
                " unitId: " + unitId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        int ret = 0;

        try {
            conn = DBMS.getConnection(JTS_DATA_SOURCE);

            ps = conn.prepareStatement("SELECT num_units FROM product_unit_xref WHERE " +
                    "product_id = ? AND unit_id = ?");
            ps.setLong(1, productId);
            ps.setLong(2, unitId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getInt("num_units");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting unit_id");
        } catch (Exception e) {
            throw new EJBException("Exception getting unit_id\n" +
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
     * @param productId product ID of the entry
     *
     * @return
     */
    public ResultSetContainer getUnits(long productId)
            throws EJBException {
        log.debug("getNumUnits called...product_id: " + productId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        ResultSetContainer ret = null;

        try {
            conn = DBMS.getConnection(JTS_DATA_SOURCE);

            StringBuffer query = new StringBuffer(150);
            query.append("SELECT u.unit_id");
            query.append(" , u.unit_desc");
            query.append(" , u.unit_type_id");
            query.append(" FROM product_unit_xref p");
            query.append(" , unit u");
            query.append(" WHERE p.product_id = ?");
            query.append(" AND p.unit_id = u.unit_id");

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, productId);
            rs = ps.executeQuery();
            ret = new ResultSetContainer(rs);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting unit_id");
        } catch (Exception e) {
            throw new EJBException("Exception getting unit_id\n" + e.getMessage());
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
     * @param productId product ID of entry to set
     * @param unitId unit type ID of entry to set
     * @param numUnits the number of units to set to
     */
    public void setNumUnits(long productId, long unitId, int numUnits)
            throws EJBException {
        log.debug("setNumUnits called...productId: " + productId +
                " unitId: " + unitId + " numUnits: " + numUnits);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            conn = DBMS.getConnection(JTS_DATA_SOURCE);

            ps = conn.prepareStatement("UPDATE product_unit_xref SET num_units = ? " +
                    "WHERE product_id = ? AND " +
                    "unit_id = ?");
            ps.setInt(1, numUnits);
            ps.setLong(2, productId);
            ps.setLong(3, unitId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong cost of rows in update: " +
                        rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating num_units");
        } catch (Exception e) {
            throw new EJBException("Exception updating num_units\n" +
                    e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

}
