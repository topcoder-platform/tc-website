/*
 * Copyright (C) 2006-2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.ContestStatus;
import com.topcoder.web.studio.util.Util;
import com.topcoder.shared.util.DBMS;

import java.util.Date;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * <p>A controller for handling the requests for viewing details for selected <code>Studio</code> contest.</p>
 *
 * <p>
 *   Version 1.1 (Studio Spec Review Signup Page - Release Assembly) Change notes:
 *   <ol>
 *     <li>Implemented additional logic for letting the users see contest details if they have appropriate permission
 *     set from <code>Cockpit</code> application or if contest has finished review.</li>
 *   </ol>
 * </p>
 *
 * @author dok, isv, TCSDEVELOPER
 * @version 1.1
 * @since 1.0
 */
public class ViewContestDetails extends ShortHibernateProcessor {

    /**
     * <p>Implements the business logic for processing the requests for viewing details for the specified contest.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    protected void dbProcessing() throws Exception {
        String contestId = getRequest().getParameter(Constants.CONTEST_ID);
        if ("".equals(StringUtils.checkNull(contestId))) {
            throw new NavigationException("No contest specified");
        } else {
            Long cid;
            try {
                cid = new Long(contestId);
            } catch (NumberFormatException e) {
                throw new NavigationException("Invalid contest specified");
            }
            Contest contest = StudioDAOUtil.getFactory().getContestDAO().find(cid);

            // Since TopCoder Studio Modifications Assembly - the contest creator may also view the contest
            // details (for preview) (Req# 5.5)
            long userId = getUser().getId();
            if (Util.isAdmin(userId) || (userId == contest.getCreateUserId())
                || canViewContestDetails(contest, userId)) {
                getRequest().setAttribute("contest", contest);
            } else {
                if (ContestStatus.ACTIVE.equals(contest.getStatus().getId())) {
                    Date now = new Date();
                    if (contest.getStartTime().before(now)) {
                        getRequest().setAttribute("contest", contest);
                    } else {
                        throw new NavigationException("Inactive contest specified.");
                    }
                } else {
                    throw new NavigationException("Invalid contest specified.");
                }
            }
            boolean registered = false;
            if (userIdentified()) {
                User u = DAOUtil.getFactory().getUserDAO().find(userId);
                if (StudioDAOUtil.getFactory().getContestRegistrationDAO().find(contest, u) != null) {
                    registered = true;
                }
            }
            
            getRequest().setAttribute("registered", registered);

            if ("on".equalsIgnoreCase(Constants.GLOBAL_AD_FLAG)) {
                if (userIdentified()) {
                    getRequest().setAttribute("has_global_ad",
                                              PactsServicesLocator.getService().hasGlobalAD(getUser().getId()));
                } else {
                    getRequest().setAttribute("has_global_ad", false);
                }
            }

            getRequest().setAttribute("currentTime", new Date());

            setNextPage("/contestDetails.jsp");
            setIsNextPageInContext(true);
        }

    }

    /**
     * <p>Checks if specified user can vew details for specified contest.</p>
     *
     * @param contest a <code>Contest</code> providing the contest details.
     * @param userId a <code>long</code> providing the user ID.
     * @return <code>true</code> if specified user can view details for specified contest; <code>false</code> otherwise.
     * @throws SQLException if an SQL error occurs.
     */
    private boolean canViewContestDetails(Contest contest, long userId) throws SQLException {
        long contestId;
        String permissionIds;
        if (contest.getDirectProjectId() != null) {
            contestId = contest.getDirectProjectId();
            permissionIds = "1, 2, 3";
        } else {
            contestId = contest.getId();
            permissionIds = "4, 5, 6";
        }

        Connection conn = DBMS.getConnection(DBMS.STUDIO_DATASOURCE_NAME);

        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            ps = conn.prepareStatement("SELECT COUNT(*) AS cnt, " +
                                       "       (SELECT review_status_type_id FROM spec_review WHERE contest_id = ?) " +
                                       "       AS review_status_type_id " +
                                       "FROM user_permission_grant g " +
                                       "WHERE user_id = ? AND resource_id = ? AND permission_type_id IN ("
                                       + permissionIds + ") ");
            ps.setLong(1, contestId);
            ps.setLong(2, userId);
            ps.setLong(3, contestId);

            rs = ps.executeQuery();
            if (rs.next()) {
                if ((rs.getInt(1) > 0) || (rs.getInt(2) == 1)) {
                    // User is either granted one of read, full, write permissions for contest/TC Direct project
                    // or requested contest has review finished and passed
                    return true;
                }
            }
        } finally {
            close(rs);
            close(ps);
            close(conn);
        }

        return false;
    }

    /**
     * <p>Closes the specified result set. Any SQL error which may occur is handled silently so it won't interrupt the
     * current logic flow.</p>
     *
     * @param resultSet a <code>ResultSet</code> to close.
     */
    private static void close(ResultSet resultSet) {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                // Ignore this error and do not fill the console output with unnecessary stack trace
            }
        }
    }

    /**
     * <p>Closes the specified SQL statement. Any SQL error which may occur is handled silently so it won't interrupt
     * the current logic flow.</p>
     *
     * @param statement a <code>PreparedStatement</code> to close.
     */
    private static void close(PreparedStatement statement) {
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                // Ignore this error and do not fill the console output with unnecessary stack trace
            }
        }
    }

    /**
     * <p>Closes the specified connection to database. Any SQL error which may occur is handled silently so it won't
     * interrupt the current logic flow.</p>
     *
     * @param connection a <code>Connection</code> to close.
     */
    private static void close(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                // Ignore this error and do not fill the console output with unnecessary stack trace
            }
        }
    }
}
