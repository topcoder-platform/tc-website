/**
 * Copyright ?2004, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.DocumentManagerLocal;
import com.topcoder.apps.review.document.TestCase;
import com.topcoder.apps.review.projecttracker.*;
import com.topcoder.shared.util.logging.Logger;

import java.net.URL;

/**
 * This Model provides business logic through which users can download testcases.
 *
 * @author FatClimber
 * @version 1.0
 */
public class TestCasesDownload implements Model {

    static private Logger log = Logger.getLogger(TestCasesDownload.class);
    
    /**
     * Method for downloading the actual binary data of testcases. Available for admins, PMs and reviewers.
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
        log.debug("Starting request to model class TestCasesDownload ...");

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
                    return new FailureResult("You don't have permission to download testcases for this project");
                } else {
                    isJustSubmitter = true;
                }
            }

            // get project
            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();
            Project project = projectTracker.getProject(submissionDownloadData.getProject(), user.getTCSubject());

            // get the URL for the submission (it points to a local filename)
            DocumentManagerLocal documentManager = EJBHelper.getDocumentManager();
            URL testCasesURL = null;
            User reviewer = null;

            // find the submission with that id
            TestCase[] testCases =
                    documentManager.getTestCases(project, submissionDownloadData.getSubmissionId(), user.getTCSubject());
            if (testCases != null && testCases.length == 1) {
                testCasesURL = testCases[0].getURL();
                reviewer = testCases[0].getReviewer();
            }

            if (testCasesURL == null || reviewer == null) {
                return new FailureResult("Testcases cannot be found or you don't have permission to access it");
            }


            // build the filename that should be seen by the downloader (instead of the real local filename)
            long userRoleId = RoleHelper.getReviewerUserRoleId(reviewer, project.getParticipants());
            if (userRoleId == -1) {
                return new FailureResult("Cannot find the reviewer user role for the testcases");
            }
            String userFilename = "TestCases_" + userRoleId + "_"
                    + project.getName() + getExtension(testCasesURL.getFile());
            return new SubmissionDownloadRetrieval(userFilename, testCasesURL.openStream());

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

