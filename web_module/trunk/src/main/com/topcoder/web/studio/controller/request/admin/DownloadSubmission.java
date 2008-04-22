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
import com.topcoder.web.studio.validation.SubmissionValidator;

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
    private static final String[] ALTERNATE_SUBMISSION_TYPES = {"tiny", "small", "medium", "full", "original"};

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
            
            // Determine if the "image" presentation must be used in case the "preview" presentation is requested but
            // contest does not require preview file. So the admin may get the non-watermarked image
            Map<Integer,String> contestConfig = contest.getConfigMap();
            boolean previewFileRequired = Boolean.parseBoolean(contestConfig.get(ContestProperty.REQUIRE_PREVIEW_FILE));
            if ("preview".equalsIgnoreCase(submissionType) && !previewFileRequired) {
                submissionType = "image";
            }

            // Locate the file corresponding to requested alternate presentation
            File dir = new File(s.getPath().getPath());

            // Since Studio Slideshow Submission - map the literal submission type to image type ID and determine the
            // filename based on submission image data
            int fileIndex = getRequestedFileIndex();
            int imageTypeId = getImageTypeId(submissionType);
            String[] fileNames;
            if (imageTypeId > 0) {
                SubmissionImage image = getSubmissionImage(s, imageTypeId, fileIndex);
                fileNames = dir.list(new SubmissionPresentationFilter(image.getImage().getFileName()));
            } else {
                fileNames = dir.list(new SubmissionPresentationFilter(submissionType, s.getId()));
            }

            if ((fileNames == null)  || (fileNames.length < 1)) {
                throw new NavigationException(MessageFormat.format(Constants.ERROR_MSG_PRESENTATION_NOT_FOUND,
                                                                   submissionType));
            } else {
                // tiny, small, medium and full (but full only if preview file required for contest; otherwise - image)
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
        boolean galleryImageRequested = false;
        String fileIndexParam = getRequest().getParameter(Constants.SUBMISSION_FILE_INDEX);
        String fileWatermarkParam = getRequest().getParameter(Constants.SUBMISSION_FILE_WATERMARKED);
        if ((fileIndexParam != null) && (fileIndexParam.trim().length() > 0)) {
            galleryImageRequested = true;
        }
        boolean watermarkRequested = Boolean.valueOf(fileWatermarkParam);
        
        if ("tiny".equalsIgnoreCase(submissionType)) {
            if (galleryImageRequested) {
                return Image.GALLERY_THUMBNAIL_TYPE_ID;
            } else {
                return Image.PREVIEW_THUMBNAIL_TYPE_ID;
            }
        } else if ("small".equalsIgnoreCase(submissionType)) {
            if (galleryImageRequested) {
                if (watermarkRequested) {
                    return Image.GALLERY_SMALL_WATERMARKED_TYPE_ID;
                } else {
                    return Image.GALLERY_SMALL_TYPE_ID;
                }
            } else {
                if (watermarkRequested) {
                    return Image.PREVIEW_SMALL_WATERMARKED_TYPE_ID;
                } else {
                    return Image.PREVIEW_SMALL_TYPE_ID;
                }
            }
        } else if ("medium".equalsIgnoreCase(submissionType)) {
            if (galleryImageRequested) {
                if (watermarkRequested) {
                    return Image.GALLERY_MEDIUM_WATERMARKED_TYPE_ID;
                } else {
                    return Image.GALLERY_MEDIUM_TYPE_ID;
                }
            } else {
                if (watermarkRequested) {
                    return Image.PREVIEW_MEDIUM_WATERMARKED_TYPE_ID;
                } else {
                    return Image.PREVIEW_MEDIUM_TYPE_ID;
                }
            }
        } else if ("full".equalsIgnoreCase(submissionType)) {
            if (galleryImageRequested) {
                if (watermarkRequested) {
                    return Image.GALLERY_FULL_WATERMARKED_TYPE_ID;
                } else {
                    return Image.GALLERY_FULL_TYPE_ID;
                }
            } else {
                if (watermarkRequested) {
                    return Image.PREVIEW_FULL_WATERMARKED_TYPE_ID;
                } else {
                    return Image.PREVIEW_FULL_TYPE_ID;
                }
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
}
