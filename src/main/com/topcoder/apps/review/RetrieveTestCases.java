/**
 * Copyright � 2004, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.DocumentManagerLocal;
import com.topcoder.apps.review.document.TestCase;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.ProjectTrackerLocal;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;

/**
 * This Model provides business logic through which users retrieve testcases.
 *
 * @author adic
 * @version 1.0
 */
public class RetrieveTestCases implements Model {

    /**
     * Retrieves the testcases for a project.
     *
     * @param data a ReviewScorecardsData object with the populated user and project
     *
     * @return a ReviewScorecardsRetrieval object populated with an array of the requested scorecards
     *         a FailureResult object if the data object is not populated correctly or is the user is not an admin,
     *         reviewer or submitter
     *         a FailureResult containing an exception in case one is thrown
     *         (Errors and RuntimeExceptions are propagated so they aren't included in this category)
     */
    public ResultData start(ActionData data) {
        LogHelper.logModel(this, data);

        if (!(data instanceof OnlineReviewProjectData)) {
            // should never happen if front-end works properly
            return new FailureResult("Invalid ActionData object, expected OnlineReviewProjectData");
        }

        OnlineReviewProjectData projectData = (OnlineReviewProjectData) data;

        SecurityEnabledUser user = projectData.getUser();
        if (user == null) {
            // should never happen if front-end works properly
            return new FailureResult("Null user, you have to login first");
        }

        UserProjectInfo userProjectInfo = projectData.getProject();
        if (userProjectInfo == null) {
            // should never happen if front-end works properly
            return new FailureResult("Null project");
        }

        try {
            // check permission
            if (!PermissionHelper.isAdmin(user) && !PermissionHelper.hasProjectPermission(user, userProjectInfo)) {
                return new FailureResult("You don't have permission to view the testcases for this project");
            }

            // get project
            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();
            Project project = projectTracker.getProject(projectData.getProject(), user.getTCSubject());

            // get testcases
            DocumentManagerLocal documentManager = EJBHelper.getDocumentManager();
            TestCase[] testcases = null;
            testcases = documentManager.getTestCases(project, -1, user.getTCSubject());

            // return result
            return new TestCasesRetrieval(testcases);

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

