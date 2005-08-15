/**
 * Copyright ? 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.DocumentManagerLocal;
import com.topcoder.apps.review.document.ScreeningScorecard;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.ProjectTrackerLocal;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;

/**
 * This Model provides business logic through which users screen projects.
 *
 * @author adic
 * @version 1.0
 */
public class ScreenProject implements Model {

    /**
     * Allows an admin or a reviewer to retrieve the screening document and allows an admin or screener to
     * submit the screening scorecard for a project.
     *
     * @param data a ScreeningData object with the populated user, submitter id and screening scorecard
     *        if the screening scorecard is null then a request for the scorecard is performed
     *        if not, the passed screening scorecard is saved into the document manager
     *
     * @return a SuccessResult if the screening scorecard was saved successfully
     *         a ScreeningScorecardRetrieval containing the requested screening scorecard
     *         a FailureResult object if the data object is not populated correctly or if the user does not have
     *         permissions or if the submitter id is invalid (does not have a submission)
     *         a FailureResult containing an exception in case one is thrown
     *         (Errors and RuntimeExceptions are propagated so they aren't included in this category)
     */
    public ResultData start(ActionData data) {
        LogHelper.logModel(this, data);

        if (!(data instanceof ScreeningData)) {
            // should never happen if front-end works properly
            return new FailureResult("Invalid ActionData object, expected ScreeningData");
        }

        ScreeningData screeningData = (ScreeningData) data;

        SecurityEnabledUser user = screeningData.getUser();
        if (user == null) {
            // should never happen if front-end works properly
            return new FailureResult("Null user, you have to login first");
        }

        UserProjectInfo userProjectInfo = screeningData.getProject();
        if (userProjectInfo == null) {
            // should never happen if front-end works properly
            return new FailureResult("Null project");
        }

        try {
            // check permission
            //if (!PermissionHelper.isAdmin(user) && !PermissionHelper.hasReviewPermission(user, userProjectInfo)) {
            //    return new FailureResult("You cannot see the screening scorecard for this project"
            //        +", userId: " + user.getId() + ", projectId: " + userProjectInfo.getId());
            //}

            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();
            DocumentManagerLocal documentManager = EJBHelper.getDocumentManager();
            Project project = projectTracker.getProject(userProjectInfo, user.getTCSubject());

            if (screeningData.getScreeningScorecard() == null) {
                // get the ScreeningScorecard for the front-end
                ScreeningScorecard[] scorecard = documentManager.getScreeningScorecardFull(project, user.getTCSubject());
                for (int i = 0; i < scorecard.length; i++) {
                    if (scorecard[i].getSubmission().getSubmitter().getId() == screeningData.getSubmitterId()) {
                        return new ScreeningScorecardRetrieval(scorecard[i]);
                    }
                }
                return new FailureResult("Cannot get the screening scorecard for the specified submitter");
            } else {
                // check permission
                if (!PermissionHelper.isAdmin(user) && !PermissionHelper.hasScreenPermission(user, userProjectInfo)) {
                    return new FailureResult("You cannot screen for this project");
                }

                // check project phase
                System.err.println("### UserProjectInfo phase ID: " + userProjectInfo.getCurrentPhaseInstance().getPhase().getId());
                if (!PhaseHelper.canScreen(project)) {
                    return new FailureResult("You can screen only during the screening phase");
                }

                // compute score and save the ScreeningScorecard
                ScreeningScorecard scorecard = screeningData.getScreeningScorecard();
                if (scorecard.isCompleted() && scorecard.getQuestions() != null) {
                    try {
                        scorecard.setScore(new ScoringHelper().calculateScore(scorecard).getWeightedScore());
                    } catch (ArithmeticException e) {
                        return new FailureResult("Error while calculating the score: ", e);
                    }
                }
                documentManager.saveScreeningScorecard(scorecard, user.getTCSubject());

                return new SuccessResult();
            }

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

