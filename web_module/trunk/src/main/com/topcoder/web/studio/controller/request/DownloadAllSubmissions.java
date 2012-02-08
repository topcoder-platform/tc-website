/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.DAOFactory;
import com.topcoder.web.studio.dao.DAOUtil;
import com.topcoder.web.studio.dao.SubmissionDAO;
import com.topcoder.web.studio.dao.UploadDAO;
import com.topcoder.web.studio.dto.Project;
import com.topcoder.web.studio.dto.ResourceRole;
import com.topcoder.web.studio.dto.Submission;
import com.topcoder.web.studio.dto.Upload;
import com.topcoder.web.studio.util.Util;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

/**
 * <p>A controller to be used for servicing requests for downloading all submissions for specified round of single 
 * request.</p>
 * 
 * @author isv
 * @version 1.0 (Module Assembly - TopCoder Studio and Cockpit Download All Submissions Feature)
 */
public class DownloadAllSubmissions extends BaseSubmissionDataProcessor {

    /**
     * <p>A <code>Logger</code> to be used for logging the events.</p>
     */
    private static final Logger log = Logger.getLogger(DownloadAllSubmissions.class);

    /**
     * <p>An <code>int</code> array listing the IDs for screener roles.</p>
     */
    private static final int[] SCREENER_ROLES_IDS = {ResourceRole.SCREENER_RESOURCE_ROLE_ID,
                                                     ResourceRole.MILESTONE_SCREENER_RESOURCE_ROLE_ID
    };

    /**
     * <p>An <code>int</code> array listing the IDs for manager roles.</p>
     */
    private static final int[] MANAGER_ROLES_IDS = {ResourceRole.MANAGER_RESOURCE_ROLE_ID,
                                                    ResourceRole.COPILOT_RESOURCE_ROLE_ID,
                                                    ResourceRole.CLIENT_MANAGER_RESOURCE_ROLE_ID,
                                                    ResourceRole.OBSERVER_RESOURCE_ROLE_ID,
    };

    /**
     * <p>Constructs new <code>DownloadAllSubmissions</code> instance. This implementation does nothing.</p>
     */
    public DownloadAllSubmissions() {
    }

    /**
     * <p>Handles the incoming request.</p>
     * 
     * @throws Exception if an unexpected error occurs.
     */
    @Override
    protected void dbProcessing() throws Exception {
        TCRequest request = getRequest();
        Long currentUserId = getUser().getId();

        // Contest ID
        Integer contestId;
        try {
            contestId = new Integer(request.getParameter(Constants.CONTEST_ID));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid Contest Specified");
        }
        
        // Round and submission types
        String roundType = request.getParameter("round");
        boolean milestoneSubmissionsRequested = roundType.equalsIgnoreCase("milestone");
        int submissionTypeId;
        if (milestoneSubmissionsRequested) {
            submissionTypeId = Submission.MILESTONE_SUBMISSION;
        } else {
            submissionTypeId = Submission.CONTEST_SUBMISSION;
        }
        
        // Download type
        String downloadType = request.getParameter("type");
        boolean originalFilesRequested = "original".equalsIgnoreCase(downloadType);
        if (milestoneSubmissionsRequested) {
            originalFilesRequested = false;
        }

        // Contest data
        DAOFactory factory = DAOUtil.getFactory();
        SubmissionDAO submissionDAO = factory.getSubmissionDAO();
        UploadDAO uploadDAO = factory.getUploadDAO();
        UserDAO userDAO = factory.getUserDAO();
        Project contest = factory.getProjectDAO().find(contestId);

        // Uploads and submissions
        List<Upload> uploads = uploadDAO.getUploads(contest);
        List<Submission> submissions
            = submissionDAO.getSubmissions(uploads, submissionTypeId, Submission.STATUS_ACTIVE);
        boolean originalSubmissionsAvailable = false;
        if (submissions != null && !submissions.isEmpty()) {
            for (Submission submission : submissions) {
                if (submission.getPrize() != null) {
                    originalSubmissionsAvailable = true;
                    break;
                }
            }
        }

        // Context for the requested contest
        boolean isScreeningOver = contest.getScreeningClosed();
        boolean isReviewOver = contest.getReviewClosed();
        boolean isScreener = Util.checkUserHasRole(contest, SCREENER_ROLES_IDS, currentUserId);
        boolean isInManagerORRoles = Util.checkUserHasRole(contest, MANAGER_ROLES_IDS, currentUserId);
        boolean isAdmin = Util.isAdmin(getUser().getId());
        boolean hasCockpitPermissions = Util.hasCockpitPermissions(getUser().getId(), contest.getId());
        boolean canDownload = false;
        if (isAdmin || isScreener) {
            canDownload = true;
        } else if (hasCockpitPermissions || isInManagerORRoles) {
            if (originalFilesRequested && originalSubmissionsAvailable && isReviewOver) {
                canDownload = true;
            }
            if (!originalFilesRequested) {
                canDownload = true;
            }
        } else if (isScreeningOver && contest.getViewableSubmissions() && !originalFilesRequested) {
            canDownload = true;
        }
        log.debug("All submissions download context : contestId = " + contestId + ", userId = " + currentUserId + ", "
                  + "originalSubmissionsAvailable = " + originalSubmissionsAvailable
                  + ", isScreeningOver = " + isScreeningOver + ", isScreener = " + isScreener
                  + ", isReviewOver = " + isReviewOver
                  + ", isInManagerORRoles = " + isInManagerORRoles + ", isAdmin = " + isAdmin
                  + ", hasCockpitPermissions = " + hasCockpitPermissions + ", viewableSubmissions = "
                  + contest.getViewableSubmissions() + ", originalFilesRequested = " + originalFilesRequested
                  + ". Can user " + currentUserId + " download all submissions for contest " + contestId + " = "
                  + canDownload);

        // Generate ALL submissions archive if allowed
        if (canDownload) {
            if (submissions != null && !submissions.isEmpty()) {
                TCResponse response = getResponse();
                response.setHeader("Cache-Control", "");
                response.setContentType("application/zip");
                response.addHeader("content-disposition", 
                                   "inline; filename=\"all_" + roundType + "_submissions_" + contestId +".zip\"");
    
                ServletOutputStream sos = response.getOutputStream();
                ZipOutputStream zos = new ZipOutputStream(sos);
    
                try {
                    for (Submission submission : submissions) {
                        File submissionsDir 
                            = new File(Util.createSubmissionPath(contest, userDAO.find(submission.getSubmitterId())));
                        File submissionFile;
                        if (originalFilesRequested) {
                            submissionFile = new File(submissionsDir, submission.getUpload().getParameter());
                        } else {
                            submissionFile = new File(submissionsDir, submission.getId() + "_preview.zip");
                        }
                        
                        if (submissionFile.exists()) {
                            if (originalFilesRequested ) {
                                // When downloading original files - include only paid submissions
                                if (submission.getPrize() != null) {
                                    log.debug("Including sources for submission " + submission.getId());
                                    processOriginalArchive(zos, submission, submissionFile);
                                }
                            } else {
                                log.debug("Including preview for submission " + submission.getId());
                                processPreviewArchive(zos, submission, submissionFile);
                            }
                        } else {
                            log.warn("The submission file is not found: " + submissionFile.getAbsolutePath());
                        }
                    }
                } finally {
                    zos.finish();
                }
    
                response.setStatus(HttpServletResponse.SC_OK);
                response.flushBuffer();
            }
        } else {
            throw new NavigationException("Sorry, you can not download submissions for this contest.");
        }
    }

    /**
     * <p>Unpacks the content of specified submission preview file and outputs it into specified ZIP stream.</p>
     * 
     * @param zos a <code>ZipOutputStream</code> to output the submission content to. 
     * @param submission a <code>Submission</code> providing submission data. 
     * @param submissionFile a <code>File</code> providing submission content. 
     * @throws IOException if an unexpected error occurs.
     */
    private void processPreviewArchive(ZipOutputStream zos, Submission submission, File submissionFile) 
        throws IOException {
        
        byte[] buffer = new byte[8192];
        int read;
        
        ZipInputStream zis 
            = new ZipInputStream(new BufferedInputStream(new FileInputStream(submissionFile)));
        try {
            ZipEntry inputEntry = zis.getNextEntry();
            while (inputEntry != null) {
                if (!inputEntry.isDirectory()) {
                    ZipEntry outputEntry 
                        = new ZipEntry(submission.getId() + File.separator + inputEntry.getName());
                    zos.putNextEntry(outputEntry);
                    while ((read = zis.read(buffer)) != -1) {
                        zos.write(buffer, 0, read);
                    }
                    zos.closeEntry();
                }
                inputEntry = zis.getNextEntry();
            }
        } finally {
            zis.close();
        }
    }

    /**
     * <p>Unpacks the content of specified submission original file and outputs it into specified ZIP stream.</p>
     *
     * @param outputZip a <code>ZipOutputStream</code> to output the submission content to. 
     * @param submission a <code>Submission</code> providing submission data. 
     * @param submissionFile a <code>File</code> providing submission content. 
     * @throws IOException if an unexpected error occurs.
     */
    private void processOriginalArchive(ZipOutputStream outputZip, Submission submission, File submissionFile)
        throws IOException {
        byte[] buffer = new byte[8192];
        int read;

        ZipInputStream inputZip
            = new ZipInputStream(new BufferedInputStream(new FileInputStream(submissionFile)));
        try {
            ZipEntry inputEntry = inputZip.getNextEntry();
            while (inputEntry != null) {
                if (!inputEntry.isDirectory()) {
                    if (inputEntry.getName().toLowerCase().endsWith(".zip")) {
                        // Nested archive found - unpack it's content and include into output
                        processNestedArchive(outputZip, submission, inputEntry, inputZip);
                    } else {
                        // Just a simple file
                        ZipEntry outputEntry = new ZipEntry(submission.getId() + File.separator + inputEntry.getName());
                        outputZip.putNextEntry(outputEntry);
                        while ((read = inputZip.read(buffer)) != -1) {
                            outputZip.write(buffer, 0, read);
                        }
                        outputZip.closeEntry();
                    }
                }
                inputEntry = inputZip.getNextEntry();
            }
        } finally {
            inputZip.close();
        }
    }

    /**
     * <p>Unpacks the content of specified submission preview file and outputs it into specified ZIP stream.</p>
     *
     * @param outputZip       a <code>ZipOutputStream</code> to output the submission content to.
     * @param submission      a <code>Submission</code> providing submission data.
     * @param currentZipEntry a <code>ZipEntry</code> providing the ZIP entry corresponding to nested archive itself.
     * @param inputZip        a <code>ZipInputStream</code> providing the content of nested archive.   
     * @throws IOException if an unexpected error occurs.
     */
    private void processNestedArchive(ZipOutputStream outputZip, Submission submission, ZipEntry currentZipEntry, 
                                      ZipInputStream inputZip)
        throws IOException {
        byte[] buffer = new byte[8192];
        int read;
        
        // Convert nested archive name into name for directory (stripping off .zip extension) 
        String nestedArchiveName = currentZipEntry.getName();
        int nameStart = nestedArchiveName.lastIndexOf(File.separatorChar) + 1;
        int nameEnd = nestedArchiveName.lastIndexOf('.');
        String nestedArchiveDirName = nestedArchiveName.substring(nameStart, nameEnd);

        // Unpack nested archive content and write it to output ZIP
        ZipInputStream nestedInputZip = new ZipInputStream(new BufferedInputStream(inputZip));
        ZipEntry nestedInputEntry = nestedInputZip.getNextEntry();
        while (nestedInputEntry != null) {
            if (!nestedInputEntry.isDirectory()) {
                ZipEntry outputEntry
                    = new ZipEntry(submission.getId() + File.separator + nestedArchiveDirName + File.separator
                                   + nestedInputEntry.getName());
                outputZip.putNextEntry(outputEntry);
                while ((read = nestedInputZip.read(buffer)) != -1) {
                    outputZip.write(buffer, 0, read);
                }
                outputZip.closeEntry();
            }
            nestedInputEntry = nestedInputZip.getNextEntry();
        }
    }
}
