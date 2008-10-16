package com.topcoder.web.studio.controller.request.admin;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.model.Image;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.ContestChannel;
import com.topcoder.web.studio.model.ContestProperty;
import com.topcoder.web.studio.model.MimeType;
import com.topcoder.web.studio.model.StudioFileType;
import com.topcoder.web.studio.model.Submission;
import com.topcoder.web.studio.model.SubmissionImage;
import com.topcoder.web.studio.util.SubmissionPresentationFilter;
import com.topcoder.web.studio.validation.UnifiedSubmissionValidator;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.text.MessageFormat;
import java.util.Map;
import java.util.Set;

/**
 * @author dok, isv
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 20, 2006
 */
public class DownloadSubmission extends Base {

    /**
     * <p>A <code>String</code> array listing the supported types of alternate presentations of submission.</p>
     *
     * @since TopCoder Studio Modifications Assembly (Req# 5.11)
     */
    private static final String[] ALTERNATE_SUBMISSION_TYPES = {"tiny", "small", "medium", "full", "thumb", "original"};

    /**
     * <p>A <code>int</code> array listing the supported types of images provided with submission.</p>
     *
     * @since Studio Download Submission Refactor (Req# 2.1.2)
     */
    private static final int[] ALTERNATE_SUBMISSION_IMAGE_TYPES = {Image.GALLERY_THUMBNAIL_TYPE_ID,
                                                                   Image.GALLERY_SMALL_TYPE_ID,
                                                                   Image.GALLERY_SMALL_WATERMARKED_TYPE_ID,
                                                                   Image.GALLERY_MEDIUM_TYPE_ID,
                                                                   Image.GALLERY_MEDIUM_WATERMARKED_TYPE_ID,
                                                                   Image.GALLERY_FULL_TYPE_ID,
                                                                   Image.GALLERY_FULL_WATERMARKED_TYPE_ID};

    /**
     *
     *
     * @throws Exception if an unexpected error occurs.
     */
    protected void dbProcessing() throws Exception {
        Long submissionId;

        try {
            submissionId = new Long(getRequest().getParameter(Constants.SUBMISSION_ID));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid Submission Specified");
        }
        
        // Since TopCoder Studio Modifications Assembly Req# 5.11
        String targetFileName;
        String destFileName;
        String contentType = "application/zip";

        // Since Studio Download Submission Refactor (Req# 2.1.3)
        // Check if there was an image type requested explicitly. If not then use -1 to indicate that no image type has
        // been requested
        int requestedImageTypeId = getRequestedImageTypeId();

        // Determine the type of requested submission presentation
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
                throw new NavigationException(MessageFormat.format(Constants.ERROR_MSG_INVALID_PRESENTATION_TYPE,
                                                                   submissionType));
            }
        }

        // Determine the contest channel - the old contests must be processed as in previous version
        Submission s = StudioDAOUtil.getFactory().getSubmissionDAO().find(submissionId);
        Contest contest = s.getContest();
        ContestChannel contestChannel = contest.getChannel();
        if (!submissionType.equalsIgnoreCase("original")
            && !ContestChannel.STUDIO_ADMINISTRATOR_V1.equals(contestChannel.getId())) {

            // The alternate presentation is requested
            // Check if the preview file was requested
            boolean previewFileRequested = "preview".equalsIgnoreCase(submissionType);

            // Locate the file corresponding to requested alternate presentation
            File dir = new File(s.getPath().getPath());

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

            String[] fileNames;
            if (targetImageTypeId > 0) {
                int fileIndex = getRequestedFileIndex();
                SubmissionImage image = getSubmissionImage(s, targetImageTypeId, fileIndex);
                fileNames = dir.list(new SubmissionPresentationFilter(image.getImage().getFileName()));
            } else {
                fileNames = dir.list(new SubmissionPresentationFilter(submissionType, s.getId()));
            }
            
            // Since Studio Download Submission Refactor (Req# 2.1.4) - if preview file was requested but it was not
            // found then attempt to download image of type 31; if that doesn't exist also then raise an error
            if ((fileNames == null) || (fileNames.length < 1)) {
                if (previewFileRequested) {
                    SubmissionImage image = getSubmissionImage(s, Image.GALLERY_FULL_WATERMARKED_TYPE_ID,
                                                               Constants.DEFAULT_FILE_INDEX);
                    fileNames = dir.list(new SubmissionPresentationFilter(image.getImage().getFileName()));
                }
            }

            if ((fileNames == null)  || (fileNames.length < 1)) {
                throw new NavigationException(MessageFormat.format(Constants.ERROR_MSG_PRESENTATION_NOT_FOUND,
                                                                   submissionType));
            } else {
                // tiny, small, medium and full (but full only if preview file required for contest; otherwise - image)
                targetFileName = s.getPath().getPath() + fileNames[0];
                destFileName = fileNames[0];
                StudioFileType fileType = UnifiedSubmissionValidator.getFileType(destFileName);
                Set<MimeType> mimeTypes = fileType.getMimeTypes();
                for (MimeType mimeType : mimeTypes) {
                    contentType = mimeType.getDescription();
                    break;
                }
            }
        } else {
            // The original submission is requested
            targetFileName = s.getPath().getPath() + s.getSystemFileName();
            destFileName = s.getId() + s.getOriginalFileName().substring(s.getOriginalFileName().lastIndexOf('.'));
            contentType = s.getMimeType().getDescription();
        }

        //create the file input stream first so that if there is a problem, we'll get the error and be able to go
        //to an error page.  if we work with the output stream, we won't be able to do that.
        FileInputStream fis = new FileInputStream(targetFileName);

        //stream it out via the response
        getResponse().addHeader("content-disposition", "inline; filename=\"" + destFileName + "\"");
        getResponse().setContentType(contentType);
        ServletOutputStream sos = getResponse().getOutputStream();

        int b;
        int size = 0;
        while ((b = fis.read()) >= 0) {
            sos.write(b);
            size++;
        }
        getResponse().addHeader("Content-Length", String.valueOf(size));
        getResponse().setStatus(HttpServletResponse.SC_OK);
        getResponse().flushBuffer();
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
        String fileWatermarkParam = getRequest().getParameter(Constants.SUBMISSION_FILE_WATERMARKED);
        boolean watermarkRequested = Boolean.valueOf(fileWatermarkParam);
        
        if ("tiny".equalsIgnoreCase(submissionType)) {
            return Image.GALLERY_THUMBNAIL_TYPE_ID;
        } else if ("thumb".equalsIgnoreCase(submissionType)) {
            return Image.GALLERY_SMALL_WATERMARKED_TYPE_ID;
        } else if ("small".equalsIgnoreCase(submissionType)) {
            if (watermarkRequested) {
                return Image.GALLERY_SMALL_WATERMARKED_TYPE_ID;
            } else {
                return Image.GALLERY_SMALL_TYPE_ID;
            }
        } else if ("medium".equalsIgnoreCase(submissionType)) {
            if (watermarkRequested) {
                return Image.GALLERY_MEDIUM_WATERMARKED_TYPE_ID;
            } else {
                return Image.GALLERY_MEDIUM_TYPE_ID;
            }
        } else if ("full".equalsIgnoreCase(submissionType)) {
            if (watermarkRequested) {
                return Image.GALLERY_FULL_WATERMARKED_TYPE_ID;
            } else {
                return Image.GALLERY_FULL_TYPE_ID;
            }
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
            return 1;
        } else {
            return Integer.parseInt(param);
        }
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
        for (SubmissionImage image : images) {
            if (image.getImage().getImageTypeId() == imageTypeId) {
                currentIndex++;
                if (currentIndex == fileIndex) {
                    return image;
                }
            }
        }
        throw new NavigationException(MessageFormat.format(Constants.ERROR_MSG_PRESENTATION_NOT_FOUND, imageTypeId));
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
}
