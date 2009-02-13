/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.projecttracker.ProjectTrackerLocal;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;

/**
 * This Model provides business logic through which users view all projects (for admins only).
 *
 * @author adic
 * @version 1.0
 */
public class ViewAllProjects implements Model {

    /**
     * Retrieves all the available projects (no mather if they are still opened or not).
     * This method is available only for admins.
     *
     * @param data an OnlineReviewData object with the populated user
     *
     * @return a ProjectsRetrieval object populated with an array of the requested projects
     *         a FailureResult object if the data object is not populated correctly or is the user is not an admin
     *         a FailureResult containing an exception in case one is thrown
     *         (Errors and RuntimeExceptions are propagated so they aren't included in this category)
     */
    public ResultData start(ActionData data) {
        LogHelper.logModel(this, data);

        if (!(data instanceof OnlineReviewData)) {
            // should never happen if front-end works properly
            return new FailureResult("Invalid ActionData object, expected OnlineReviewData");
        }

        OnlineReviewData onlineReviewData = (OnlineReviewData) data;

        SecurityEnabledUser user = onlineReviewData.getUser();
        if (user == null) {
            // should never happen if front-end works properly
            return new FailureResult("Null user, you have to login first");
        }

        try {
            if (!PermissionHelper.isAdmin(user)) {
                return new FailureResult("You have to be admin to access this page");
            }

            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();
            UserProjectInfo[] projects = projectTracker.getProjectInfo(user.getTCSubject());

            // strip closed projects
            int j = 0;
            for (int i = 0; i < projects.length; i++) {
                if (!PhaseHelper.isClosed(projects[i])) {
                    projects[j++] = projects[i];
                }
            }
            UserProjectInfo[] temp = new UserProjectInfo[j];
            System.arraycopy(projects, 0, temp, 0, j);
            return new ProjectsRetrieval(temp);

            // throw RuntimeExceptions and Errors, wrap other exceptions in FailureResult
        } catch (RuntimeException e) {
            LogHelper.log("", e);
            throw e;
        } catch (Error e) {
            LogHelper.log("", e);
            throw e;
        } catch (Exception e) {
            return new FailureResult(e);
        }
    }

}

