/*
 * Copyright (C) 2011 - 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.badge;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.topcoder.shared.security.SimpleResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.PermissionException;

/**
 * <p>
 * This class aggregates all commonly used methods, like permission checking.
 * </p>
 * 
 * @author TCSASSEMBLER
 * @version 1.0
 * @since 1.0
 */
public abstract class BaseBadgeProcessor extends BaseProcessor {
    /**
     * The qualified name of this class.
     */
    private static final String CLASS_NAME = BaseBadgeProcessor.class.getName();

    /**
     * This SQL query retrieve user id for the given handle.
     */
    private static final String SQL_QUERY_USER_ID_BY_HANDLE = "SELECT user_id FROM user WHERE handle = ?";

    /**
     * This method checks if the logged user has sufficient privileges to
     * operate badge view/edit.
     * 
     * @return true if the logged in user is an administrator. false otherwise.
     * @throws PermissionException
     *             If the logged-in user does not have sufficient privileges.
     */
    protected boolean hasPermission() throws PermissionException {
        final String signature = CLASS_NAME + "#checkPermission()";
        log.debug("Enter " + signature);
        // check if already logged in.
        if (getAuthentication().getActiveUser().isAnonymous()) {
            setNextPage("/tc?" + BadgeAdminToolConstants.MODULE_KEY + "=Login");
            setIsNextPageInContext(false);
            return false;
        }

        // check if the logged in user is administrator.
        if (!getSessionInfo().isAdmin()) {
            throw new PermissionException(getAuthentication().getActiveUser(), new SimpleResource("Badge Admin Tool"));
        }
        log.debug("Exit " + signature);
        return true;
    }

    /**
     * This method retrieves the userId for a given handle.
     * 
     * @param handle
     *            The handle to search
     * @return Id of the user that corresponds to the handle.
     * @throws Exception
     *             If there is any error.
     */
    protected long retrieveUserId(String handle) throws Exception {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            conn = DBMS.getConnection(DBMS.COMMON_OLTP_DATASOURCE_NAME);
            pst = conn.prepareStatement(SQL_QUERY_USER_ID_BY_HANDLE);
            pst.setString(1, handle);
            rs = pst.executeQuery();
            while(rs.next()) {
                return rs.getLong("user_id");
            }
        } catch (SQLException e) {
            log.error(e.getMessage(), e);
            DBMS.printSqlException(true, e);
        } finally {
            DBMS.close(rs);
            DBMS.close(pst);
            DBMS.close(conn);
        }
        throw new Exception("Handle incorrect");
    }
}
