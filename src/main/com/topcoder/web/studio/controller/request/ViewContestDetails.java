/*
 * Copyright (C) 2001 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import java.util.Date;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.DAOFactory;
import com.topcoder.web.studio.dao.DAOUtil;
import com.topcoder.web.studio.dto.Project;
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
 *   
 *   Version 1.2 (BUGR-2890) Change notes:
 *   <ol>
 *     <li>
 *         Added a flag so that the JSP can show downloads if the user has corresponding cockpit permissions.
 *     </li>
 *   </ol>
 *   Version 1.2.1 (Studio Contest Detail Pages assembly) Change notes:
 *   <ol>
 *     <li>Added utility {@link #getTextualDiff(Date)} method.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.2.2 (Re-platforming Studio Release 2 Assembly) Change notes:
 *   <ol>
 *     <li>Updated the logic to use conetsts hosted in <code>tcs_catalog</code> database instead of
 *     <code>studio_oltp</code> database.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.2.2 (Re-platforming Studio Release 4 Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Removed unused code.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.2.24 (Replatforming Studio Release 5) change notes:
 *   <ol>
 *     <li>Using the dto classes in com.topcoder.web.studio.dto package instead of in com.topcoder.web.common.model.comp package.</li>
 *   </ol>
 * </p>
 * 
 * @author dok, pulky, isv, TCSDEVELOPER
 * @version 1.2.4
 */
public class ViewContestDetails extends ShortHibernateProcessor {

    /**
     * A <code>String</code> constant that stores the query name for the can_view_contest_details query
     *
     * @since 1.1
     */
    private static final String CAN_VIEW_CONTEST_DETAILS_QUERY_NAME = "studio_can_view_contest_details";

    protected static final Logger log = Logger.getLogger(ViewContestDetails.class);


    /**
     * <p>Constructs new <code>ViewContestDetails</code> instance. This implementation does nothing.</p>
     * 
     * @since 1.2.2
     */
    public ViewContestDetails() {
    }

    /**
     * This method executes the actual business logic for this processor.
     *
     * @throws Exception if any error occurs
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    protected void dbProcessing() throws Exception {
        // user must be logged in to view contest details.
        if (!userLoggedIn()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        try {
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

                DAOFactory factory = DAOUtil.getFactory();
                Project contest = factory.getProjectDAO().find(cid.intValue());

                if (contest == null)
                {
                    throw new NavigationException("Invalid contest specified");
                }

                // Check if the user has permissions to see contest details even if it's still not active
                long userId = getUser().getId();
                if (Util.isAdmin(userId) || (String.valueOf(userId).equals(contest.getCreateUserId()))
                    || hasPermissions(userId, cid)) {
                    getRequest().setAttribute("contest", contest);
                } else {
                    if (Project.STATUS_ACTIVE.equals(contest.getStatusId())) {
                        if (contest.getSpecSubmissionStarted()) {
                            getRequest().setAttribute("contest", contest);
                        } else {
                            throw new NavigationException("Inactive contest specified.");
                        }
                    } else {
                        throw new NavigationException("Inactive contest specified.");
                    }
                }

                boolean isUserIdentified = userIdentified();
                boolean registered =
                    isUserIdentified && (RegistrationHelper.getSubmitterResource(contest, userId) != null);
                getRequest().setAttribute("registered", registered);

                boolean isSpecReviewer = RegistrationHelper.getSpecReviewerResource(contest, userId) != null;
                getRequest().setAttribute("isSpecReviewer", isSpecReviewer);

                if ("on".equalsIgnoreCase(Constants.GLOBAL_AD_FLAG)) {
                    if (isUserIdentified) {
                        getRequest().setAttribute("has_global_ad",
                                                  PactsServicesLocator.getService().hasGlobalAD(getUser().getId()));
                    } else {
                        getRequest().setAttribute("has_global_ad", false);
                    }
                }

                getRequest().setAttribute("currentTime", new Date());
                getRequest().setAttribute("has_cockpit_permissions", Util.hasCockpitPermissions(userId, cid));

                // Handle milestone
                Date milestoneDate = contest.getMilestoneDate();
                if (milestoneDate != null && contest.getMilestoneSubmissionClosed()) {
                    getRequest().setAttribute("canViewMilestone", true);
                } else {
                    getRequest().setAttribute("canViewMilestone", false);
                }

                setNextPage("/contestDetails.jsp");
                setIsNextPageInContext(true);
            }
        } catch (Exception e) {
            log.error("Exception in view contest detail : " +e);
                throw e;
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

            DataAccess da = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
            Request r = new Request();
            r.setContentHandle(CAN_VIEW_CONTEST_DETAILS_QUERY_NAME);

            r.setProperty(Constants.USER_ID, String.valueOf(userId));
            r.setProperty(Constants.PROJECT_ID_KEY, String.valueOf(contestId));

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

    /**
     * <p>Gets the textual description of the period in which the specified date (contest completion) will be reached.
     * </p>
     *
     * @param date a <code>Date</code> providing the date of contest completion.
     * @return a <code>String</code> providing the textual description of the period in which the specified date will
     *         be reached.
     * @since 1.2.1
     */
    public static String getTextualDiff(Date date) {
        if (date == null) {
            return "";
        } else {
            long diff;
            Date now = new Date();
            if (now.after(date)) {
                diff = (now.getTime() - date.getTime()) / 1000L;
            } else {
                diff = (date.getTime() - now.getTime()) / 1000L;
            }

            long yearDuration = 365 * 24 * 3600L;
            long monthDuration = 31 * 24 * 3600L;
            long weekDuration = 7 * 24 * 3600L;
            long dayDuration = 24 * 3600L;
            long hourDuration = 3600L;
            long minuteDuration = 60L;

            long years = diff / yearDuration;
            diff %= yearDuration;
            long months = diff / monthDuration;
            diff %= monthDuration;
            long weeks = diff / weekDuration;
            diff %= weekDuration;
            long days = diff / dayDuration;
            diff %= dayDuration;
            long hours = diff / hourDuration;
            diff %= hourDuration;
            long minutes = diff / minuteDuration;

            StringBuilder b = new StringBuilder();
            addText(years, "year", b);
            addText(months, "month", b);
            addText(weeks, "week", b);
            addText(days, "day", b);
            addText(hours, "hour", b);
            addText(minutes, "min", b);

            if (now.after(date)) {
                b.append(" ago");
            } else {
                b.append(" left");
            }

            return b.toString();
        }
    }

    /**
     * <p>Adds textual presentation of specified numeric value to text output.</p>
     *
     * @param value a <code>long</code> providing the value.
     * @param title a <code>String</code> providing the title for value.
     * @param b a <code>StringBuilder</code> collecting the output.
     * @since 1.2.1
     */
    private static void addText(long value, String title, StringBuilder b) {
        if (value > 0) {
            if (b.length() > 0) {
                b.append(" ");
            }
            b.append(value).append(" ");
            if (value % 10 == 1 && value % 100 != 11) {
                b.append(title);
            } else {
                b.append(title).append("s");
            }
        }
    }
}
