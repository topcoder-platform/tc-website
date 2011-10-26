/*
 * Copyright (C) 2004-2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.ejb.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.ejb.EJBException;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;

/**
 * <p>An implementation of <code>User Terms Of Use EJB</code>.</p>
 *
 * <p>
 * Version 1.1 (TopCoder Online Review Switch To Local Calls Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Removed unused references and import for <code>InitialContext</code> class as such context was not used in
 *     methods and could provide undesired impact when doing local library calls to methods of this class.</li>
 *   </ol>
 * </p>
 *
 * @author isv
 * @version 1.1
 */
public class UserTermsOfUseBean extends BaseEJB {

    private static Logger log = Logger.getLogger(UserTermsOfUseBean.class);

    /**
     * <p>Records the fact of acceptance of specified terms of use by specified user.</p>
     *
     * @param userId a <code>long</code> providing the user ID.
     * @param _terms_of_use_id a <code>long</code> providing the terms of use ID.
     * @param dataSource a <code>String</code> referencing the datasource to be used for establishing connection to
     *        target database.
     * @throws EJBException if an unexpected error occurs.
     */
    public void createUserTermsOfUse(long userId, long _terms_of_use_id, String dataSource)
            throws EJBException {

        log.debug("ivern debug: createUserTermsOfUse(" + userId + ", " + _terms_of_use_id + ") called.");

        Connection conn = null;
        PreparedStatement ps = null;

        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("INSERT ");
            query.append("INTO user_terms_of_use_xref (user_id,terms_of_use_id) ");
            query.append("VALUES (?,?)");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);
            ps.setLong(2, _terms_of_use_id);

            log.debug("ivern debug: before update.");
            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows inserted into " +
                        "'user_terms_of_use_xref'. Inserted " + rc + ", " +
                        "should have inserted 1."));
            }
            log.debug("ivern debug: insert OK.");
        } catch (SQLException _sqle) {
            log.debug("ivern debug: Exception thrown, stacktrace:");
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(ps);
            close(conn);
        }
    }

    /**
     * <p>Removes the record on the fact of acceptance of specified terms of use by specified user.</p>
     *
     * @param userId a <code>long</code> providing the user ID.
     * @param _terms_of_use_id a <code>long</code> providing the terms of use ID.
     * @param dataSource a <code>String</code> referencing the datasource to be used for establishing connection to
     *        target database.
     * @throws EJBException if an unexpected error occurs.
     */
    public void removeUserTermsOfUse(long userId, long _terms_of_use_id, String dataSource)
            throws EJBException {

        Connection conn = null;
        PreparedStatement ps = null;

        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("DELETE ");
            query.append("FROM user_terms_of_use_xref ");
            query.append("WHERE user_id=? AND terms_of_use_id=?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);
            ps.setLong(2, _terms_of_use_id);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows deleted from " +
                        "'user_terms_of_use_xref'. Deleted " + rc + ", " +
                        "should have deleted 1."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(ps);
            close(conn);
        }
    }

    /**
     * <p>Checks if there is a record on the fact of acceptance of specified terms of use by specified user.</p>
     *
     * @param userId a <code>long</code> providing the user ID.
     * @param termsOfUseId a <code>long</code> providing the terms of use ID.
     * @param dataSource a <code>String</code> referencing the datasource to be used for establishing connection to
     *        target database.
     * @return <code>true</code> if specified user accepted the specified terms of use; <code>false</code> otherwise.
     * @throws EJBException if an unexpected error occurs.
     */
    public boolean hasTermsOfUse(long userId, long termsOfUseId, String dataSource)
            throws EJBException {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean ret = false;
        try {
            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT '1' ");
            query.append("FROM user_terms_of_use_xref ");
            query.append("WHERE user_id=? AND terms_of_use_id=?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);
            ps.setLong(2, termsOfUseId);

            rs = ps.executeQuery();
            ret = rs.next();
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
        }
        return ret;
    }

    /**
     * <p>Checks if there is a record on the fact of banning the specified user from acceptinhg the specified terms of use.</p>
     *
     * @param userId a <code>long</code> providing the user ID.
     * @param termsOfUseId a <code>long</code> providing the terms of use ID.
     * @param dataSource a <code>String</code> referencing the datasource to be used for establishing connection to
     *        target database.
     * @return <code>true</code> if specified user has ban for the specified terms of use; <code>false</code> otherwise.
     * @throws EJBException if an unexpected error occurs.
     */
    public boolean hasTermsOfUseBan(long userId, long termsOfUseId, String dataSource)
            throws EJBException {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean ret = false;
        try {
            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT '1' ");
            query.append("FROM user_terms_of_use_ban_xref ");
            query.append("WHERE user_id=? AND terms_of_use_id=?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);
            ps.setLong(2, termsOfUseId);

            rs = ps.executeQuery();
            ret = rs.next();
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
        }
        return ret;
    }
}

