/*
 * Copyright (C) 2014 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
 * <p>A controller to be used for servicing requests for updating the status of desired user.</p>
 * 
 * @author frozenfx
 * @version 1.0
 */
public class UpdateUserStatus extends ChangeUserStatus {

    /**
     * SQL to update user status by user id.
     */
    private static final String SQL_UPDATE_USER_STATUS = "UPDATE user SET status = ? WHERE user_id = ?";

    /**
     * SQL to insert into user_achievement table.
     */
    private static final String SQL_INSERT_USER_ACHIEVEMENT = "INSERT INTO user_achievement VALUES (?, today, 2, ?, current)";

    /**
     * Handle form submitting for user status change.
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
            String handle = user.getHandle(Long.parseLong(userId), DBMS.OLTP_DATASOURCE_NAME);

            // status value validation
            String newStatus = getRequest().getParameter(Constants.NEW_STATUS_SELECT);
            String oldStatus = String.valueOf(user.getStatus(Long.parseLong(userId), DBMS.OLTP_DATASOURCE_NAME));

            // the comments length validation
            String newStatusComment = getRequest().getParameter(Constants.NEW_STATUS_COMMENT);
            if (!(newStatus.equals("A") || newStatus.equals("5") || newStatus.equals("4") || newStatus.equals("6"))) {
                addError(Constants.NEW_STATUS, 
                        "The new status should be one of the four allowed values ('A', '5', '4' or '6').");
            }
            else if (newStatus.equals(oldStatus)) {
                addError(Constants.NEW_STATUS, "The new status is the same with the old one.");
            }
            else if (newStatusComment != null && newStatusComment.trim().length() > 255) {
                addError(Constants.NEW_STATUS, "The new status comments should be less or equal than 255 characters.");
            }

            if (!hasErrors()) {
                TransactionManager tm = (TransactionManager) getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);
                try {
                    tm.begin();
                    // call update sql
                    callSqlStatement(newStatus, Long.parseLong(userId), null, 
                            DBMS.OLTP_DATASOURCE_NAME, SQL_UPDATE_USER_STATUS);

                    if (newStatusComment != null && newStatusComment.trim().length() > 0) {
                    callSqlStatement(null, Long.parseLong(userId), newStatusComment.trim(), 
                            DBMS.OLTP_DATASOURCE_NAME, SQL_INSERT_USER_ACHIEVEMENT);
                    }

                    //redirect user back to the member profile page
                    SessionInfo info = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
                    setNextPage(info.getServletPath() + "?" + Constants.MODULE_KEY + "=LegacyReport&t=profile&ha=" + handle);
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
                // if has errors, we should write back those values
                getRequest().setAttribute(Constants.OLD_STATUS_SELECT_VALUE, newStatus);
                setDefault(Constants.NEW_STATUS_COMMENT, newStatusComment);
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
     * @param statusValue
     *            the new status value.
     * @param userId
     *            the user ID.
     * @param comment
     *            the comment for user new status.
     * @param DBMSName
     *            the DBMS name for executing this sql.
     * @param sqlStatement
     *            the sql statement.
     * @throws Exception
     *             If there is any error.
     */
    private void callSqlStatement(String statusValue, Long userId, String comment, String DBMSName, 
            String sqlStatement) throws Exception {
        Connection conn = null;
        PreparedStatement pst = null;

        try {
            conn = DBMS.getConnection(DBMSName);
            pst = conn.prepareStatement(sqlStatement);
            if (statusValue == null) {
                pst.setLong(1, userId);
                pst.setString(2, comment);
            } else {
                pst.setString(1, statusValue);
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

}
