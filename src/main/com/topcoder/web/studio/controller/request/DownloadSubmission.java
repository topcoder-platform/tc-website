/*
 * Copyright (C) 2001 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.MessageFormat;
import java.util.Date;
import java.util.Set;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Hibernate;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.model.Image;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.DAOUtil;
import com.topcoder.web.studio.dto.FileType;
import com.topcoder.web.studio.dto.MimeType;
import com.topcoder.web.studio.dto.Project;
import com.topcoder.web.studio.dto.Resource;
import com.topcoder.web.studio.dto.ResourceRole;
import com.topcoder.web.studio.dto.Submission;
import com.topcoder.web.studio.dto.SubmissionImage;
import com.topcoder.web.studio.util.SubmissionPresentationFilter;
import com.topcoder.web.studio.util.Util;
import com.topcoder.web.studio.validation.UnifiedSubmissionValidator;

/**
 * <p>This class will process a submission download request.</p>
 *
 * <p>
 *   Version 1.1 (BUGR-2890) Change notes:
 *   <ol>
 *     <li>
 *         Users with cockpit permissions can download.
 *     </li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.3 (Re-platforming Studio Release 3 Assembly) Change notes:
 *   <ol>
 *     <li>Updated the logic to use contests hosted in <code>tcs_catalog</code> database instead of
 *     <code>studio_oltp</code> database.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.4 (Replatforming Studio Release 5) change notes:
 *   <ol>
 *     <li>Using the dto classes in com.topcoder.web.studio.dto package instead of in com.topcoder.web.common.model.comp package.</li>
 *   </ol>
 * </p>
 * 
 * @author dok, isv, pulky, pvmagacho, TCSASSEMBER
 * @version 1.4
 */
public class DownloadSubmission extends BaseSubmissionDataProcessor {
    private static final Logger log = Logger.getLogger(DownloadSubmission.class);
    
    /**
     * <p>A <code>String</code> array listing the supported types of alternate presentations of submission.</p>
     *
     * @since TopCoder Studio Modifications Assembly (Req# 5.8)
     */
    private static final String[] ALTERNATE_SUBMISSION_TYPES = {"tiny", "small", "medium", "full", "thumb", "original"};

    /**
     * <p>A <code>int</code> array listing the supported types of images provided with submission.</p>
     *
     * <p>BUGR-1694 Added Image.GALLERY_FULL_TYPE_ID as a valid image type so unwatermarked images can be previewed. </p>
     * @since Studio Download Submission Refactor (Req# 2.1.2)
     * 
     * <p>BUGR-4567 Added Image.GALLERY_SMALL_TYPE_ID as a valid image type for faster submission preview</p>
     *
     */
    private static final int[] ALTERNATE_SUBMISSION_IMAGE_TYPES = {Image.GALLERY_THUMBNAIL_TYPE_ID,
                                                                   Image.GALLERY_SMALL_TYPE_ID,
                                                                   Image.GALLERY_SMALL_WATERMARKED_TYPE_ID,
                                                                   Image.GALLERY_MEDIUM_WATERMARKED_TYPE_ID,
                                                                   Image.GALLERY_FULL_WATERMARKED_TYPE_ID,
                                                                   Image.GALLERY_FULL_TYPE_ID};


    /**
     * Screener roles.
     */
    private static final int[] SCREENER_ROLES_IDS = { ResourceRole.SCREENER_RESOURCE_ROLE_ID,
        ResourceRole.MILESTONE_SCREENER_RESOURCE_ROLE_ID
    };
    
    /**
     * Manager roles.
     */
    private static final int[] MANAGER_ROLES_IDS = { ResourceRole.MANAGER_RESOURCE_ROLE_ID,
        ResourceRole.COPILOT_RESOURCE_ROLE_ID,
        ResourceRole.CLIENT_MANAGER_RESOURCE_ROLE_ID,
        ResourceRole.OBSERVER_RESOURCE_ROLE_ID,
    };
     
    /**
     * This method executes the actual business logic for this processor.
     *
     * @throws Exception if any error occurs
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    protected void dbProcessing() throws Exception {
        Integer submissionId;

        try {
            submissionId = new Integer(getRequest().getParameter(Constants.SUBMISSION_ID));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid Submission Specified");
        }

        Submission s = DAOUtil.getFactory().getSubmissionDAO().find(submissionId);
        
        Hibernate.initialize(s.getImages());
        for (SubmissionImage image : s.getImages() ) {
            Hibernate.initialize(image.getImage());
            Hibernate.initialize(image.getImage().getPath());
        }
        
        Project contest = s.getContest();
        Long currentUserId = getUser().getId();
        
        // is current user submission owner
        boolean isOwner = (currentUserId.equals(s.getSubmitterId()));

        boolean isReviewOver = contest.getReviewClosed();
        
        boolean milestone = (s.getTypeId() == Submission.MILESTONE_SUBMISSION);

        // holds if end of submission or milestone submission phase based on submission type. 
        boolean isSubmissionOver = false;
        if (milestone) {
            isSubmissionOver = contest.getMilestoneSubmissionClosed();
        } else {
            isSubmissionOver = contest.getSubmissionClosed();
        }
        
        boolean isScreener = Util.checkUserHasRole(contest, SCREENER_ROLES_IDS, currentUserId);
        boolean isInManagerORRoles = Util.checkUserHasRole(contest, MANAGER_ROLES_IDS, currentUserId);

        // Since Studio Download Submission Refactor (Req# 2.1.3)
        // Check if there was an image type requested explicitly. If not then use -1 to indicate that no image type has
        // been requested
        int requestedImageTypeId = getRequestedImageTypeId();

        // Determine the type of requested submission presentation, "preview" is the default type
        String submissionType = getRequest().getParameter(Constants.SUBMISSION_ALT_TYPE);
        if (submissionType == null) {
            submissionType = "preview";
        } else {
            // Validate that the correct type of presentation is requested
            boolean valid = false;
            for (int i = 0; !valid && (i < ALTERNATE_SUBMISSION_TYPES.length); i++) {
                valid = (ALTERNATE_SUBMISSION_TYPES[i].equalsIgnoreCase(submissionType));
            }
            if (!valid) {
                throw new NavigationException(
                        MessageFormat.format(Constants.ERROR_MSG_INVALID_PRESENTATION_TYPE, submissionType));
            }
        }

        // Since TopCoder Studio Modifications v2 Assembly (Req# 5.11)- the contest creator may download the
        // submission if it already has been purchased
        boolean originalSubmissionRequested = "original".equalsIgnoreCase(submissionType);

        boolean canDownload = false;
        if (Util.isAdmin(getUser().getId()) || isOwner || isScreener) {
            canDownload = true;
        } else if (Util.hasCockpitPermissions(getUser().getId(), contest.getId())
                || isInManagerORRoles) {
            if (originalSubmissionRequested && isReviewOver) {
                canDownload = true;
            }
            if (!originalSubmissionRequested) {
                canDownload = true;
            }
        } else if (isReviewOver && s.getContest().getViewableSubmissions()) {
            canDownload = true;
        }

        String filePath = Util.createSubmissionPath(contest, 
                                                    DAOUtil.getFactory().getUserDAO().find(s.getSubmitterId()));
        HibernateUtils.closeSession();
        getRequest().removeAttribute(ACTIVE_CONVERSATION_FLAG);

        if (canDownload) {
            sendSubmission(contest, originalSubmissionRequested, submissionType, requestedImageTypeId, s, isOwner, 
                           filePath);
        } else {
            throw new NavigationException("Sorry, you can not download submissions for this contest.");
        }
    }


    /**
     * <p>Sends submission to be downloaded.</p>
     * 
     * @param contest the project associated with the submission
     * @param originalSubmissionRequested flag to indicate that original submission was requested
     * @param submissionType the type of the submission
     * @param requestedImageTypeId the type of the image requested
     * @param submission the submission instance
     * @param isOwner flag that indicates if the user asking for the file is the owner
     * @throws NavigationException if no file is found
     * @throws IOException if any error occurs during file operation
     */
    private void sendSubmission(Project contest, boolean originalSubmissionRequested, String submissionType,
                                int requestedImageTypeId, Submission submission, boolean isOwner, String filePath)
            throws NavigationException, IOException {        
        // Since TopCoder Studio Modifications Assembly Req# 5.8
        String targetFileName;
        String destFileName;
        String contentType = "application/zip";

        // Check if the preview file was requested
        boolean previewFileRequested = "preview".equalsIgnoreCase(submissionType);

        log.debug("originalSubmissionRequested: " + originalSubmissionRequested);
        log.debug("previewFileRequested: " + previewFileRequested);
        
        // Suubmission file path
        String originalFileName = submission.getUpload().getParameter();
        // Determine the name of requested file and it's mime type
        if (!originalSubmissionRequested) {
            // The alternate presentation is requested

            // Locate the file corresponding to requested alternate presentation
            log.debug("sendSubmission: path used " + filePath);
            File dir = new File(filePath);

            // Since Studio Slideshow Submission - map the literal submission type to image type ID and determine the
            // filename based on submission image data
            // Since Studio Download Submission Refactor (Req# 2.1.3) - the requested image type ID has a preference
            // over the requested submission type
            int targetImageTypeId;
            if (requestedImageTypeId == Constants.SUBMISSION_IMAGE_TYPE_UNSPECIFIED) {
                targetImageTypeId = getImageTypeId(submissionType);
            } else {
                targetImageTypeId = requestedImageTypeId;
            }

            log.debug("sendSubmission : targetImageTypeId: " + targetImageTypeId);
            String[] fileNames;
            if (targetImageTypeId > 0) {
                int fileIndex = getRequestedFileIndex();

                SubmissionImage image = getSubmissionImage(submission, targetImageTypeId, fileIndex);

                File pathdir = dir;
                if (image.getImage().getPath().getPath() != null && !image.getImage().getPath().getPath().equals(""))
                {
                    filePath = image.getImage().getPath().getPath();
                    pathdir = new File(filePath);
                }

                fileNames = pathdir.list(new SubmissionPresentationFilter(image.getImage().getFileName()));
            } else {
                //this handles the case where the user id downloading the preview file, not an image
                fileNames = dir.list(new SubmissionPresentationFilter(submissionType, submission.getId().longValue()));
            }
            
            // Since Studio Download Submission Refactor (Req# 2.1.4) - if preview file was requested but it was not
            // found then attempt to download image of type 31; if that doesn't exist also then raise an error
            if ((fileNames == null) || (fileNames.length < 1)) {
                if (previewFileRequested) {
                    // For BUGR-1694 - Previews should now show the un-watermarked version, so 
                    // changing this to return the FULL_TYPE_ID.
                    /*SubmissionImage image = getSubmissionImage(submission, Image.GALLERY_FULL_WATERMARKED_TYPE_ID,
                                                               Constants.DEFAULT_FILE_INDEX);*/                    
                    SubmissionImage image = getSubmissionImage(submission, Image.GALLERY_FULL_TYPE_ID,
                            Constants.DEFAULT_FILE_INDEX);
                    log.debug("image.getImage().getFileName(): " + image.getImage().getFileName());
                    File pathdir = dir;
                    if (image.getImage().getPath().getPath() != null && !image.getImage().getPath().getPath().equals(""))
                    {
                        filePath = image.getImage().getPath().getPath();
                        pathdir = new File(filePath);
                    }
                    fileNames = pathdir.list(new SubmissionPresentationFilter(image.getImage().getFileName()));
                }
            }

            if ((fileNames == null) || (fileNames.length < 1)) {
                throw new NavigationException(MessageFormat.format(Constants.ERROR_MSG_PRESENTATION_NOT_FOUND,
                                                                   submissionType));
            } else {
                // tiny, small, medium and full
                targetFileName = filePath + fileNames[0];
                destFileName = fileNames[0];
                beginCommunication();
                FileType fileType = UnifiedSubmissionValidator.getFileType(destFileName);
                Hibernate.initialize(fileType.getMimeTypes());
                
                if (fileType!=null) {
                    Set<MimeType> mimeTypes = fileType.getMimeTypes();
                    if (!mimeTypes.isEmpty()) {
                        contentType = mimeTypes.iterator().next().getDescription();
                    }                    
                }
                closeConversation();
            }
        } else {
            // The original submission is requested
            targetFileName = filePath + getSystemFileName(submission);
            destFileName = submission.getId()
                + originalFileName.substring(originalFileName.lastIndexOf('.'));
        }

        //create the file input stream first so that if there is a problem, we'll get the error and be able to
        // go to an error page.  if we work with the output stream, we won't be able to do that.
        FileInputStream fis = new FileInputStream(targetFileName);

        log.debug("not done");

        TCResponse response = getResponse();
        if (isOwner && originalSubmissionRequested) {
            response.addHeader("content-disposition", "inline; filename=\"" + originalFileName
                    + "\"");
            if (log.isDebugEnabled()) {
                log.debug("content-disposition = inline; filename=\"" + originalFileName + "\"");
            }
        } else {
            if (log.isDebugEnabled()) {
                log.debug("content-disposition = inline; filename=\"" + destFileName + "\"");
            }
            response.addHeader("content-disposition", "inline; filename=\"" + destFileName + "\"");
        }
        //resetting the cache-control header to empty.  IE freaks out and doesn't save when the
        //cache-control header is set the way we do for an uncached response.
        response.setHeader("Cache-Control", "");

        response.setContentType(contentType);
        ServletOutputStream sos = response.getOutputStream();
        int size = copyFile(fis, sos);
        response.addHeader("Content-Length", String.valueOf(size));
        response.setStatus(HttpServletResponse.SC_OK);
        response.flushBuffer();
        log.debug("flushed");
    }

    /**
     * <p>Gets the image associated with the specified submission and located at specified index in the group of images
     * of specified type.</p>
     *
     * @param submission a <code>Submission</code> to get the image for.
     * @param imageTypeId an <code>int</code> referencing the type of desired image to get.
     * @param fileIndex an <code>int</code> providing the relative index of the image of the specified type to get.
     * @return a <code>SubmissionImage</code> providing the details for the image of specified type associated with the
     *         specified submission.
     * @throws NavigationException if there is no image of specified type at specified index associated with the
     *         specified submission.
     * @since Studio Submission Slideshow
     */
    private SubmissionImage getSubmissionImage(Submission submission, int imageTypeId, int fileIndex)
            throws NavigationException {
        int currentIndex = 0;
        Set<SubmissionImage> images = submission.getImages();
        if (log.isDebugEnabled()) {
            log.debug("Found " + images.size() + " images");
        }
        for (SubmissionImage image : images) {
            if (image.getImage().getImageTypeId() == imageTypeId) {
                currentIndex++;
                if (currentIndex == fileIndex) {
                    if (log.isDebugEnabled()) {
                        log.debug("Returning image with filename " + image.getImage().getFileName());
                    }
                    return image;
                }
            }
        }
        throw new NavigationException(MessageFormat.format(Constants.ERROR_MSG_PRESENTATION_NOT_FOUND, imageTypeId));
    }

    /**
     * <p>Maps the specified type of requested submission presentation to type of an image.</p>
     *
     * @param submissionType a <code>String</code> referencing the type of requested submission presentation.
     * @return an <code>int</code> providing the ID of an image mapped to specified type of submission presentation or
     *         <code>0</code> if specified presentation type does not map to image type.
     * @since Studio Submission Slideshow
     */
    private int getImageTypeId(String submissionType) {
        if ("tiny".equalsIgnoreCase(submissionType) || "thumb".equalsIgnoreCase(submissionType)) {
            return Image.GALLERY_THUMBNAIL_TYPE_ID;
        } else if ("small".equalsIgnoreCase(submissionType)) {
            return Image.GALLERY_SMALL_WATERMARKED_TYPE_ID;
        } else if ("medium".equalsIgnoreCase(submissionType)) {
            return Image.GALLERY_MEDIUM_WATERMARKED_TYPE_ID;
        } else if ("full".equalsIgnoreCase(submissionType)) {
            return Image.GALLERY_FULL_WATERMARKED_TYPE_ID;
        }
        return 0;
    }

    /**
     * <p>Gets the index of the requested file from the parameter of incoming request.</p>
     *
     * @return an <code>int</code> providing the index of the requested file. The returned indexes are 1-based
     * @since Studio Submission Slideshow
     */
    private int getRequestedFileIndex() {
        String param = getRequest().getParameter(Constants.SUBMISSION_FILE_INDEX);
        if ((param == null) || (param.trim().length() == 0)) {
            return Constants.DEFAULT_FILE_INDEX;
        } else {
            return Integer.parseInt(param);
        }
    }

    /**
     * <p>Gets the type of the requested image from the parameter of incoming request.</p>
     *
     * @return an <code>int</code> referencing the type of the requested image.
     * @throws NavigationException if requested image type is not valid.
     * @since Studio Download Submission Refactor (Req# 2.1.3)
     */
    private int getRequestedImageTypeId() throws NavigationException {
        String requestedImageType = getRequest().getParameter(Constants.SUBMISSION_IMAGE_TYPE);
        int requestedImageTypeId = Constants.SUBMISSION_IMAGE_TYPE_UNSPECIFIED;
        if (requestedImageType != null) {
            // Validate that the correct type of image is requested
            boolean valid = false;
            try {
                requestedImageTypeId = Integer.parseInt(requestedImageType);
                for (int i = 0; !valid && (i < ALTERNATE_SUBMISSION_IMAGE_TYPES.length); i++) {
                    valid = (ALTERNATE_SUBMISSION_IMAGE_TYPES[i] == requestedImageTypeId);
                }
            } catch (NumberFormatException e) {
                // Catch the NFE and let the NavigationException to be thrown
            }
            if (!valid) {
                throw new NavigationException(
                        MessageFormat.format(Constants.ERROR_MSG_INVALID_PRESENTATION_TYPE, requestedImageType));
            }
        }
        return requestedImageTypeId;
    }

    /**
     * <p>Copies the specified file to specified servlet response stream.</p>
     *
     * @param from a <code>FileInputStream</code> to be copied.
     * @param to a <code>File</code> referencing the new location of the copy.
     * @return an <code>int</code> providing the size of the specified file.
     * @throws IOException if an I/O error occurs while writing file content to disk.
     * @since Studio Submission Slideshow
     */
    private static int copyFile(InputStream from, ServletOutputStream to) throws IOException {
        try {
            byte[] buf = new byte[4096];
            int count = -1;
            int size = 0;
            while ((count = from.read(buf)) != -1) {
                to.write(buf, 0, count);
                size += count;
            }
            return size;
        } finally {
            from.close();
        }
    }

     /**
     * End a conversation.  This will persist changes to the db, and wrap things up.
     */
    protected void closeConversation() {
        log.debug("close conversation");
        HibernateUtils.closeSession();
        getRequest().removeAttribute(ACTIVE_CONVERSATION_FLAG);
        log.info("close session");
   }

}