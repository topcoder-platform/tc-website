/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.DocumentManagerLocal;
import com.topcoder.apps.review.document.FinalFixSubmission;
import com.topcoder.apps.review.document.InitialSubmission;
import com.topcoder.apps.review.document.AbstractSubmission;
import com.topcoder.apps.review.projecttracker.*;
import com.topcoder.shared.util.logging.Logger;

import java.net.URL;

/**
 * This Model provides business logic through which users can download a submission.
 *
 * @author adic
 * @version 1.0
 */
public class SubmissionDownload implements Model {

    private static Logger log = Logger.getLogger(SubmissionDownload.class);
    
    /**
     * Method for downloading the actual binary data of a submission. Available for admins, PMs and reviewers.
     *
     * @param data a SubmissionDownloadData object with the populated user, project (user info project)
     *        and submission id
     *
     * @return a SubmissionDownloadRetrieval if the project was retrieved successfully containing the filename that
     *         the user should see (instead of the real local filename) and an input stream from where to read the
     submission data
     *         a FailureResult object if the data object is not populated correctly or if the user doesn't have
     *         project permission
     *         a FailureResult containing an exception in case one is thrown
     *         (Errors and RuntimeExceptions are propagated so they aren't included in this category)
     */
    public ResultData start(ActionData data) {
        log.debug("Starting request to model class SubmissionDownload ...");

        if (!(data instanceof SubmissionDownloadData)) {
            // should never happen if front-end works properly
            return new FailureResult("Invalid ActionData object, expected SubmissionDownloadData");
        }

        SubmissionDownloadData submissionDownloadData = (SubmissionDownloadData) data;

        SecurityEnabledUser user = submissionDownloadData.getUser();
        if (user == null) {
            // should never happen if front-end works properly
            return new FailureResult("Null user, you have to login first");
        }

        UserProjectInfo userProjectInfo = submissionDownloadData.getProject();
        if (userProjectInfo == null) {
            // should never happen if front-end works properly
            return new FailureResult("Null project");
        }

        try {
            // check permission: admin, PM or any type of reviewer
            boolean isJustSubmitter = false;
            if (!PermissionHelper.isAdmin(user) && !PermissionHelper.hasAnyReviewerPermission(user, userProjectInfo)
                    && !RoleHelper.isProductManager(user, userProjectInfo)) {
                if (!PermissionHelper.hasSubmitPermission(user, userProjectInfo)) {
                    return new FailureResult("You don't have permission to download submissions for this project");
                } else {
                    isJustSubmitter = true;
                }
            }

            // get project
            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();
            Project project = projectTracker.getProject(submissionDownloadData.getProject(), user.getTCSubject());

            // get the URL for the submission (it points to a local filename)
            DocumentManagerLocal documentManager = EJBHelper.getDocumentManager();
            URL submissionURL = null;
            User submitter = null;

            // ID > 0 means initial submission
            //////////////////////////////////////////////////////////////////////////////////////////////////////////
            // Added by WishingBone - Automated Screening
            if (submissionDownloadData.getVersionId() > 0) {
                AbstractSubmission submission =
                        documentManager.getSubmissionByVersion(project, submissionDownloadData.getVersionId(), user.getTCSubject());
                if (submission != null) {
                    submissionURL = submission.getURL();
                    submitter = submission.getSubmitter();
                }
            } else
            //////////////////////////////////////////////////////////////////////////////////////////////////////////
            if (submissionDownloadData.getSubmissionId() > 0) {
                // find the submission with that id
                InitialSubmission initialSubmission =
                        documentManager.getInitialSubmission(project, submissionDownloadData.getSubmissionId(), user.getTCSubject());
                if (initialSubmission != null) {
                    submissionURL = initialSubmission.getURL();
                    submitter = initialSubmission.getSubmitter();
                }
                // ID <= 0 means final fix submission
            } else {
                FinalFixSubmission submission = documentManager.getFinalFixSubmission(project, user.getTCSubject());
                if (submission != null) {
                    submissionURL = submission.getURL();
                    submitter = submission.getSubmitter();
                }
            }

            if (submissionURL == null || submitter == null) {
                return new FailureResult("Submission cannot be found or you don't have permission to access it");
            }

            if (isJustSubmitter && (submitter.getId() != user.getId() &&
                    submissionDownloadData.getProject().getCurrentPhaseInstance().getPhase().getId() != Phase.ID_APPEALS)) {
                return new FailureResult("A submitter can download only his/her submission");
            }

            // build the filename that should be seen by the downloader (instead of the real local filename)
            //LogHelper.log("the user is " + user.getHandle() + ", the submitter is " + submitter.getHandle());
            //LogHelper.log("userProjectInfo role count " + userProjectInfo.getUserRoles().length + ", proj role count " + project.getParticipants().length);
            long userRoleId = RoleHelper.getSubmitterUserRoleId(submitter, project.getParticipants());
            if (userRoleId == -1) {
                return new FailureResult("Cannot find the submitter user role for the submitter");
            }
            String userFilename = "Submitter_" + userRoleId + "_"
                    + project.getName() + getExtension(submissionURL.getFile());
            //LogHelper.log("URL.toString() is " + submissionURL.toString());
            //LogHelper.log("URL.getFile() is " + submissionURL.getFile());
            return new SubmissionDownloadRetrieval(userFilename, submissionURL.openStream());

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

    /**
     * Returns the extension part of a filename (including .) or "" if there is no extension.
     *
     * @param s the filename
     *
     * @return the extension
     */
    static String getExtension(String s) {
        int pos = s.lastIndexOf('.');
        return pos >= 0 ? s.substring(pos) : "";
    }

}

