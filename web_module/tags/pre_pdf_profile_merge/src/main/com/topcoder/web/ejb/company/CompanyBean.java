package com.topcoder.web.ejb.company;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.web.ejb.idgeneratorclient.IdGeneratorClient;

import javax.ejb.EJBException;
import javax.naming.Context;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 * Bean which modifies Company table
 *
 * @author George Nassar
 * @version $Revision$
 */
public class CompanyBean extends BaseEJB {
    private static final Logger log = Logger.getLogger(CompanyBean.class);
    private static final String DATA_SOURCE = "java:comp/env/datasource_name";
    private static final String JTS_DATA_SOURCE = "java:comp/env/jts_datasource_name";

    /**
     *
     *
     * @return a long with the unique company ID created
     */
    public long createCompany() {
        log.debug("createCompany called...");

        PreparedStatement ps = null; // could just use Statement
        Connection conn = null;
        long ret = 0;

        try {

            ret = IdGeneratorClient.getSeqId("COMPANY_SEQ");

            conn = DBMS.getConnection(JTS_DATA_SOURCE);

            ps = conn.prepareStatement("INSERT INTO company (company_id) " +
                    "VALUES (?)");
            ps.setLong(1, ret);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in insert: " +
                        rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException creating company");
        } catch (Exception e) {
            throw new EJBException("Exception creating company:\n" +
                    e.getMessage());
        } finally {
            close(ps);
            close(conn);
        }

        return (ret);
    }

    /**
     *
     *
     * @param companyId company ID of the entry
     *
     * @return a String with the entry's company name
     */
    public String getName(long companyId) {
        log.debug("getName called...company_id: " + companyId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        String ret = null;

        try {
            conn = DBMS.getConnection(DATA_SOURCE);

            ps = conn.prepareStatement("SELECT company_name FROM company " +
                    "WHERE company_id = ?");
            ps.setLong(1, companyId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getString("company_name");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting company_name for " +
                    "company_id: " + companyId);
        } catch (Exception e) {
            throw new EJBException("Exception getting company_name for " +
                    "company_id: " + companyId + "\n" +
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
     * @param companyId company ID of the entry
     *
     * @return a long with the entry's primary contact ID
     */
    public long getPrimaryContactId(long companyId) {
        log.debug("getPrimaryContactId called...company_id: " + companyId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        long ret = 0;

        try {
            conn = DBMS.getConnection(DATA_SOURCE);

            ps = conn.prepareStatement("SELECT primary_contact_id FROM " +
                    "company WHERE company_id = ?");
            ps.setLong(1, companyId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getLong("primary_contact_id");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting primary_contact_id " +
                    "for company_id: " + companyId);
        } catch (Exception e) {
            throw new EJBException("Exception getting primary_contact_id for" +
                    " company_id: " + companyId + "\n" +
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
     * @param companyId company ID of the entry
     *
     * @return new user status
     */
    public String getNewUserStatus(long companyId) {
        log.debug("getNewUserStatus called...company_id: " + companyId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        String ret = null;

        try {
            conn = DBMS.getConnection(DATA_SOURCE);

            ps = conn.prepareStatement("SELECT new_user_status FROM " +
                    "company WHERE company_id = ?");
            ps.setLong(1, companyId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getString("new_user_status");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting new_user_status " +
                    "for company_id: " + companyId);
        } catch (Exception e) {
            throw new EJBException("Exception getting new_user_status for" +
                    " company_id: " + companyId + "\n" +
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
     * @param companyId company ID of entry to set
     * @param name the company name to set to
     */
    public void setName(long companyId, String name) {
        log.debug("setName called...companyId: " + companyId + " name: " +
                name);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;

        try {
            conn = DBMS.getConnection(JTS_DATA_SOURCE);

            ps = conn.prepareStatement("UPDATE company SET company_name = ? " +
                    "WHERE company_id = ?");
            ps.setString(1, name);
            ps.setLong(2, companyId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " +
                        rows + " for company_id: " + companyId +
                        " company_name: " + name);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating company_id: " +
                    companyId + " company_name: " + name);
        } catch (Exception e) {
            throw new EJBException("Exception updating company_id: " +
                    companyId + " company_name: " + name +
                    "\n" + e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    /**
     *
     *
     * @param companyId company ID of entry to set
     * @param primaryContactId the primary contact to set to
     */
    public void setPrimaryContactId(long companyId, long primaryContactId) {
        log.debug("setPrimaryContactId called...companyId: " + companyId +
                " primaryContactId: " + primaryContactId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;

        try {
            conn = DBMS.getConnection(JTS_DATA_SOURCE);

            ps = conn.prepareStatement("UPDATE company SET " +
                    "primary_contact_id = ? " +
                    "WHERE company_id = ?");
            ps.setLong(1, primaryContactId);
            ps.setLong(2, companyId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " +
                        rows + " for company_id: " + companyId +
                        " primary_contact_id: " +
                        primaryContactId);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating company_id: " +
                    companyId + " primary_contact_id: " +
                    primaryContactId);
        } catch (Exception e) {
            throw new EJBException("Exception updating company_id: " +
                    companyId + " primary_contact_id: " +
                    primaryContactId + "\n" + e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    /**
     *
     *
     * @param companyId company ID of entry to set
     * @param newUserStatus the primary contact to set to
     */
    public void setNewUserStatus(long companyId, String newUserStatus) {
        log.debug("setNewUserStatus called...companyId: " + companyId +
                " newUserStatus: " + newUserStatus);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;

        try {
            conn = DBMS.getConnection(JTS_DATA_SOURCE);

            ps = conn.prepareStatement("UPDATE company SET " +
                    "new_user_status = ? " +
                    "WHERE company_id = ?");
            ps.setString(1, newUserStatus);
            ps.setLong(2, companyId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " +
                        rows + " for company_id: " + companyId +
                        " new_user_status: " +
                        newUserStatus);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating company_id: " +
                    companyId + " new_user_status: " +
                    newUserStatus);
        } catch (Exception e) {
            throw new EJBException("Exception updating company_id: " +
                    companyId + " new_user_status: " +
                    newUserStatus + "\n" + e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

}
