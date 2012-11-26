/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.DocumentManagerLocal;
import com.topcoder.apps.review.document.ReviewScorecard;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.ProjectTrackerLocal;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import com.topcoder.shared.util.logging.Logger;

/**
 * This Model provides business logic through which users retrieve review scorecards.
 *
 * @author adic
 * @version 1.0
 */
public class RetrieveReviewScorecards implements Model {

    private static Logger log = Logger.getLogger(RetrieveReviewScorecards.class);
    
    /**
     * Retrieves the review scorecards for a project. An admin can see all scorecards, a reviewer can see his scorecards
     * and all other scorecards if they are completed, a submitter can see only his scorecards if they are completed.
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
        log.debug("Starting request to model class RetrieveReviewScorecards ...");

        if (!(data instanceof ReviewScorecardsData)) {
            // should never happen if front-end works properly
            return new FailureResult("Invalid ActionData object, expected ReviewScorecardsData");
        }

        ReviewScorecardsData reviewScorecardsData = (ReviewScorecardsData) data;

        SecurityEnabledUser user = reviewScorecardsData.getUser();
        if (user == null) {
            // should never happen if front-end works properly
            return new FailureResult("Null user, you have to login first");
        }

        UserProjectInfo userProjectInfo = reviewScorecardsData.getProject();
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
            Project project = projectTracker.getProject(reviewScorecardsData.getProject(), user.getTCSubject());

            // get review scorecards
            DocumentManagerLocal documentManager = EJBHelper.getDocumentManager();
            ReviewScorecard[] scorecards = null;
            if (reviewScorecardsData.getRetrieveQuestions()) {
                scorecards = documentManager.getReviewScorecardFull(project, user.getTCSubject());
            } else {
                scorecards = documentManager.getReviewScorecard(project, user.getTCSubject());
            }

            // return result
            int j = ProjectDetail.strip(project, user, scorecards);
            ReviewScorecard[] temp = new ReviewScorecard[j];
            System.arraycopy(scorecards, 0, temp, 0, j);
            return new ReviewScorecardsRetrieval(temp);

            // throw RuntimeExceptions and Errors, wrap other exceptions in FailureResult
        } catch (RuntimeException e) {
            log.error("", e);
            throw e;
        } catch (Error e) {
            log.error("", e);
            throw e;
        } catch (Exception e) {
            return new FailureResult(e);
        }
    }

}

