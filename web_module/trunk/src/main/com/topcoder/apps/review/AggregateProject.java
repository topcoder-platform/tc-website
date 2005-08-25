/**
 * Copyright ? 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.AggregationWorksheet;
import com.topcoder.apps.review.document.DocumentManagerLocal;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.ProjectTrackerLocal;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import com.topcoder.security.TCSubject;
import com.topcoder.shared.util.logging.Logger;

/**
 * This Model provides business logic through which users perform aggregation tasks.
 *
 * @author adic
 * @version 1.0
 */
public class AggregateProject implements Model {

    static private Logger log = Logger.getLogger(AggregateProject.class);
    
    /**
     * Allows an admin or a reviewer to retrieve the aggregation document and allows an admin or aggregator to submit
     * the aggregation for a project.
     *
     * @param data an AggregationData object with the populated user, project
     *        if the aggregation worksheet is null then a request for the aggregation worksheet is performed
     *        if not the passed aggregation worksheet is saved into the document manager
     *
     * @return a SuccessResult if the aggregation worksheet was saved successfully
     *         a AggregationWorksheetRetrieval containing the request aggregation worksheet
     *         a FailureResult object if the data object is not populated correctly or if the user does not have
     *         permissions
     *         a FailureResult containing an exception in case one is thrown
     *         (Errors and RuntimeExceptions are propagated so they aren't included in this category)
     */
    public ResultData start(ActionData data) {
        log.debug("Starting request to model class AggregateProject ...");

        if (!(data instanceof AggregationData)) {
            // should never happen if front-end works properly
            return new FailureResult("Invalid ActionData object, expected AggregationData");
        }

        AggregationData aggregationData = (AggregationData) data;

        SecurityEnabledUser user = null;
        UserProjectInfo userProjectInfo = null;
        if (aggregationData.getPublicAggId() == -1) {
            user = aggregationData.getUser();
            if (user == null) {
                // should never happen if front-end works properly
                return new FailureResult("Null user, you have to login first");
            }

            userProjectInfo = aggregationData.getProject();
            if (userProjectInfo == null) {
                // should never happen if front-end works properly
                return new FailureResult("Null project");
            }
        }

        try {
            // check permission
            //if (!PermissionHelper.isAdmin(user) && !PermissionHelper.hasReviewPermission(user, userProjectInfo)) {
            //    return new FailureResult("You cannot view/create aggregate for this project");
            //}

            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();
            DocumentManagerLocal documentManager = EJBHelper.getDocumentManager();
            Project project;
            if (aggregationData.getPublicAggId() == -1) {
                project = projectTracker.getProject(userProjectInfo, user.getTCSubject());
            } else {
                project = projectTracker.getProjectById(aggregationData.getPublicAggId(), new TCSubject(155846));
            }

            if (aggregationData.getAggregationWorksheet() == null) {
                // get the AggregationWorksheet for the front-end
                AggregationWorksheet worksheet;
                if (aggregationData.getPublicAggId() == -1) {
                    worksheet = documentManager.getAggregation(project, user.getTCSubject());
                } else {
                    // a userId -2 only retrieves accepted entries
                    worksheet = documentManager.getAggregation(project, new TCSubject(-2));
                }

                if (worksheet != null) {
                    return new AggregationWorksheetRetrieval(worksheet);
                } else {
                    return new FailureResult("Cannot get the aggregation worksheet");
                }
            } else {
                // check permission
                if (!PermissionHelper.isAdmin(user) && !PermissionHelper.hasAggregationPermission(user, userProjectInfo)) {
                    return new FailureResult("You cannot aggregate for this project");
                }

                // check project phase
                if (!PermissionHelper.isAdmin(user) && !PhaseHelper.canAggregate(project)) {
                    return new FailureResult("You can aggregate only during the aggregation phase");
                }

                // save the AggregationWorksheet
                documentManager.saveAggregation(aggregationData.getAggregationWorksheet(), user.getTCSubject());

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

