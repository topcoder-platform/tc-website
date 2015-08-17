/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.DocumentManagerLocal;
import com.topcoder.apps.review.document.FinalFixSubmission;
import com.topcoder.apps.review.document.InitialSubmission;
import com.topcoder.apps.review.document.AbstractSubmission;
import com.topcoder.apps.review.persistence.Common;
import com.topcoder.apps.review.projecttracker.*;

import com.topcoder.apps.screening.ScreeningTool;
import com.topcoder.apps.screening.QueryInterface;
import com.topcoder.apps.screening.ScreeningResponse;

import com.topcoder.shared.util.logging.Logger;

import java.sql.Connection;
import java.util.List;
import java.util.ArrayList;

/**
 * This Model provides business logic through which users can read screening responses.
 *
 * @author WishingBone
 * @version 1.0
 */
public class ShowScreening implements Model {

    private static Logger log = Logger.getLogger(ShowScreening.class);
    
    /**
     * Method for retrieving the screening responses.
     *
     * @param data a SubmissionDownloadData object with the populated user, project (user info project)
     *        and submission id
     *
     * @return a ScreeningRetrieval if the project was retrieved successfully containing responses
     *         a FailureResult object if the data object is not populated correctly or if the user doesn't have
     *         project permission
     *         a FailureResult containing an exception in case one is thrown
     *         (Errors and RuntimeExceptions are propagated so they aren't included in this category)
     */
    public ResultData start(ActionData data) {
        log.debug("Starting request to model class ShowScreening ...");

        if (!(data instanceof SubmissionDownloadData)) {
            return new FailureResult("Invalid ActionData object, expected SubmissionDownloadData");
        }

        SubmissionDownloadData submissionDownloadData = (SubmissionDownloadData) data;

        SecurityEnabledUser user = submissionDownloadData.getUser();
        if (user == null) {
            return new FailureResult("Null user, you have to login first");
        }

        UserProjectInfo userProjectInfo = submissionDownloadData.getProject();
        if (userProjectInfo == null) {
            return new FailureResult("Null project");
        }

        try {
            boolean isJustSubmitter = false;
            if (!PermissionHelper.isAdmin(user) && !PermissionHelper.hasAnyReviewerPermission(user, userProjectInfo)
                    && !RoleHelper.isProductManager(user, userProjectInfo)) {
                if (!PermissionHelper.hasSubmitPermission(user, userProjectInfo)) {
                    return new FailureResult("You don't have permission to read screening responses for this project");
                } else {
                    isJustSubmitter = true;
                }
            }

            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();
            Project project = projectTracker.getProject(submissionDownloadData.getProject(), user.getTCSubject());

            DocumentManagerLocal documentManager = EJBHelper.getDocumentManager();
            User submitter = null;
            ScreeningResponse[] responses = null;
            QueryInterface query = ScreeningTool.createQuery();

            Connection conn = null;
            try {
                conn = Common.getDataSource().getConnection();
                
                if (submissionDownloadData.getVersionId() > 0) {
                    AbstractSubmission submission =
                            documentManager.getSubmissionByVersion(project, submissionDownloadData.getVersionId(), user.getTCSubject());
                    if (submission != null) {
                        submitter = submission.getSubmitter();
                        responses = query.getSubmissionDetails(submissionDownloadData.getVersionId(), conn);
                    }
                } else if (submissionDownloadData.getSubmissionId() > 0) {
                    InitialSubmission initialSubmission =
                            documentManager.getInitialSubmission(project, submissionDownloadData.getSubmissionId(), user.getTCSubject());
                    if (initialSubmission != null) {
                        submitter = initialSubmission.getSubmitter();
                        responses = query.getCurrentSubmissionDetails(submissionDownloadData.getSubmissionId(), conn);
                    }
                }
            } finally {
                try {
                    conn.close();
                } catch (Exception e) {
                    // ignore
                }
            }

            if (responses == null || submitter == null) {
                return new FailureResult("Screening responses cannot be found or you don't have permission to access it");
            }

            if (isJustSubmitter && (submitter.getId() != user.getId() &&
                    submissionDownloadData.getProject().getCurrentPhaseInstance().getPhase().getId() != Phase.ID_APPEALS)) {
                return new FailureResult("A submitter can view only his/her screening responses");
            }

            // build the filename that should be seen by the downloader (instead of the real local filename)
            //LogHelper.log("the user is " + user.getHandle() + ", the submitter is " + submitter.getHandle());
            //LogHelper.log("userProjectInfo role count " + userProjectInfo.getUserRoles().length + ", proj role count " + project.getParticipants().length);
            long userRoleId = RoleHelper.getSubmitterUserRoleId(submitter, project.getParticipants());
            if (userRoleId == -1) {
                return new FailureResult("Cannot find the submitter user role for the submitter");
            }

            if (responses.length == 0) {
                return new ScreeningRetrieval(submissionDownloadData.getVersionId());
            }

            List warnings = new ArrayList();
            List fatalErrors = new ArrayList();
            for (int i = 0; i < responses.length; ++i) {
                if ("Warning".equals(responses[i].getSeverity())) {
                    warnings.add(responses[i]);
                } else if ("Fatal Error".equals(responses[i].getSeverity())) {
                    fatalErrors.add(responses[i]);
                }
            }
            return new ScreeningRetrieval(
                    (ScreeningResponse[]) warnings.toArray(new ScreeningResponse[warnings.size()]),
                    (ScreeningResponse[]) fatalErrors.toArray(new ScreeningResponse[fatalErrors.size()]));

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
