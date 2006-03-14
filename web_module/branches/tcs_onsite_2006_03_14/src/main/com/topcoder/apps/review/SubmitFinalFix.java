/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.DocumentManagerLocal;
import com.topcoder.apps.review.document.FinalFixSubmission;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.ProjectTrackerLocal;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import com.topcoder.util.format.FormatMethodFactory;
import com.topcoder.shared.util.logging.Logger;

import java.io.File;
import java.io.InputStream;
import java.util.Date;

/**
 * This Model provides business logic through which users submit final fixes.
 *
 * @author adic
 * @version 1.0
 */
public class SubmitFinalFix implements Model {

    private static Logger log = Logger.getLogger(SubmitFinalFix.class);
    
    /**
     * This method allows the winning submitter to make a new final fix submission.
     * The File submitted by the user is copied in the directory indicated in the business_logic_config.properties file
     * under the name Submitter_<submission_id>_yyyy-MM-dd-HH-mm-ss-SSS.<extension>.
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
        log.debug("Starting request to model class SubmitFinalFix ...");

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
            // check permission
            if (!PermissionHelper.isAdmin(user)
                    && !PermissionHelper.hasSubmitFinalFixPermission(user, userProjectInfo)) {
                return new FailureResult("You cannot submit final fixes for this project");
            }

            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();
            Project project = projectTracker.getProject(userProjectInfo, user.getTCSubject());

            // check project phase
            if (!PhaseHelper.canSubmitFinalFix(project)) {
                return new FailureResult("You can submit final fixes only during the final fix submission phase");
            }

            // get the user role id
            long userRoleId = RoleHelper.getSubmitterUserRoleId(user, userProjectInfo.getUserRoles());
            if (userRoleId == -1) {
                return new FailureResult("Cannot find submitter user role for this user");
            }

            DocumentManagerLocal documentManager = EJBHelper.getDocumentManager();

            // retrieve the final fix submission
            FinalFixSubmission submission =
                    documentManager.getFinalFixSubmission(project, user.getTCSubject());
            if (submission == null) {
                return new FailureResult("PL did not return a non-null final fix document as expected");
            }
            documentManager.saveFinalFixSubmission(submission, user.getTCSubject());

            // save file to disk under specified name
            //File sourceFile = solutionData.getFile();
            InputStream is = solutionData.getInputStream();
            String remoteName = solutionData.getFilename();
            //if (sourceFile.length() <= 0) {
            //    return new FailureResult("Invalid submission file, it seems to have no data");
            //}
            String destFilename = "Submitter_" + userRoleId + "_"
                    + FormatMethodFactory.getDefaultDateFormatMethod("yyyy-MM-dd-HH-mm-ss-SSS").format(new Date())
                    + SubmissionDownload.getExtension(remoteName);
            SubmitSolution.copy(is, ConfigHelper.getSubmissionPathPrefix() + destFilename);
            is.close();

            // save URL and save submission
            //submission.setURL(new URL(ConfigHelper.getSubmissionURLPrefix() + destFilename));
            submission.setURL(new File(ConfigHelper.getSubmissionPathPrefix() + destFilename).toURL());
            documentManager.saveFinalFixSubmission(submission, user.getTCSubject());
            return new SuccessResult();

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

