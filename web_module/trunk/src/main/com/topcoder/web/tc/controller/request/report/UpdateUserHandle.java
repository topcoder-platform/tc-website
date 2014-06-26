/*
 * Copyright (C) 2014 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.topcoder.reg.RegistrationHelper;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.tc.Constants;

import javax.transaction.Status;
import javax.transaction.TransactionManager;

/**
 * <p>A controller to be used for servicing requests for updating the handle of desired user.</p>
 * 
 * @author frozenfx
 * @version 1.0
 */
public class UpdateUserHandle extends ChangeUserHandle {

    /**
     * SQL to update user handle by user id in user table.
     */
    private static final String SQL_UPDATE_USER_HANDLE = "UPDATE user SET handle = ? WHERE user_id = ?";
    /**
     * SQL to update user id by login id in security_user table.
     */
    private static final String SQL_UPDATE_SECURITY_USER_HANDLE = "UPDATE security_user SET user_id = ? WHERE login_id = ?";
    /**
     * SQL to update value by old user handle in resource_info table.
     */
    private static final String SQL_UPDATE_RESOURCE_INFO = "UPDATE resource_info SET value = ? WHERE resource_info_type_id=2 AND value = ?";
    /**
     * SQL to update user handle by coder id in coder table.
     */
    private static final String SQL_UPDATE_CODER_HANDLE = "UPDATE coder SET handle = ? WHERE coder_id = ?";
    /**
     * SQL to select existing user handle by new handle in user table.
     */
    private static final String SQL_SELECT_EXISTING_USER_HANDLE = "SELECT handle FROM user WHERE handle = ?";

    /**
     * Handle form submitting for user handle change.
     *
     * @throws TCWebException
     *             if any error occurs, throw TCWebException
     */
    protected void businessProcessing() throws TCWebException {
        String userId = getRequest().getParameter(Constants.USER_ID);

        // Validate request parameters
        if (!((SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).isAdmin()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
        if (StringUtils.checkNull(userId).equals("")) {
            throw new NavigationException("Request missing user id");
        }

        try {
            User user = (User) createEJB(getInitialContext(), User.class);
            String oldHandle = user.getHandle(Long.parseLong(userId), DBMS.OLTP_DATASOURCE_NAME);

            // handle validation
            String newHandle = getRequest().getParameter(Constants.NEW_HANDLE_INPUT);
            if (oldHandle.equals(newHandle)) {
                addError(Constants.NEW_HANDLE, "New handle is the same with old handle.");
            }
            else if (RegistrationHelper.isNullOrEmptyString(newHandle)) {
                addError(Constants.NEW_HANDLE, "New handle is required.");
            } else {
                final int handleLen = newHandle.length();
                if (handleLen > com.topcoder.reg.Constants.MAX_HANDLE_LENGTH || 
                        handleLen < com.topcoder.reg.Constants.MIN_HANDLE_LENGTH) {
                    addError(Constants.NEW_HANDLE, "Length of handle in character should be between " + 
                            com.topcoder.reg.Constants.MIN_HANDLE_LENGTH
                            + " and" + com.topcoder.reg.Constants.MAX_HANDLE_LENGTH);
                } else {
                    // Check if the handle is invalid.
                    String result = RegistrationHelper.validateHandle(newHandle);
                    if (null != result) {
                        addError(Constants.NEW_HANDLE, result);
                    } else {
                        // Validate handle availability.
                        String existingHandle = retrieveExistingHandleByNewHandle(newHandle);
                        if (existingHandle != null) {
                            addError(Constants.NEW_HANDLE, "Handle '" + newHandle + "' has already been taken");
                        }
                    }
                }
            }
            
            if (!hasErrors()) {
                TransactionManager tm = (TransactionManager) getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);
                try {
                    tm.begin();
                    // call update sql
                    callSqlStatement(newHandle, Long.parseLong(userId), null, 
                            DBMS.OLTP_DATASOURCE_NAME, SQL_UPDATE_USER_HANDLE);

                    callSqlStatement(newHandle, Long.parseLong(userId), null, 
                            DBMS.OLTP_DATASOURCE_NAME, SQL_UPDATE_SECURITY_USER_HANDLE);

                    callSqlStatement(newHandle, null, oldHandle, 
                            DBMS.TCS_OLTP_DATASOURCE_NAME, SQL_UPDATE_RESOURCE_INFO);

                    callSqlStatement(newHandle, Long.parseLong(userId), null, 
                            DBMS.DW_DATASOURCE_NAME, SQL_UPDATE_CODER_HANDLE);

                    //redirect user back to the member profile page
                    SessionInfo info = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
                    setNextPage(info.getServletPath() + "?" + Constants.MODULE_KEY + "=LegacyReport&t=profile&ha=" + newHandle);
                    setIsNextPageInContext(false);
                    tm.commit();
                } catch (Exception e) {
                    try {
                        if (tm != null && (tm.getStatus() == Status.STATUS_ACTIVE || tm.getStatus() == Status.STATUS_MARKED_ROLLBACK)) {
                            tm.rollback();
                        }
                    } catch (Exception te) {
                        throw new TCWebException(e);
                    }
                    throw new TCWebException(e);
                }
            } else {
                setDefault(Constants.NEW_HANDLE_INPUT, newHandle);
                super.businessProcessing();
            }

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    /**
     * This method was used to execute the update/insert sqls.
     * 
     * @param newHandle
     *            the new user handle.
     * @param userId
     *            the user ID.
     * @param oldHandle
     *            the old user handle.
     * @param DBMSName
     *            the DBMS name for executing this sql.
     * @param sqlStatement
     *            the sql statement.
     * @throws Exception
     *             If there is any error.
     */
    private void callSqlStatement(String newHandle, Long userId, String oldHandle, String DBMSName, 
            String sqlStatement) throws Exception {
        Connection conn = null;
        PreparedStatement pst = null;

        try {
            conn = DBMS.getConnection(DBMSName);
            pst = conn.prepareStatement(sqlStatement);
            pst.setString(1, newHandle);
            if (oldHandle != null) {
                pst.setString(2, oldHandle);
            } else {
                pst.setLong(2, userId);
            }
            pst.executeUpdate();

        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            log.error(e.getMessage(), e);
        } finally {
            DBMS.close(pst);
            DBMS.close(conn);
        }
    }

    /**
     * This method was used to retrieve existing user handle by new handle.
     * 
     * @param newHandle
     *            the new user handle.
     * @return
     *        if the new handle was already exist in the user table, return this handle
     *        else return null
     * @throws Exception
     *             If there is any error.
     */
    private String retrieveExistingHandleByNewHandle(String newHandle) {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String existingHandle = null;
        try {
            conn = DBMS.getConnection(DBMS.OLTP_DATASOURCE_NAME);
            pst = conn.prepareStatement(SQL_SELECT_EXISTING_USER_HANDLE);
            pst.setString(1, newHandle);
            rs = pst.executeQuery();

            while (rs.next()) {
                existingHandle = rs.getString("handle");
            }
            return existingHandle;
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            log.error(e.getMessage(), e);
        } finally {
            DBMS.close(rs);
            DBMS.close(pst);
            DBMS.close(conn);
        }
        return null;
    }

}
