package com.topcoder.web.ejb.user;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 * Bean which modifies User/Address table
 *
 * @author George Nassar
 * @version $Revision$
 */
public class UserAddressBean extends BaseEJB {
    private static Logger log = Logger.getLogger(UserAddressBean.class);
    private final static String DATA_SOURCE = "java:comp/env/datasource_name";
    private final static String JTS_DATA_SOURCE = "java:comp/env/jts_datasource_name";


    /**
     *
     *
     * @param userId user ID to insert into table
     * @param addressId address ID to insert into table
     */
    public void createUserAddress(long userId, long addressId) {
        log.debug("createUserAddress called...");

        Context ctx = null;
        PreparedStatement ps = null; // could just use Statement
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(JTS_DATA_SOURCE);
            conn = ds.getConnection();

            ps = conn.prepareStatement("INSERT INTO user_address_xref " +
                    "(user_id, address_id) VALUES (?,?)");
            ps.setLong(1, userId);
            ps.setLong(2, addressId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in insert: " +
                        rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException creating user address");
        } catch (NamingException e) {
            throw new EJBException("NamingException creating user address");
        } catch (Exception e) {
            throw new EJBException("Exception creating user address:\n" +
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
     * @param userId user ID of entry to remove
     * @param addressId address ID of entry to remove
     */
    public void removeUserAddress(long userId, long addressId) {
        log.debug("removeUserAddress called...");

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(JTS_DATA_SOURCE);
            conn = ds.getConnection();

            ps = conn.prepareStatement("DELETE FROM user_address_xref " +
                    "WHERE user_id = ? AND address_id = ?");
            ps.setLong(1, userId);
            ps.setLong(2, addressId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in remove: " +
                        rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException removing user address");
        } catch (NamingException e) {
            throw new EJBException("NamingException removing user address");
        } catch (Exception e) {
            throw new EJBException("Exception removing user address:\n" +
                    e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public ResultSetContainer getUserAddresses(long userId) {
        log.debug("getUserAddresses called...");

        Context ctx = null;
        PreparedStatement ps = null; // could just use Statement
        Connection conn = null;
        DataSource ds = null;
        ResultSet rs = null;
        ResultSetContainer rsc = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(DATA_SOURCE);
            conn = ds.getConnection();

            ps = conn.prepareStatement("SELECT address_id FROM user_address_xref " +
                    "WHERE user_id = ?");
            ps.setLong(1, userId);

            rs = ps.executeQuery();
            rsc = new ResultSetContainer(rs);

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting user addresses");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting user addresses");
        } catch (Exception e) {
            throw new EJBException("Exception getting user addresses:\n" +
                    e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return (rsc);
    }
}
