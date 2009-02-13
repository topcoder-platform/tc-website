package com.topcoder.web.studio.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.ContestChannel;
import com.topcoder.web.studio.model.MimeType;
import com.topcoder.web.studio.model.StudioFileType;
import com.topcoder.web.studio.model.Submission;
import com.topcoder.web.studio.model.ContestProperty;
import com.topcoder.web.studio.util.SubmissionPresentationFilter;
import com.topcoder.web.studio.validation.SubmissionValidator;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.util.Date;
import java.util.Set;
import java.util.Map;
import java.text.MessageFormat;

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

        boolean isTopCoderDirect = false;
        boolean isStudioAdminV1 = true;
        if (channel != null) {
            isTopCoderDirect = ContestChannel.TOPCODER_DIRECT.equals(channel.getId());
            isStudioAdminV1 = ContestChannel.STUDIO_ADMINISTRATOR_V1.equals(channel.getId());
        }

        if (!isStudioAdminV1) {
            boolean isOwner = s.getSubmitter().getId().equals(getUser().getId());
            boolean isOver = new Date().after(s.getContest().getEndTime());

            if (!isOver && !isOwner && !isTopCoderDirect) {
                throw new NavigationException("Submissions are not available until the contest is over.");
            }

            if ("true".equals(s.getContest().getViewableSubmissions().getValue())
                && (isOwner || isTopCoderDirect || isOver)) {
                // Since TopCoder Studio Modifications Assembly Req# 5.8
                String targetFileName;
                String destFileName;
                String contentType = "application/zip";

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

                // Determine if the "imagew" presentation must be used in case the "full" presentation is requested but
                // contest does not require preview file. So the user may get the watermarked image
                Map<Integer,String> contestConfig = contest.getConfigMap();
                boolean previewFileRequired
                        = Boolean.parseBoolean(contestConfig.get(ContestProperty.REQUIRE_PREVIEW_FILE));
                if ("full".equalsIgnoreCase(submissionType) && !previewFileRequired) {
                    submissionType = "imagew";
                }

                // Determine tha name of requested file and it's mime type
                if (!submissionType.equalsIgnoreCase("original")) {
                    // Thealternate presentation is requested

                    // Locate the file corresponding to requested alternate presentation
                    File dir = new File(s.getPath().getPath());
                    String[] fileNames = dir.list(new SubmissionPresentationFilter(submissionType, s.getId()));
                    if ((fileNames == null)  || (fileNames.length < 1)) {
                        throw new NavigationException(MessageFormat.format(Constants.ERROR_MSG_PRESENTATION_NOT_FOUND,
                                                                           submissionType));
                    } else {
                        // tiny, small, medium and full
                        targetFileName = s.getPath().getPath() + fileNames[0];
                        destFileName = fileNames[0];
                        StudioFileType fileType = SubmissionValidator.getFileType(destFileName);
                        Set<MimeType> mimeTypes = fileType.getMimeTypes();
                        for (MimeType mimeType : mimeTypes) {
                            contentType = mimeType.getDescription();
                            break;
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
                if (isOwner && "original".equalsIgnoreCase(submissionType)) {
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
            } else {
                throw new NavigationException("Sorry, you can not download submissions for this contest.");
            }
        } else {
            dbProcessingV1(s);
        }
    }

    /**
     * <p>Processes the contests originated from the <code>Studio Administrator v.1</code> contest channel.</p>
     *
     * @param s a <code>Submission</code> reprsenting the submission to be downloaded. 
     * @throws Exception if an unexpected error occurs.
     * @since TopCoder Studio Modifications Assembly (Req# 5.8)
     */
    private void dbProcessingV1(Submission s) throws Exception {
        boolean isOwner = s.getSubmitter().getId().equals(getUser().getId());

        boolean isOver = new Date().after(s.getContest().getEndTime());

        if (!isOver && !isOwner) {
            throw new NavigationException("Submissions are not available until the contest is over.");
        }

        if ("true".equals(s.getContest().getViewableSubmissions().getValue()) || isOwner) {

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
        } else {
            throw new NavigationException("Sorry, you can not download submissions for this contest.");
        }
    }
}