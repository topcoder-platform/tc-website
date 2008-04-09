package com.topcoder.web.studio.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.ContestChannel;
import com.topcoder.web.studio.model.ContestProperty;
import com.topcoder.web.studio.model.MimeType;
import com.topcoder.web.studio.model.StudioFileType;
import com.topcoder.web.studio.model.Submission;
import com.topcoder.web.studio.util.SubmissionPresentationFilter;
import com.topcoder.web.studio.util.Util;
import com.topcoder.web.studio.validation.SubmissionValidator;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.MessageFormat;
import java.util.Date;
import java.util.Map;
import java.util.Set;

/**
 * @author dok, isv
 * @version $Revision$ Date: 2005/01/01 00:00:00 Create Date: Aug 29, 2006
 */
public class DownloadSubmission extends BaseSubmissionDataProcessor {

    /**
     * <p>A <code>String</code> array listing the supported types of alternate presentations of submission.</p>
     *
     * @since TopCoder Studio Modifications Assembly (Req# 5.8)
     */
    private static final String[] ALTERNATE_SUBMISSION_TYPES = {"tiny", "small", "medium", "full", "original"};

    protected void dbProcessing() throws Exception {
        Long submissionId;

        try {
            submissionId = new Long(getRequest().getParameter(Constants.SUBMISSION_ID));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid Submission Specified");
        }

        Submission s = StudioDAOUtil.getFactory().getSubmissionDAO().find(submissionId);

        Contest contest = s.getContest();
        ContestChannel channel = contest.getChannel();

        boolean isStudioAdminV1 = true;
        if (channel != null) {
            isStudioAdminV1 = ContestChannel.STUDIO_ADMINISTRATOR_V1.equals(channel.getId());
        }

        long currentUserId = getUser().getId();
        boolean isOwner = s.getSubmitter().getId().equals(currentUserId);
        boolean isOver = new Date().after(s.getContest().getEndTime());

        // Determine the type of requested submission presentation, "full" is the default type
        String submissionType = getRequest().getParameter(Constants.SUBMISSION_ALT_TYPE);
        if (submissionType == null) {
            submissionType = "full";
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
        boolean isContestCreator = contest.getCreateUserId() == currentUserId;
        boolean isPurchaser = originalSubmissionRequested && isContestCreator
                && (Util.isSubmissionPurchased(String.valueOf(submissionId)));

        boolean canDownload;
        if (Util.isAdmin(getUser().getId())) {
            log.debug("allow download, they're an admin");
            //admins can download anything
            canDownload = true;
        } else if (isOwner) {
            log.debug("allow download, they're the submitter");
            //submitters can always download their own work
            canDownload = true;
        } else if (originalSubmissionRequested) {
            //if the original is requested, then they can only download it if they bought it
            canDownload = isPurchaser;
            if (log.isDebugEnabled()) {
                log.debug("original requested, and they " + (isPurchaser?"have":"have not") + " purchased it");
            }
        } else if (isContestCreator) {
            log.debug("allow download, they're the contest creator");
            //if it's not the original, then the contest creator can download it, it doesn't matter if the contest is over or not
            canDownload = true;
        } else if (String.valueOf(true).equals(s.getContest().getViewableSubmissions().getValue())) {
            log.debug("submissions are viewable");
            //if submissions are viewable, then they can only be downloaded if the contest is over
            canDownload = isOver;
            if (log.isDebugEnabled()) {
                log.debug("the contest " + (isOver?"is over":"is not over") + " so they " + (isOver?"can":"can not") + " download");
            }
        } else {
            log.debug("not allowed");
            canDownload = false;
        }

        if (canDownload) {
            if (isStudioAdminV1) {
                dbProcessingV1(s, isOwner);
            } else {
                sendSubmission(contest, originalSubmissionRequested, submissionType, s, isOwner);
            }
        } else {
            throw new NavigationException("Sorry, you can not download submissions for this contest.");
        }
    }

    /**
     * <p>Processes the contests originated from the <code>Studio Administrator v.1</code> contest channel.</p>
     *
     * @param s       a <code>Submission</code> reprsenting the submission to be downloaded.
     * @param isOwner whether or not the current user is the submitter for the requested submission
     * @throws Exception if an unexpected error occurs.
     * @since TopCoder Studio Modifications Assembly (Req# 5.8)
     */
    private void dbProcessingV1(Submission s, boolean isOwner) throws Exception {
        //create the file input stream first so that if there is a problem, we'll get the error and be able to go
        //to an error page.  if we work with the output stream, we won't be able to do that.
        FileInputStream fis = new FileInputStream(s.getPath().getPath() + s.getSystemFileName());

        log.debug("not done");
        String origFileName = s.getOriginalFileName();
        TCResponse response = getResponse();
        if (isOwner) {
            response.addHeader("content-disposition", "inline; filename=\"" + origFileName + "\"");
        } else {
            response.addHeader("content-disposition", "inline; filename=\"" + s.getId()
                    + origFileName.substring(origFileName.lastIndexOf('.'))
                    + "\"");
        }
        //resetting the cache-control header to empty.  IE freaks out and doesn't save when the
        //cache-control header is set the way we do for an uncached response.
        response.setHeader("Cache-Control", "");
        response.setContentType(s.getMimeType().getDescription());

        ServletOutputStream sos = response.getOutputStream();
        int b;
        int size = 0;
        while ((b = fis.read()) >= 0) {
            sos.write(b);
            size++;
        }
        response.addHeader("Content-Length", String.valueOf(size));
        response.setStatus(HttpServletResponse.SC_OK);
        response.flushBuffer();
    }


    private void sendSubmission(Contest contest, boolean originalSubmissionRequested, String submissionType,
                                Submission s, boolean isOwner) throws NavigationException, IOException {
        // Since TopCoder Studio Modifications Assembly Req# 5.8
        String targetFileName;
        String destFileName;
        String contentType = "application/zip";

        // Determine if the "imagew" presentation must be used in case the "full" presentation is requested but
        // contest does not require preview file. So the user may get the watermarked image
        Map<Integer, String> contestConfig = contest.getConfigMap();
        boolean previewFileRequired
                = Boolean.parseBoolean(contestConfig.get(ContestProperty.REQUIRE_PREVIEW_FILE));
        if ("full".equalsIgnoreCase(submissionType) && !previewFileRequired) {
            submissionType = "imagew";
        }

        // Determine tha name of requested file and it's mime type
        if (!originalSubmissionRequested) {
            // Thealternate presentation is requested

            // Locate the file corresponding to requested alternate presentation
            File dir = new File(s.getPath().getPath());
            String[] fileNames = dir.list(new SubmissionPresentationFilter(submissionType, s.getId()));
            if ((fileNames == null) || (fileNames.length < 1)) {
                throw new NavigationException(MessageFormat.format(Constants.ERROR_MSG_PRESENTATION_NOT_FOUND,
                        submissionType));
            } else {
                // tiny, small, medium and full
                targetFileName = s.getPath().getPath() + fileNames[0];
                destFileName = fileNames[0];
                StudioFileType fileType = SubmissionValidator.getFileType(destFileName);
                Set<MimeType> mimeTypes = fileType.getMimeTypes();
                if (!mimeTypes.isEmpty()) {
                    contentType = mimeTypes.iterator().next().getDescription();
                }
            }
        } else {
            // The original submission is requested
            targetFileName = s.getPath().getPath() + s.getSystemFileName();
            destFileName
                    = s.getId() + s.getOriginalFileName().substring(s.getOriginalFileName().lastIndexOf('.'));
            contentType = s.getMimeType().getDescription();
        }

        //create the file input stream first so that if there is a problem, we'll get the error and be able to
        // go to an error page.  if we work with the output stream, we won't be able to do that.
        FileInputStream fis = new FileInputStream(targetFileName);

        log.debug("not done");

        TCResponse response = getResponse();
        if (isOwner && originalSubmissionRequested) {
            response.addHeader("content-disposition", "inline; filename=\"" + s.getOriginalFileName()
                    + "\"");
            if (log.isDebugEnabled()) {
                log.debug("content-disposition = inline; filename=\"" + s.getOriginalFileName() + "\"");
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
        int b;
        int size = 0;
        while ((b = fis.read()) >= 0) {
            sos.write(b);
            size++;
        }
        response.addHeader("Content-Length", String.valueOf(size));
        response.setStatus(HttpServletResponse.SC_OK);
        response.flushBuffer();
        log.debug("flushed");
    }

}