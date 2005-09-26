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
 * This Model provides business logic through which users view review projects.
 *
 * @author adic
 * @version 1.0
 */
public class ReviewProject implements Model {

    private static Logger log = Logger.getLogger(ReviewProject.class);
    
    /**
     * Allows an admin or a reviewer to retrieve the review scorecard and allows an admin or reviewer to
     * submit the review scorecard for a project.
     *
     * @param data a ReviewData object with the populated user, submitter id and reviewer id
     *        if the scorecard is null then a request for the scorecard is performed
     *        if not, the passed scorecard is saved into the document manager
     *
     * @return a SuccessResult if the scorecard was saved successfully
     *         a ReviewScorecardRetrieval containing the requested scorecard
     *         a FailureResult object if the data object is not populated correctly or if the user does not have
     *         permissions or if the submitter id is invalid (does not have a submission)
     *         a FailureResult containing an exception in case one is thrown
     *         (Errors and RuntimeExceptions are propagated so they aren't included in this category)
     */
    public ResultData start(ActionData data) {
        log.debug("Starting request to model class ReviewProject ...");

        if (!(data instanceof ReviewData)) {
            // should never happen if front-end works properly
            return new FailureResult("Invalid ActionData object, expected ReviewData");
        }

        ReviewData reviewData = (ReviewData) data;

        SecurityEnabledUser user = reviewData.getUser();
        if (user == null) {
            // should never happen if front-end works properly
            return new FailureResult("Null user, you have to login first");
        }

        UserProjectInfo userProjectInfo = reviewData.getProject();
        if (userProjectInfo == null) {
            // should never happen if front-end works properly
            return new FailureResult("Null project");
        }

        try {
            // check permission
            //if (!PermissionHelper.isAdmin(user) && !PermissionHelper.hasReviewPermission(user, userProjectInfo)) {
            //    return new FailureResult("You cannot review for this project");
            //}

            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();
            DocumentManagerLocal documentManager = EJBHelper.getDocumentManager();
            Project project = projectTracker.getProject(userProjectInfo, user.getTCSubject());

            if (reviewData.getReviewScorecard() == null) {
                // get the ReviewScorecard for the front-end
                ReviewScorecard scorecard = documentManager.getReviewScorecard(
                        project, reviewData.getReviewerId(), reviewData.getSubmitterId(), user.getTCSubject());

                if (scorecard != null) {
                    return new ReviewScorecardRetrieval(scorecard);
                } else {
                    return new FailureResult("Cannot get the review scorecard for the specified submitter");
                }
            } else {
                // check permission
                if (!PermissionHelper.isAdmin(user) && !PermissionHelper.hasReviewPermission(user, userProjectInfo)) {
                    return new FailureResult("You cannot review for this project");
                }

                // check project phase
                if (!PhaseHelper.canReview(project)) {
                    return new FailureResult("You can review only during the review phase");
                }

                // compute score and save the ReviewScorecard
                ReviewScorecard scorecard = reviewData.getReviewScorecard();
                if (scorecard.isCompleted() && scorecard.getQuestions() != null) {
                    try {
                        scorecard.setScore(new ScoringHelper().calculateScore(scorecard).getWeightedScore());
                    } catch (ArithmeticException e) {
                        return new FailureResult("Error while calculating the score: ", e);
                    }
                }
                documentManager.saveReviewScorecard(scorecard, user.getTCSubject());
                return new SuccessResult();
            }

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

