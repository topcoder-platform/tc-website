/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.DocumentManagerLocal;
import com.topcoder.apps.review.document.InitialSubmission;
import com.topcoder.apps.review.persistence.Common;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.ProjectTrackerLocal;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import com.topcoder.util.format.FormatMethodFactory;

import com.topcoder.apps.screening.ProjectType;
import com.topcoder.apps.screening.ScreeningTool;
import com.topcoder.apps.screening.QueryInterface;
import com.topcoder.apps.screening.ScreeningResponse;
import com.topcoder.apps.screening.ScreeningJob;
import com.topcoder.apps.screening.ScreeningRequest;
import com.topcoder.shared.util.logging.Logger;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.util.List;
import java.util.ArrayList;
import java.util.Date;

/**
 * This Model provides business logic through which users submit solution files.
 *
 * @author adic
 * @version 1.0
 */
public class SubmitSolution implements Model {

    /**
     * The buffer size for file copy.
     */
    public static final int BUFSIZE = 16384;

    private static Logger log = Logger.getLogger(SubmitSolution.class);
    
    /**
     * This method allows the submitter to make a new submission.
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
        log.debug("Starting request to model class SubmitSolution ...");

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
            if (!PermissionHelper.isAdmin(user) && !PermissionHelper.hasSubmitPermission(user, userProjectInfo)) {
                return new FailureResult("You cannot submit for this project");
            }

            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();
            Project project = projectTracker.getProject(userProjectInfo, user.getTCSubject());

            // check project phase, it has to be in the submission phase
            if (!PhaseHelper.canSubmit(project)) {
                return new FailureResult("You can submit only during the submission phase");
            }

            // get the user role id
            long userRoleId = RoleHelper.getSubmitterUserRoleId(user, userProjectInfo.getUserRoles());
            if (userRoleId == -1) {
                return new FailureResult("Cannot find submitter user role for this user");
            }

            DocumentManagerLocal documentManager = EJBHelper.getDocumentManager();

            // retrieve the initial submission
            InitialSubmission[] initialSubmissions =
                    documentManager.getInitialSubmissions(project, false, user.getTCSubject());
            if (initialSubmissions == null || initialSubmissions.length != 1
                    || !initialSubmissions[0].getSubmitter().equals(user)) {
                return new FailureResult("PL did not return exactly one submission document as expected");
            }

            // save file to disk under specified name
            //File sourceFile = solutionData.getFile();
            InputStream is = solutionData.getInputStream();
            String remoteName = solutionData.getFilename();
//            if (sourceFile.length() <= 0) {
//                return new FailureResult("Invalid submission file, it seems to have no data");
//            }
            String destFilename = "Submitter_" + userRoleId + "_"
                    + FormatMethodFactory.getDefaultDateFormatMethod("yyyy-MM-dd-HH-mm-ss-SSS").format(new Date())
                    + SubmissionDownload.getExtension(remoteName);
            copy(is, ConfigHelper.getSubmissionPathPrefix() + destFilename);
            is.close();

            //initialSubmissions[0].setURL(new URL(ConfigHelper.getSubmissionURLPrefix() + destFilename));
            initialSubmissions[0].setURL(new File(ConfigHelper.getSubmissionPathPrefix() + destFilename).toURL());
            documentManager.saveInitialSubmission(initialSubmissions[0], user.getTCSubject());

            //////////////////////////////////////////////////////////////////////////////////////////////////////////
            // Added by WishingBone - Automated Screening
            long typeId = solutionData.getProject().getProjectType().getId();
            String catalog = solutionData.getProject().getCatalog();
            ProjectType type = null;
            if ("Java".equals(catalog) || "Java Custom".equals(catalog)) {
                if (typeId == 1) {
                    type = ProjectType.JAVA_DESIGN;
                } else if (typeId == 2) {
                    type = ProjectType.JAVA_DEV;
                }
            } else if (".NET".equals(catalog) || ".NET Custom".equals(catalog)) {
                if (typeId == 1) {
                    type = ProjectType.CSHARP_DESIGN;
                } else if (typeId == 2) {
                    type = ProjectType.CSHARP_DEV;
                }
            }
            if (type != null) {
                Connection conn = null;
                long versionId;
                
                try {
                    conn = Common.getDataSource().getConnection();
                
                    versionId = ScreeningJob.getVersionId(initialSubmissions[0].getId(), conn);
                    ScreeningJob.placeRequest(new ScreeningRequest(0,
                            versionId,
                            ConfigHelper.getSubmissionPathPrefix() + destFilename,
                            type),
                            conn);
                } finally {    
                    try {
                        conn.close();
                    } catch (Exception e) {
                        // ignore
                    }
                }
                
                return new ScreeningRetrieval(versionId);
            } else {
                return new ScreeningRetrieval(new ScreeningResponse[0], new ScreeningResponse[0]);
            }
            //////////////////////////////////////////////////////////////////////////////////////////////////////////

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
        //FileInputStream fis = new FileInputStream(source);
        FileOutputStream fos = new FileOutputStream(dest);
        byte[] buf = new byte[BUFSIZE];
        int read = 0;
        while ((read = source.read(buf)) != -1) {
            fos.write(buf, 0, read);
        }
        fos.close();
        //fis.close();
        //if (EJBHelper.isTestMode()) {
        //    dest.delete();
        //}
    }

}

