/**
 * Copyright © 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.transaction.UserTransaction;

import com.topcoder.apps.review.document.Appeal;
import com.topcoder.apps.review.document.DocumentManagerLocal;
import com.topcoder.apps.review.document.ReviewScorecard;
import com.topcoder.apps.review.projecttracker.Phase;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.ProjectTrackerLocal;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;

/**
 * This Model provides business logic through which users appeal projects.
 *
 * @author FatClimber
 * @version 1.0
 */
public class AppealProject implements Model {

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
        LogHelper.logModel(this, data);

        if (!(data instanceof AppealData)) {
            // should never happen if front-end works properly
            return new FailureResult("Invalid ActionData object, expected AppealData");
        }

        AppealData appealData = (AppealData) data;

        SecurityEnabledUser user = appealData.getUser();
        if (user == null) {
            // should never happen if front-end works properly
            return new FailureResult("Null user, you have to login first");
        }

        UserProjectInfo userProjectInfo = appealData.getProject();
        if (userProjectInfo == null) {
            // should never happen if front-end works properly
            return new FailureResult("Null project");
        }

        try {
            // check permission
            if (!PermissionHelper.isAdmin(user) &&
                    !PermissionHelper.hasReviewPermission(user, userProjectInfo) &&
                    !PermissionHelper.hasSubmitPermission(user, userProjectInfo)) {
                return new FailureResult("You cannot appeal for this project");
            }

            DocumentManagerLocal documentManager = EJBHelper.getDocumentManager();
            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();
            Project project = projectTracker.getProject(userProjectInfo, user.getTCSubject());

            if (appealData.getAppeals() == null) {
                // get the Appeals for the front-end
                Appeal[] appeals = documentManager.getAppeals(project,
                        appealData.getAppealerId(),
                        appealData.getQuestionId(),
                        user.getTCSubject());

                if (appeals != null) {
                    return new AppealsRetrieval(appeals);
                } else {
                    return new AppealsRetrieval(null);
                    //return new FailureResult("Cannot get the appeals");
                }
            } else {
                // Save the Appeal
                if (appealData.getAppeals().length != 1) {
                    return new FailureResult("Error saving appeal(no appeal to save)");
                }
                Appeal appeal = appealData.getAppeals()[0];

                // check permission
/*
// by cucu
                if (!PermissionHelper.isAdmin(user) &&
                        !PermissionHelper.hasReviewPermission(user, userProjectInfo) &&
                        !PermissionHelper.hasSubmitPermission(user, userProjectInfo)) {
                    return new FailureResult("You cannot save appeals for this project");
                }
*/

                // check project phase
/* by cucu
                if (project.getCurrentPhase().getId() != Phase.ID_APPEALS) {
*/

                // check permission
                if (user.getId() == appeal.getAppealer().getId()) {
                    if (project.getCurrentPhase().getId() != Phase.ID_APPEALS) {
                        return new FailureResult("You can appeal only during the appeal phase");
                    }
                } else if (user.getId() == appeal.getReviewer().getId() ) {
                    if (project.getCurrentPhase().getId() != Phase.ID_APPEALS_RESPONSE) {
                        return new FailureResult("You can reply appeals only during the appeal response phase");
                    }
                } else if (!PermissionHelper.isAdmin(user)) {
                    return new FailureResult("You cannot save appeals for this project");
                }


                if (appeal.getReviewer().getId() == user.getId() ||
                        PermissionHelper.isAdmin(user)) {
                    appeal.setResolved(true);
                }

                Context initial = new InitialContext();
                UserTransaction ut = (UserTransaction) initial.lookup("java:comp/UserTransaction");
                try {
                    ut.begin();

                    // Save appeal (and modified question)
                    documentManager.saveAppeal(appeal, project, user.getTCSubject());

                    // Mail changes to appealer/reviewer
                    if (appeal.isResolved()) {
                        // compute score and save the ReviewScorecard
                        ReviewScorecard scorecard = documentManager.getReviewScorecard(
                                project, appeal.getReviewer().getId(), appeal.getSubmitter().getId(), user.getTCSubject());
                        try {
                            scorecard.setScore(new ScoringHelper().calculateScore(scorecard).getWeightedScore());
                        } catch (ArithmeticException e) {
                            ut.rollback();
                            return new FailureResult("Error while calculating the score: ", e);
                        }
                        documentManager.saveReviewScorecard(scorecard, user.getTCSubject());
                        MailHelper.appealResolved(project, appeal);
                    } else {
                        MailHelper.appealCreated(project, appeal);
                    }
                    if (ut != null) {
                        ut.commit();
                    }
                } catch (Exception e) {
                    if (ut != null) {
                        ut.rollback();
                    }
                    throw e;
                }
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

