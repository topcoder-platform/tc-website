/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.DocumentManagerLocal;
import com.topcoder.apps.review.document.TestCase;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.ProjectTrackerLocal;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import com.topcoder.util.format.FormatMethodFactory;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;

/**
 * This Model provides business logic through which users submit testcases files.
 *
 * @author FatClimber
 * @version 1.0
 */
public class SubmitTestCases implements Model {

    /**
     * The buffer size for file copy.
     */
    public static final int BUFSIZE = 16384;

    /**
     * This method allows the submitter to make a new submission.
     * The File submitted by the reviewer is copied in the directory indicated in the business_logic_config.properties file
     * under the name Reviewer_<reviewer_userrole_id>_yyyy-MM-dd-HH-mm-ss-SSS.<extension>.
     *
     * @param data a SolutionData object with the populated user and File object (pointing to the submission).
     *
     * @return a SuccessResult if the save request was succesful
     *         a FailureResult object if the data object is not populated correctly or is the user does not have submit,
     *         permissions
     *         a FailureResult containing an exception in case one is thrown
     *         (Errors and RuntimeExceptions are propagated so they aren't included in this category)
     */
    public ResultData start(ActionData data) {
        LogHelper.logModel(this, data);

        if (!(data instanceof SolutionData)) {
            // should never happen if front-end works properly
            return new FailureResult("Invalid ActionData object, expected SolutionData");
        }

        SolutionData solutionData = (SolutionData) data;

        SecurityEnabledUser user = solutionData.getUser();
        if (user == null) {
            // should never happen if front-end works properly
            return new FailureResult("Null user, you have to login first");
        }

        UserProjectInfo userProjectInfo = solutionData.getProject();
        if (userProjectInfo == null) {
            // should never happen if front-end works properly
            return new FailureResult("Null project");
        }

        try {
            // check permission, you have to have submission permission
            if (!PermissionHelper.isAdmin(user) && !PermissionHelper.hasReviewPermission(user, userProjectInfo)) {
                return new FailureResult("You cannot upload testcases for this project");
            }

            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();
            Project project = projectTracker.getProject(userProjectInfo, user.getTCSubject());

            // check project phase, it has to be in the review phase
            if (!PhaseHelper.canReview(project)) {
                return new FailureResult("You can upload testcases only during the review phase");
            }

            // get the user role id
            long userRoleId = RoleHelper.getReviewerUserRoleId(user, userProjectInfo.getUserRoles());
            if (userRoleId == -1) {
                return new FailureResult("Cannot find reviewer user role for this user");
            }

            DocumentManagerLocal documentManager = EJBHelper.getDocumentManager();

            // retrieve the testcases-object
            TestCase[] testcases = documentManager.getTestCases(project, user.getId(), user.getTCSubject());
            if (testcases == null || testcases.length != 1
                    || !testcases[0].getReviewer().equals(user)) {
                return new FailureResult("PL did not return exactly one testcases document as expected");
            }

            // save file to disk under specified name
            InputStream is = solutionData.getInputStream();
            String remoteName = solutionData.getFilename();
            String destFilename = "TestCases_" + userRoleId + "_"
                    + FormatMethodFactory.getDefaultDateFormatMethod("yyyy-MM-dd-HH-mm-ss-SSS").format(new Date())
                    + SubmissionDownload.getExtension(remoteName);
            copy(is, ConfigHelper.getSubmissionPathPrefix() + destFilename);
            is.close();

            testcases[0].setURL(new File(ConfigHelper.getSubmissionPathPrefix() + destFilename).toURL());
            documentManager.saveTestCase(testcases[0], user.getTCSubject());
            return new SuccessResult();

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

    /**
     * Utility method to copy a file under a new name.
     *
     * @param source the source inputstream
     * @param destname the destination filename
     *
     * @throws IOException if an I/O error occurs
     */
    static void copy(InputStream source, String destname) throws IOException {
        File dest = new File(destname);
        if (EJBHelper.isTestMode()) {
            dest.deleteOnExit();
        }
        FileOutputStream fos = new FileOutputStream(dest);
        byte[] buf = new byte[BUFSIZE];
        int read = 0;
        while ((read = source.read(buf)) != -1) {
            fos.write(buf, 0, read);
        }
        fos.close();
    }

}

