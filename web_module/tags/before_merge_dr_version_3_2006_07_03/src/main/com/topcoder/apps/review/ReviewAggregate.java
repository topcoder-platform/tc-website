/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.AggregationReview;
import com.topcoder.apps.review.document.AggregationWorksheet;
import com.topcoder.apps.review.document.DocumentManagerLocal;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.ProjectTrackerLocal;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import com.topcoder.shared.util.logging.Logger;

/**
 * This Model provides business logic through which reviewers review the aggregation.
 *
 * @author adic
 * @version 1.0
 */
public class ReviewAggregate implements Model {

    private static Logger log = Logger.getLogger(ReviewAggregate.class);
    
    /**
     * Allows an admin or a reviewer to retrieve an aggregation review document and allows an admin or aggregator
     * to submit the aggregation review document for a project.
     *
     * @param data an AggregationReviewData object with the populated user, project
     *        if the aggregation review is null then a request for a new aggregation review is performed
     *        if not the passed aggregation review is saved into the document manager
     *
     * @return a SuccessResult if the aggregation review was saved successfully
     *         a AggregationReviewRetrieval containing the request aggregation review
     *         a FailureResult object if the data object is not populated correctly or if the user does not have
     *         permissions
     *         a FailureResult containing an exception in case one is thrown
     *         (Errors and RuntimeExceptions are propagated so they aren't included in this category)
     */
    public ResultData start(ActionData data) {
        log.debug("Starting request to model class ReviewAggregate ...");

        if (!(data instanceof AggregationReviewData)) {
            // should never happen if front-end works properly
            return new FailureResult("Invalid ActionData object, expected AggregationReviewData");
        }

        AggregationReviewData aggregationReviewData = (AggregationReviewData) data;

        SecurityEnabledUser user = aggregationReviewData.getUser();
        if (user == null) {
            // should never happen if front-end works properly
            return new FailureResult("Null user, you have to login first");
        }

        UserProjectInfo userProjectInfo = aggregationReviewData.getProject();
        if (userProjectInfo == null) {
            // should never happen if front-end works properly
            return new FailureResult("Null project");
        }

        try {
            // check permission
            if (!PermissionHelper.isAdmin(user) && !PermissionHelper.hasReviewPermission(user, userProjectInfo)
                    && !RoleHelper.isProductManager(user, userProjectInfo)) {
                return new FailureResult("You cannot review aggregate for this project");
            }

            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();
            DocumentManagerLocal documentManager = EJBHelper.getDocumentManager();
            Project project = projectTracker.getProject(userProjectInfo, user.getTCSubject());

            if (aggregationReviewData.getAggregationReview() == null) {
                // get the AggregationWorksheet for the front-end
                AggregationReview[] aggReviews = documentManager.getAggregationReview(project, user.getTCSubject());
                return new AggregationReviewRetrieval(aggReviews);
            } else {
                // check permission (only normal reviewers (excludes aggregator) can review the aggregation document)
                if (!PermissionHelper.isAdmin(user) && (!PermissionHelper.hasReviewPermission(user, userProjectInfo)
                        || PermissionHelper.hasAggregationPermission(user, userProjectInfo))) {
                    return new FailureResult("You cannot review aggregate for this project");
                }

                // check project phase
                if (!PhaseHelper.canReviewAggregate(project)) {
                    return new FailureResult("You can review aggregate only during the aggregation review phase");
                }

                // check if the aggregation is completed
                AggregationReview rev = aggregationReviewData.getAggregationReview();
                AggregationWorksheet aggr = rev.getAggregationWorksheet();
                if (!aggr.isCompleted()) {
                    return new FailureResult("You can't review the aggregation because it is not completed yet");
                }

                // save the AggregationReview
                documentManager.saveAggregationReview(rev, user.getTCSubject());

                // reset aggregation to non-completed if it is not approved
                //if (rev.getStatus().getId() != AggregationApproval.ID_APPROVED) {
                //    aggr.setCompleted(false);
                //    documentManager.saveAggregation(aggr, user.getTCSubject());
                //}
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

