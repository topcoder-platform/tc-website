package com.topcoder.web.ejb.phone;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.web.ejb.idgeneratorclient.IdGeneratorClient;

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
 * Bean which modifies Phone table
 *
 * @author George Nassar
 * @version $Revision$
 */
public class PhoneBean extends BaseEJB {
    private static Logger log = Logger.getLogger(PhoneBean.class);

    /**
     *
     *
     * @return a long with the unique phone ID created
     */
    public long createPhone(long userId, String dataSource, String idDataSource) {
        log.debug("createPhone called...");

        Context ctx = null;
        PreparedStatement ps = null; // could just use Statement
        Connection conn = null;
        DataSource ds = null;
        long ret = 0;

        try {
            ctx = new InitialContext();

            ret = IdGeneratorClient.getSeqId("PHONE_SEQ");

            conn = DBMS.getConnection(dataSource);

            ps = conn.prepareStatement("INSERT INTO phone (user_id, " +
                    "phone_id) VALUES (?,?)");
            ps.setLong(1, userId);
            ps.setLong(2, ret);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in insert: " +
                        rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException creating phone");
        } catch (NamingException e) {
            throw new EJBException("NamingException creating phone");
        } catch (Exception e) {
            throw new EJBException("Exception creating phone:\n" +
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
     * @param phoneId phone ID of the entry
     *
     * @return a long with the entry's phone type ID
     */
    public long getPhoneTypeId(long phoneId, String dataSource) {
        log.debug("getPhoneTypeId called...phone_id: " + phoneId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        long ret = 0;

        try {
            conn = DBMS.getConnection(dataSource);

            ps = conn.prepareStatement("SELECT phone_type_id FROM phone " +
                    "WHERE phone_id = ?");
            ps.setLong(1, phoneId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getLong("phone_type_id");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting phone_type_id");
        } catch (Exception e) {
            throw new EJBException("Exception getting phone_type_id\n" +
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
     * @param phoneId phone ID of the entry
     *
     * @return a long with the entry's phone number
     */
    public String getNumber(long phoneId, String dataSource) {
        log.debug("getNumber called...phone_id: " + phoneId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        String ret = null;

        try {
            conn = DBMS.getConnection(dataSource);

            ps = conn.prepareStatement("SELECT phone_number FROM phone " +
                    "WHERE phone_id = ?");
            ps.setLong(1, phoneId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getString("phone_number");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting phone number");
        } catch (Exception e) {
            throw new EJBException("Exception getting phone number\n" +
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
     * @param phoneId phone ID of entry to set
     * @param phoneTypeId the phone type ID to set to
     */
    public void setPhoneTypeId(long phoneId, long phoneTypeId, String dataSource) {
        log.debug("setPhoneTypeId called...phoneId: " +
                phoneId + " phoneTypeId: " + phoneTypeId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            conn = DBMS.getConnection(dataSource);

            ps = conn.prepareStatement("UPDATE phone SET phone_type_id = ? " +
                    "WHERE phone_id = ?");
            ps.setLong(1, phoneTypeId);
            ps.setLong(2, phoneId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " +
                        rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating phoneTypeId");
        } catch (Exception e) {
            throw new EJBException("Exception updating phoneTypeId\n" +
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
     * @param phoneId phone ID of entry to set
     * @param number
     */
    public void setNumber(long phoneId, String number, String dataSource) {
        log.debug("setNumber called...phoneId: " +
                phoneId + " number: " + number);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            conn = DBMS.getConnection(dataSource);

            ps = conn.prepareStatement("UPDATE phone SET phone_number = ? " +
                    "WHERE phone_id = ?");
            ps.setString(1, number);
            ps.setLong(2, phoneId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " +
                        rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating phone_number");
        } catch (Exception e) {
            throw new EJBException("Exception updating phone_number\n" +
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
     * @param userId user ID to look up
     * @return a long with the user's primary phone ID
     */
    public long getPrimaryPhoneId(long userId, String dataSource) {
        log.debug("getPrimaryPhoneId called...user_id: " + userId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        long ret = 0;

        try {
            conn = DBMS.getConnection(dataSource);

            ps = conn.prepareStatement("SELECT phone_id FROM phone " +
                    "WHERE user_id = ? AND primary_ind = 1");
            ps.setLong(1, userId);
            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getLong("phone_id");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting primary phone_id");
        } catch (Exception e) {
            throw new EJBException("Exception getting primary phone_id\n" +
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
     * @param userId the user ID to set
     * @param phoneId the user's phone ID to set to primary
     */
    public void setPrimaryPhoneId(long userId, long phoneId, String dataSource) {
        log.debug("setPrimaryEmailId called...userId: " + userId +
                " phoneId: " + phoneId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            conn = DBMS.getConnection(dataSource);

            ps = conn.prepareStatement("UPDATE phone SET primary_ind = 0 " +
                    "WHERE user_id = ?");

            ps.setLong(1, userId);

            int rows = ps.executeUpdate();

            ps = conn.prepareStatement("UPDATE phone SET primary_ind = 1 " +
                    "WHERE user_id = ? AND phone_id = ?");

            ps.setLong(1, userId);
            ps.setLong(2, phoneId);

            rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " +
                        rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating primary phone");
        } catch (Exception e) {
            throw new EJBException("Exception updating primary phone\n" +
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
     * @param userId the user ID to check
     * @param phoneId the phone ID to check
     * @return a boolean with whether the phone ID is the user's primary
     */
    public boolean isPrimaryPhoneId(long userId, long phoneId, String dataSource) {
        log.debug("isPrimaryPhoneId called...user_id: " + userId +
                " phone_id: " + phoneId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        int ret = 0;

        try {
            conn = DBMS.getConnection(dataSource);

            ps = conn.prepareStatement("SELECT primary_ind FROM phone " +
                    "WHERE user_id = ? AND phone_id = ?");
            ps.setLong(1, userId);
            ps.setLong(2, phoneId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getInt("primary_ind");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException checking primary phone_id");
        } catch (Exception e) {
            throw new EJBException("Exception checking primary phone_id\n" +
                    e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return (ret == 1);
    }
}
