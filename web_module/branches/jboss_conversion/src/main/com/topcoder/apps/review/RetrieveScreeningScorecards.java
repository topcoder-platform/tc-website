/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.DocumentManagerLocal;
import com.topcoder.apps.review.document.ScreeningScorecard;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.ProjectTrackerLocal;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;

/**
 * This Model provides business logic through which users retrieve screening scorecards.
 *
 * @author adic
 * @version 1.0
 */
public class RetrieveScreeningScorecards implements Model {

    /**
     * Retrieves the screening scorecards for a project. An admin can see all scorecards, a reviewer can see his
     * scorecards and all other scorecards if they are completed, a submitter can see only his scorecards if they are
     * completed.
     *
     * @param data a ScreeningScorecardsData object with the populated user and project
     *
     * @return a ScreeningScorecardsRetrieval object populated with an array of the requested scorecards
     *         a FailureResult object if the data object is not populated correctly or is the user is not an admin,
     *         reviewer or submitter
     *         a FailureResult containing an exception in case one is thrown
     *         (Errors and RuntimeExceptions are propagated so they aren't included in this category)
     */
    public ResultData start(ActionData data) {
        LogHelper.logModel(this, data);

        if (!(data instanceof ScreeningScorecardsData)) {
            // should never happen if front-end works properly
            return new FailureResult("Invalid ActionData object, expected ScreeningScorecardsData");
        }

        ScreeningScorecardsData screeningScorecardsData = (ScreeningScorecardsData) data;

        SecurityEnabledUser user = screeningScorecardsData.getUser();
        if (user == null) {
            // should never happen if front-end works properly
            return new FailureResult("Null user, you have to login first");
        }

        UserProjectInfo userProjectInfo = screeningScorecardsData.getProject();
        if (userProjectInfo == null) {
            // should never happen if front-end works properly
            return new FailureResult("Null project");
        }

        try {
            // check permission
            if (!PermissionHelper.isAdmin(user) && !PermissionHelper.hasProjectPermission(user, userProjectInfo)) {
                return new FailureResult("You don't have permission to view the scorecards for this project");
            }

            // get project
            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();
            Project project = projectTracker.getProject(screeningScorecardsData.getProject(), user.getTCSubject());

            // get screening scorecards
            DocumentManagerLocal documentManager = EJBHelper.getDocumentManager();
            ScreeningScorecard[] scorecards = documentManager.getScreeningScorecard(project, user.getTCSubject());

            // return result
            int j = ProjectDetail.strip(project, user, scorecards);
            ScreeningScorecard[] temp = new ScreeningScorecard[j];
            System.arraycopy(scorecards, 0, temp, 0, j);

            return new ScreeningScorecardsRetrieval(temp);

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

