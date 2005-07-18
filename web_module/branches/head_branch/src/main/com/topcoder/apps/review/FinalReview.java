/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.DocumentManagerLocal;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.ProjectTrackerLocal;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;

/**
 * This Model provides business logic through which users perform final reviews.
 *
 * @author adic
 * @version 1.0
 */
public class FinalReview implements Model {

    /**
     * Allows an admin or a reviewer to retrieve the final review document and allows an admin or final reviewer to
     * submit the final review for a project.
     *
     * @param data an FinalReviewData object with the populated user, project
     *        if the final review is null then a request for the final review is performed
     *        if notm the passed final review is saved into the document manager
     *
     * @return a SuccessResult if the final review was saved successfully
     *         a FinalReviewRetrieval containing the requested final review
     *         a FailureResult object if the data object is not populated correctly or if the user does not have
     *         permissions
     *         a FailureResult containing an exception in case one is thrown
     *         (Errors and RuntimeExceptions are propagated so they aren't included in this category)
     */
    public ResultData start(ActionData data) {
        LogHelper.logModel(this, data);

        if (!(data instanceof FinalReviewData)) {
            // should never happen if front-end works properly
            return new FailureResult("Invalid ActionData object, expected FinalReviewData");
        }

        FinalReviewData finalReviewData = (FinalReviewData) data;

        SecurityEnabledUser user = finalReviewData.getUser();
        if (user == null) {
            // should never happen if front-end works properly
            return new FailureResult("Null user, you have to login first");
        }

        UserProjectInfo userProjectInfo = finalReviewData.getProject();
        if (userProjectInfo == null) {
            // should never happen if front-end works properly
            return new FailureResult("Null project");
        }

        try {
            // check permission
            //if (!PermissionHelper.isAdmin(user) && !PermissionHelper.hasReviewPermission(user, userProjectInfo)) {
            //    return new FailureResult("You cannot see the final review for this project");
            //}

            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();
            DocumentManagerLocal documentManager = EJBHelper.getDocumentManager();
            Project project = projectTracker.getProject(userProjectInfo, user.getTCSubject());

            if (finalReviewData.getFinalReview() == null) {
                // get the FinalReview for the front-end
                com.topcoder.apps.review.document.FinalReview finalReview = null;
                if (finalReviewData.getRetrieveFull())
                    finalReview = documentManager.getFinalReview(project, true, user.getTCSubject());
                else
                    finalReview = documentManager.getFinalReview(project, false, user.getTCSubject());


                if (finalReview != null) {
                    return new FinalReviewRetrieval(finalReview);
                } else {
                    return new FailureResult("Cannot get the final review");
                }
            } else {
                // check permission
                if (!PermissionHelper.isAdmin(user) && !PermissionHelper.hasFinalReviewPermission(user, userProjectInfo)) {
                    return new FailureResult("You cannot perform final review for this project");
                }

                // check project phase
                if (!PhaseHelper.canFinalReview(project)) {
                    return new FailureResult("You can perform final review only during the final review phase");
                }

                // save the FinalReview
                documentManager.saveFinalReview(finalReviewData.getFinalReview(), user.getTCSubject());
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

