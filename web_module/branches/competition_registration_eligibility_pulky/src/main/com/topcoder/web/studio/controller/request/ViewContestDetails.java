/*
 * Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import java.util.Date;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
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

/**
 * <p>This class will process a request to view specific contest details.</p>
 *
 * <p>
 *   Version 1.1 (Studio Release Assembly - Spec Review Sign up page v1.0) Change notes:
 *   <ol>
 *     <li>
 *         If the user has access (read, write or full) from the cockpit permission
 *         (table user_permission_grant) on the contest or the associated tc direct
 *         project settings, then they can also view the contest.
 *     </li>
 *     <li>
 *         All contest details pages are viewable to every logged in user after the specification
 *         review is complete. (Review Status Type is PASSED)
 *     </li>
 *   </ol>
 * </p>
 *
 * @author dok, TCSDEVELOPER
 * @version 1.1
 */
public class ViewContestDetails extends ShortHibernateProcessor {

    /**
     * A <code>String</code> constant that stores the query name for the can_view_contest_details query
     *
     * @since 1.1
     */
    private static final String CAN_VIEW_CONTEST_DETAILS_QUERY_NAME = "can_view_contest_details";

    /**
     * This method executes the actual business logic for this processor.
     *
     * @throws Exception if any error occurs
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
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

            // Check if the user has permissions to see contest details even if it's still not active
            long userId = getUser().getId();
            if (Util.isAdmin(userId) || (userId == contest.getCreateUserId()) || hasPermissions(userId, cid)) {
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
     * Private helper method to check if a user has permissions to see contest details even before the contest is active
     *
     * <p>
     *   The query will check the following:
     *   <ol>
     *      <li>
     *         If the specified user is the create_user from the contest table
     *      </li>
     *      <li>
     *         If the user has access (read, write or full) from the cockpit permission
     *         (table user_permission_grant) on the contest or the associated tc direct
     *         project settings, then they can also view the contest.
     *      </li>
     *      <li>
     *         If contest details pages are viewable to every logged in user after the specification
     *         review is initiated.
     *      </li>
     *   </ol>
     * </p>
     *
     * @param userId the user id to query
     * @param contestId the contest id to query
     * @return true if the user has permissions to see contest details even before the contest is active
     * @throws Exception if an error occurs in the underlying layer
     *
     * @since 1.1
     */
    private boolean hasPermissions(long userId, long contestId) throws Exception {
        if (userIdentified()) {
            if (log.isDebugEnabled()) {
                log.debug("checking if userId " + userId + " can preview contest details for contest_id: " + contestId);
            }

            DataAccess da = new DataAccess(DBMS.STUDIO_DATASOURCE_NAME);
            Request r = new Request();
            r.setContentHandle(CAN_VIEW_CONTEST_DETAILS_QUERY_NAME);

            r.setProperty(Constants.USER_ID, String.valueOf(userId));
            r.setProperty(Constants.CONTEST_ID, String.valueOf(contestId));

            ResultSetContainer rsc = da.getData(r).get(CAN_VIEW_CONTEST_DETAILS_QUERY_NAME);

            if (rsc.size() > 0) {
                if (log.isDebugEnabled()) {
                    log.debug("userId: " + userId + " can preview details for contest id: " + contestId);
                }
                return true;
            }
        }
        if (log.isDebugEnabled()) {
            log.debug("userId: " + userId + " cannot preview details for contest id: " + contestId);
        }
        return false;
    }
}
