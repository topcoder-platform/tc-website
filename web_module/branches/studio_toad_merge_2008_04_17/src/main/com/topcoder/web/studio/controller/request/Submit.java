/*
 * Copyright (C) 2005-2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import com.topcoder.image.size.ImageException;
import com.topcoder.image.size.ImageResizer;
import com.topcoder.imaging.overlay.ImageOverlayManager;
import com.topcoder.imaging.overlay.ImageOverlayProcessingException;
import com.topcoder.imaging.overlay.ImagePersistenceException;
import com.topcoder.imaging.overlay.ImagePersistenceHandler;
import com.topcoder.imaging.overlay.OverlaySpecification;
import com.topcoder.imaging.overlay.OverlayType;
import com.topcoder.imaging.overlay.TransparencySpecification;
import com.topcoder.imaging.overlay.UnsupportedFormatException;
import com.topcoder.imaging.overlay.Watermarker;
import com.topcoder.servlet.request.FileDoesNotExistException;
import com.topcoder.servlet.request.PersistenceException;
import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.util.image.manipulation.Image;
import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.common.MultipartRequest;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.validation.IntegerValidator;
import com.topcoder.web.common.validation.ObjectInput;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOFactory;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.dao.SubmissionDAO;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.ContestChannel;
import com.topcoder.web.studio.model.ContestStatus;
import com.topcoder.web.studio.model.FilePath;
import com.topcoder.web.studio.model.MimeType;
import com.topcoder.web.studio.model.ReviewStatus;
import com.topcoder.web.studio.model.StudioFileType;
import com.topcoder.web.studio.model.Submission;
import com.topcoder.web.studio.model.SubmissionReview;
import com.topcoder.web.studio.model.SubmissionStatus;
import com.topcoder.web.studio.model.SubmissionType;
import com.topcoder.web.studio.util.BundledFileAnalyzer;
import com.topcoder.web.studio.validation.SubmissionValidator;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageInputStream;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.ByteArrayOutputStream;
import java.util.Date;

/**
 * <p>A request processor to be used for servicing the requests for uploading the submissions to server. The main
 * purpose of this processor is to validate the submission and store it in local file system. Also generates the
 * alternate presentations for the submission and generates the passing review for those submissions which come from
 * <code>TopCoder Direct</code> contests.</p>
 *
 * @author dok, isv
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 20, 2006
 */
public class Submit extends BaseSubmissionDataProcessor {

    /**
     * <p>An <code>int</code> providing the maximum size (in pixels) for the <code>tiny</code> presentations of the
     * preview images.</p>
     *
     * @since TopCoder Studio Modifications Assembly (Req# 5.7)
     */
    private static final int TINY_IMAGE_SIZE = 120;

    /**
     * <p>An <code>int</code> providing the maximum size (in pixels) for the <code>small</code> presentations of the
     * preview images.</p>
     *
     * @since TopCoder Studio Modifications Assembly (Req# 5.7)
     */
    private static final int SMALL_IMAGE_SIZE = 300;

    /**
     * <p>An <code>int</code> providing the maximum size (in pixels) for the <code>medium</code> presentations of the
     * preview images.</p>
     *
     * @since TopCoder Studio Modifications Assembly (Req# 5.7)
     */
    private static final int MEDIUM_IMAGE_SIZE = 555;

    /**
     * <p>A <code>File</code> referencing the uploaded submission as stored in the local file system.</p>
     */
    private File f = null;

    /**
     * <p>Implements the business logic for request processing.</p>
     *
     * <p>Validates the submission submitted by the user to server and stores it in local file system. Launches a
     * separate thread for generating the alternate presentations of the submission. Also for submissions from <code>
     * TopCoder Direct</code> contests generates the passing review.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    protected void dbProcessing() throws Exception {
        if (userLoggedIn()) {
            Long contestId;

            try {
                contestId = new Long(getRequest().getParameter(Constants.CONTEST_ID));
            } catch (NumberFormatException e) {
                throw new NavigationException("Invalid contest specified.");
            }

            boolean hasGlobalAd = true;
            if ("on".equalsIgnoreCase(Constants.GLOBAL_AD_FLAG)) {
                hasGlobalAd = PactsServicesLocator.getService().hasGlobalAD(getUser().getId());
            }

            if (!hasGlobalAd) {
                // throw new NavigationException("You cannot submit because you don't have a Global AD on file");
                setNextPage("/noGadErrorPage.jsp");
                setIsNextPageInContext(true);
            } else {
    
                String rank = getRequest().getParameter(Constants.SUBMISSION_RANK);
    
                StudioDAOFactory cFactory = StudioDAOUtil.getFactory();
                DAOFactory factory = DAOUtil.getFactory();
                SubmissionDAO dao = cFactory.getSubmissionDAO();
                UserDAO userDAO = factory.getUserDAO();
    
                Contest c = cFactory.getContestDAO().find(contestId);
                Date now = new Date();
                if (now.before(c.getStartTime()) ||
                        now.after(c.getEndTime()) ||
                        !ContestStatus.ACTIVE.equals(c.getStatus().getId())) {
                    throw new NavigationException("Inactive contest specified.");
                }
                User u = userDAO.find(getUser().getId());
    
                if (cFactory.getContestRegistrationDAO().find(c, u) == null) {
                    //not registered
                    StringBuffer buf = new StringBuffer(50);
                    buf.append(getSessionInfo().getServletPath());
                    buf.append("?" + Constants.MODULE_KEY + "=ViewRegistration&");
                    buf.append(Constants.CONTEST_ID + "=").append(contestId);
                    setNextPage(buf.toString());
                    setIsNextPageInContext(false);
                } else {
                    //registered
                    MultipartRequest r = (MultipartRequest) getRequest();
    
                    UploadedFile submissionFile = r.getUploadedFile(Constants.SUBMISSION);
    
                    //do validation
                    ValidationResult submissionResult
                            = new SubmissionValidator(c).validate(new ObjectInput(submissionFile));
                    if (!submissionResult.isValid()) {
                        addError(Constants.SUBMISSION, submissionResult.getMessage());
                    }
    
                    StringInput rankInput = new StringInput(rank);
                    ValidationResult rankResult
                            = new IntegerValidator("Please input a valid integer for rank.").validate(rankInput);
                    if (!rankResult.isValid()) {
                        addError(Constants.SUBMISSION_RANK, rankResult.getMessage());
                    }
    
                    String remoteFileName = submissionFile.getRemoteFileName();
                    if (hasErrors()) {
                        setDefault(Constants.CONTEST_ID, contestId.toString());
                        setDefault(Constants.SUBMISSION_RANK, rank);
                        loadSubmissionData(u, c, dao, SubmissionType.INITIAL_CONTEST_SUBMISSION_TYPE);
                        getRequest().setAttribute("contest", c);
                        setNextPage("/submit.jsp");
                        setIsNextPageInContext(true);
                    } else {
                        MimeType mt = SubmissionValidator.getMimeType(submissionFile);
                        Submission s = new Submission();
                        s.setContest(c);
                        s.setOriginalFileName(remoteFileName);
                        s.setSubmitter(u);
                        s.setMimeType(mt);
                        s.setStatus(cFactory.getSubmissionStatusDAO().find(SubmissionStatus.ACTIVE));
    
                        StringBuffer buf = new StringBuffer(80);
                        buf.append(Constants.ROOT_STORAGE_PATH);
                        buf.append(System.getProperty("file.separator"));
                        buf.append(Constants.SUBMISSIONS_DIRECTORY_NAME);
                        buf.append(System.getProperty("file.separator"));
                        buf.append(c.getId());
                        buf.append(System.getProperty("file.separator"));
                        buf.append(u.getHandle().toLowerCase());
                        buf.append("_");
                        buf.append(u.getId());
                        buf.append(System.getProperty("file.separator"));
    
                        FilePath p = new FilePath();
                        p.setPath(buf.toString());
    
                        File directory = new File(buf.toString());
                        if (!directory.exists()) {
                            directory.mkdirs();
                        }
    
                        String ext = remoteFileName.substring(remoteFileName.lastIndexOf('.'));
    
                        //root/submissions/contest_id/user_id/time.pdf
                        s.setPath(p);
                        s.setSystemFileName(System.currentTimeMillis() + ext);
                        s.setType(cFactory.getSubmissionTypeDAO().find(SubmissionType.INITIAL_CONTEST_SUBMISSION_TYPE));
    
                        if (log.isDebugEnabled()) {
                            log.debug("creating file: " + p.getPath() + s.getSystemFileName());
                        }
                        f = new File(p.getPath() + s.getSystemFileName());
    
                        FileOutputStream fos = new FileOutputStream(f);
                        byte[] fileBytes = new byte[(int) submissionFile.getSize()];
                        submissionFile.getInputStream().read(fileBytes);
                        fos.write(fileBytes);
                        fos.close();
    
                        if (mt.getFileType().isImageFile()) {
                            ImageInputStream iis = ImageIO.createImageInputStream(new ByteArrayInputStream(fileBytes));
                            BufferedImage image = ImageIO.read(iis);
                            s.setWidth(image.getWidth());
                            s.setHeight(image.getHeight());
                        }
    
                        Integer maxRank = dao.getMaxRank(c, u);
                        Integer one = 1;
                        getRequest().setAttribute("maxRank", maxRank);
    
                        // Since TopCoder Studio Modifications Assembly - if contest is from TopCoder Direct then create
                        // the passing review immediately. Req# 5.12
                        ContestChannel contestChannel = c.getChannel();
                        if (contestChannel != null) {
                            if (ContestChannel.TOPCODER_DIRECT.equals(contestChannel.getId())) {
                                SubmissionReview review = new SubmissionReview();
                                review.setNew(true);
                                review.setReviewer(userDAO.find(c.getCreateUserId()));
                                review.setStatus(cFactory.getReviewStatusDAO().find(ReviewStatus.PASSED));
                                review.setText("TopCoder Direct, Automatic pass");
                                review.setSubmission(s);
                                cFactory.getSubmissionReviewDAO().saveOrUpdate(review);
    
                                s.setReview(review);
                            }
                        }
    
                        // Since TopCoder Studio Modifications Assembly v2 - analyze whether the submission has preview
                        // image provided or not. Req# 5.3
                        BundledFileAnalyzer analyzer = SubmissionValidator.getBundledFileParser(s.getMimeType());
                        analyzer.analyze(submissionFile.getInputStream(), true);
                        if (analyzer.isPreviewImageAvailable()) {
                            s.setHasPreviewImage(Boolean.TRUE);
                        } else {
                            s.setHasPreviewImage(Boolean.FALSE);
                        }
    
                        if (maxRank == null) {
                            s.setRank(one);
                            dao.saveOrUpdate(s);
                        } else {
                            Integer newRank = new Integer(rank);
                            if (newRank.compareTo(maxRank) > 0) {
                                s.setRank(maxRank + 1);
                                dao.saveOrUpdate(s);
                            } else if (newRank.compareTo(one) < 0) {
                                dao.changeRank(one, s);
                            } else {
                                dao.changeRank(newRank, s);
                            }
                        }
    
                        // Since TopCoder Studio Modifications Assembly - generate alternate representations for the
                        // submission. Req# 5.7
                        generateAlternateRepresentations(c, s, submissionFile, u);
    
                        StringBuffer nextPage = new StringBuffer(50);
                        nextPage.append(getSessionInfo().getServletPath());
                        nextPage.append("?" + Constants.MODULE_KEY + "=ViewSubmissionSuccess&");
                        nextPage.append(Constants.SUBMISSION_ID + "=").append(s.getId());
                        setNextPage(nextPage.toString());
                        setIsNextPageInContext(false);
                    }
                }
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }

    /**
     * <p>Handles the case when an exception has been raised while processing the request. Attempts to delete the
     * uploaded file with submission from the local file system.</p>
     */
    protected void exceptionCallBack() {
        if (f != null) {
            try {
                f.delete();
            } catch (Throwable e) {
                log.error("Error attempting to remove file (" + f.getPath() + f.getName() + ") after exception: "
                          + e.getMessage());
            }
        }
    }

    /**
     * <p>Generates the alternate representations for the submission submitted by the specified user for specified
     * contest.</p>
     *
     * @param contest a <code>Contest</code> representing the contest which the submission belongs to.
     * @param submission a <code>Submission</code> providing the details for the submission.
     * @param submissionFile an <code>UploadedFile</code> representing the submission.
     * @param submitter a <code>User</code> representing the submitter.
     * @since TopCoder Studio Modifications Assembly (Req# 5.7)
     */
    private void generateAlternateRepresentations(Contest contest, Submission submission, UploadedFile submissionFile,
                                                  User submitter) {
        FileGenerator fileGenerator = new FileGenerator(contest, submission, submissionFile, submitter);
        Thread thread = new Thread(fileGenerator);
        thread.start();
    }

    /**
     * <p>A class implementing the thread job for generating the alternate representations for the submission submitted
     * by user to server.</p>
     *
     * @author isv
     * @version 1.0
     * @since TopCoder Studio Modifications Assembly (Req# 5.7)
     */
    private static class FileGenerator implements Runnable {

        /**
         * <p>A <code>String</code> array listing the formats currently supported by <code>Image Overlay</code>
         * component.</p>
         */
        private static final String[] IMAGE_OVERLAY_SUPPORTED_TYPES
                = {ImagePersistenceHandler.BMP_FORMAT, ImagePersistenceHandler.GIF_FORMAT,
                   ImagePersistenceHandler.JPG_FORMAT, ImagePersistenceHandler.PNG_FORMAT,
                   ImagePersistenceHandler.PNM_FORMAT, ImagePersistenceHandler.TIFF_FORMAT};

        /**
         * <p>A <code>Contest</code> representing the contest which the submission belongs to.</p>
         */
        private Contest contest;

        /**
         * <p>A <code>Submission</code> representing the submission submitted to server.</p>
         */
        private Submission submission;

        /**
         * <p>An <code>UploadedFile</code> providing the original content of submission.</p>
         */
        private UploadedFile submissionFile;

        /**
         * <p>A <code>User</code> representing the user who have submitted the submission.</p>
         */
        private User submitter;

        /**
         * <p>Constructs new <code>FileGenerator</code> instance to be used for generating the alternate representations
         * for specified submission.</p>
         *
         * @param contest a <code>Contest</code> representing the contest which the submission belongs to.
         * @param submission a <code>Submission</code> representing the submission submitted to server.
         * @param submissionFile an <code>UploadedFile</code> providing the original content of submission.
         * @param submitter a <code>User</code> representing the user who have submitted the submission.
         */
        private FileGenerator(Contest contest, Submission submission, UploadedFile submissionFile, User submitter) {
            this.contest = contest;
            this.submission = submission;
            this.submissionFile = submissionFile;
            this.submitter = submitter;
        }

        /**
         * <p>Executes the main job of the thread. Analyzes the submitted file and creates the files with alternate
         * representations of the submission.</p>
         */
        public void run() {
            HibernateUtils.begin();
            try {
                BundledFileAnalyzer analyzer = SubmissionValidator.getBundledFileParser(submission.getMimeType());
                analyzer.analyze(this.submissionFile.getInputStream(), true);

                // Generate "full" representation from preview file if it is provided
                if (analyzer.isPreviewFileAvailable()) {
                    byte[] previewFileContent = analyzer.getPreviewFileContent();
                    String fullName = SubmissionValidator.calcAlternateFileName(this.contest, this.submitter,
                                                                                this.submission,
                                                                                analyzer.getPreviewFilePath(), "full");
                    writeFile(fullName, previewFileContent);
                }

                // Generate "tiny", "small", "medium" representation from preview image if it is provided
                // Generate "full" representation from preview image if it is provided but preview file is not provided
                if (analyzer.isPreviewImageAvailable()) {
                    byte[] imageContent = analyzer.getPreviewImageContent();
                    String tinyName = SubmissionValidator.calcAlternateFileName(this.contest, this.submitter,
                                                                                this.submission,
                                                                                analyzer.getPreviewImagePath(), "tiny");
                    String smallName = SubmissionValidator.calcAlternateFileName(this.contest, this.submitter,
                                                                                 this.submission,
                                                                                 analyzer.getPreviewImagePath(),
                                                                                 "small");
                    String mediumName = SubmissionValidator.calcAlternateFileName(this.contest, this.submitter,
                                                                                  this.submission,
                                                                                  analyzer.getPreviewImagePath(),
                                                                                  "medium");
                    String imageName = SubmissionValidator.calcAlternateFileName(this.contest, this.submitter,
                                                                                 this.submission,
                                                                                 analyzer.getPreviewImagePath(),
                                                                                 "image");
                    String watermarkedImageName
                            = SubmissionValidator.calcAlternateFileName(this.contest, this.submitter, this.submission,
                                                                        analyzer.getPreviewImagePath(), "imagew");
                    writeFile(imageName, imageContent);
                    createWatermarkCopy(watermarkedImageName, true, -1, imageContent,
                                        analyzer.getPreviewImageFileType());
                    createWatermarkCopy(tinyName, false, TINY_IMAGE_SIZE, imageContent,
                                        analyzer.getPreviewImageFileType());
                    createWatermarkCopy(smallName, true, SMALL_IMAGE_SIZE, imageContent,
                                        analyzer.getPreviewImageFileType());
                    createWatermarkCopy(mediumName, true, MEDIUM_IMAGE_SIZE, imageContent,
                                        analyzer.getPreviewImageFileType());
                    if (!analyzer.isPreviewFileAvailable()) {
                        String fullName = SubmissionValidator.calcAlternateFileName(this.contest, this.submitter,
                                                                                    this.submission,
                                                                                    analyzer.getPreviewImagePath(),
                                                                                    "full");
                        createWatermarkCopy(fullName, true, -1, imageContent, analyzer.getPreviewImageFileType());
                    }
                }
            } catch (IOException e) {
                log.error("Could not generate alternate presentations for submission [" + this.submission.getId() + "]",
                          e);
            } catch (PersistenceException e) {
                log.error("Could not generate alternate presentations for submission [" + this.submission.getId() + "]",
                          e);
            } catch (FileDoesNotExistException e) {
                log.error("Could not generate alternate presentations for submission [" + this.submission.getId() + "]",
                          e);
            } catch (ImageException e) {
                log.error("Could not generate alternate presentations for submission [" + this.submission.getId() + "]",
                          e);
            } catch (ImagePersistenceException e) {
                log.error("Could not generate alternate presentations for submission [" + this.submission.getId() + "]",
                          e);
            } catch (UnsupportedFormatException e) {
                log.error("Could not generate alternate presentations for submission [" + this.submission.getId() + "]",
                          e);
            } catch (ImageOverlayProcessingException e) {
                log.error("Could not generate alternate presentations for submission [" + this.submission.getId() + "]",
                          e);
            } finally {
                HibernateUtils.closeSession();
            }
        }

        /**
         * <p>Generates the alternate representation of specified type for the specified image.</p>
         *
         * @param path a <code>String</code> providing the name of the file.
         * @param watermark <code>true</code> if create image copy must be watermarked; <code>false</code> otherwise.
         * @param maxSize an <code>int</code> providing the maximum size (in pixels) of the created copy or
         *        <code>-1</code> if original image size must be used.
         * @param imageContent a <code>byte</code> array providing the content of original image.
         * @param imageFileType a <code>StudioFileType</code> representing the file type for the image to be
         *        watermarked.
         * @throws IOException if an I/O error occurs while reading or writting image content.
         * @throws ImageException if original image can not be resized to specified size.
         * @throws ImagePersistenceException if original image can not be resized to specified size.
         * @throws UnsupportedFormatException if original image can not be resized to specified size.
         * @throws ImageOverlayProcessingException if original image can not be resized to specified size.
         */
        private void createWatermarkCopy(final String path, boolean watermark, int maxSize, final byte[] imageContent,
                                         final StudioFileType imageFileType) throws IOException, ImageException,
                                                                              ImagePersistenceException,
                                                                              UnsupportedFormatException,
                                                                              ImageOverlayProcessingException {
            // Map the image file type to image type supported by the Image Overlay components
            String imageFormat = null;
            String extension = imageFileType.getExtension();
            for (int i = 0; (imageFormat == null) && (i < IMAGE_OVERLAY_SUPPORTED_TYPES.length); i++) {
                if (IMAGE_OVERLAY_SUPPORTED_TYPES[i].equalsIgnoreCase(extension)) {
                    imageFormat = IMAGE_OVERLAY_SUPPORTED_TYPES[i];
                }
            }
            if (imageFormat == null) {
                throw new IllegalArgumentException("The image file type [" + extension + "] is not supported by Image "
                                                   + "Overlay component");
            }

            // A file which will hold the resized/watermarked image once the whole process succeeds
            File processedImageFile = new File(path);

            // Create temporary file to write the resized and watermarked image content to
            final File tempFile = File.createTempFile("studio", "tmp", new File(Constants.TEMPORARY_STORAGE_PATH));
            tempFile.deleteOnExit();

            try {
                ImageOverlayManager manager = new ImageOverlayManager();
                
                // Resize the original image if necessary to fit into specified dimension
                Image targetImage
                        = resizeIfNecessary(maxSize, maxSize, imageFormat, imageContent);

                // Watermark the original image if necessary
                if (watermark) {
                    // Get the overlay image and resize it if necessary to fit into target image dimension
                    byte[] overlayImageContent = readContent(new FileInputStream(Constants.WATERMARK_FILE_PATH));
                    Image overlayImage
                            = resizeOverlayImage(targetImage, Constants.WATERMARK_FILE_TYPE, overlayImageContent);

                    // Evaluate the offsets to place the overlay image over the target image
                    int widthOffset = Math.max(0, (targetImage.getWidth() - overlayImage.getWidth()) / 2);
                    int heightOffset = Math.max(0, (targetImage.getHeight() - overlayImage.getHeight()) / 2);

                    // Watermark the original image
                    TransparencySpecification transSpec = new TransparencySpecification();
                    transSpec.setColorTransparency(Constants.WATERMARK_OVERLAY_IMAGE_RED,
                                                   Constants.WATERMARK_OVERLAY_IMAGE_GREEN,
                                                   Constants.WATERMARK_OVERLAY_IMAGE_BLUE,
                                                   Constants.WATERMARK_OVERLAY_IMAGE_TRANSPARENCY);
                    transSpec.setImageTransparency(Constants.WATERMARK_BASE_IMAGE_TRANSPARENCY);
                    OverlaySpecification overlaySpec = new OverlaySpecification(transSpec,
                                                                                OverlayType.CROP_OVERLAY_IMAGE,
                                                                                widthOffset, heightOffset);
                    Watermarker watermarker = new Watermarker(manager, overlayImage, overlaySpec);
                    Image watermarkedImage = watermarker.watermarkImage(targetImage);
                    manager.storeImage(watermarkedImage, Constants.WATERMARK_FILE_TYPE, tempFile);

                    // Need to change the extension of the watermarked file as originally it corresponds to type of base
                    // image but the watermarked image is in overlay image format
                    int pos = path.lastIndexOf(".");
                    processedImageFile
                            = new File(path.substring(0, pos + 1) + Constants.WATERMARK_FILE_TYPE.toLowerCase());
                    // Once the whole process succeeds then copy the temporary file to target file
                    copyFiles(tempFile, processedImageFile);
                } else {
                    manager.storeImage(targetImage, imageFormat, processedImageFile);
                }
            } finally {
                tempFile.delete();
            }
        }

        /**
         * <p>Writes the specified content to specified file on disk.</p>
         *
         * @param path a <code>String</code> providing the name of the file.
         * @param content a <code>byte</code> array providing the content of the file to be written.
         * @throws IOException if an I/O error occurs while writting file content to disk.
         */
        private static void writeFile(String path, byte[] content) throws IOException {
            if (log.isDebugEnabled()) {
                log.debug("creating file: " + path);
            }
            FileOutputStream fos = new FileOutputStream(path, false);
            try {
                fos.write(content);
            } finally {
                fos.flush();
                fos.close();
            }
        }

        /**
         * <p>Writes the specified content to specified file on disk.</p>
         *
         * @param path a <code>String</code> providing the name of the file.
         * @param content an <code>InputStream</code> providing the content of the file to be written.
         * @throws IOException if an I/O error occurs while writting file content to disk.
         * @since TopCoder Studio Modifications Assembly v2 (Req# 5.10)
         */
/*
        private static void writeFile(String path, InputStream content) throws IOException {
            if (log.isDebugEnabled()) {
                log.debug("creating file: " + path);
            }
            byte[] buffer = new byte[4096];
            FileOutputStream fos = new FileOutputStream(path, false);
            try {
                int count;
                while ((count = content.read(buffer)) != -1) {
                    fos.write(buffer, 0, count);
                }
            } finally {
                fos.flush();
                fos.close();
            }
        }
*/

        /**
         * <p>Reads the content of specified stream into byte array.</p>
         *
         * @param content an <code>InputStream</code> providing the content of the file to be written.
         * @return a <code>byte</code> array providing the content read from specified string. 
         * @throws IOException if an I/O error occurs while writting file content to disk.
         * @since TopCoder Studio Modifications Assembly v2 (Req# 5.10)
         */
        private static byte[] readContent(InputStream content) throws IOException {
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            try {
                int count;
                while ((count = content.read(buffer)) != -1) {
                    baos.write(buffer, 0, count);
                }
            } finally {
                content.close();
            }
            return baos.toByteArray();
        }

        /**
         * <p>Copies the specified file to specified one.</p>
         *
         * @param from a <code>File</code> to be copied.
         * @param to a <code>File</code> referencing the new location of the copy.
         * @throws IOException if an I/O error occurs while writting file content to disk.
         */
        private static void copyFiles(File from, File to) throws IOException {
            if (log.isDebugEnabled()) {
                log.debug("copying file: " + from.getPath() + " to " + to.getPath());
            }
            FileInputStream fis = new FileInputStream(from);
            FileOutputStream fos = new FileOutputStream(to, false);

            try {
                byte[] buf = new byte[4096];
                int count = -1;
                while ((count = fis.read(buf)) != -1) {
                    fos.write(buf, 0, count);
                }
            } finally {
                fos.flush();
                fos.close();
                fis.close();
            }
        }

        /**
         * <p>Resizes the specified image to specified width and height (if necessary) keeping the original image aspect
         * ratio.</p>
         *
         * @param maxWidth an <code>int</code> providing the maximum width (in pixels) of the created copy or
         *        <code>-1</code> if original image width must be used.
         * @param maxHeight an <code>int</code> providing the maximum height (in pixels) of the created copy or
         *        <code>-1</code> if original image height must be used.
         * @param imageFormat a <code>String</code> referencing the type of the image.
         * @param imageContent an <code>InputStream</code> providing the content of the image.
         * @return an <code>Image</code> providing the content of the specified image possibly resized to specified
         *         width and height. 
         * @throws IOException if an I/O error occurs while reading or writting image content.
         * @throws ImageException if original image can not be resized to specified size.
         * @throws ImagePersistenceException if original image can not be resized to specified size.
         * @throws UnsupportedFormatException if original image can not be resized to specified size.
         * @since TopCoder Studio Modifications Assembly v2 (Req# 5.10)
         */
        private static Image resizeIfNecessary(int maxWidth, int maxHeight, String imageFormat,
                                               byte[] imageContent) throws ImagePersistenceException,
                                                                                UnsupportedFormatException, IOException,
                                                                                ImageException {
            ImageOverlayManager manager = new ImageOverlayManager();
            boolean mustResizeWidth = false;
            boolean mustResizeHeight = false;
            if (maxWidth != -1 || maxHeight != -1) {
                Image image = manager.loadImage(imageFormat, new ByteArrayInputStream(imageContent));
                int imageWidth = image.getWidth();
                int imageHeight = image.getHeight();
                if (maxWidth != -1) {
                    mustResizeWidth = (imageWidth > maxWidth);
                }
                if (maxHeight != -1) {
                    mustResizeHeight = (imageHeight > maxHeight);
                }
            }

            // Create temporary file to write the resized image content to
            final File tempFile = File.createTempFile("studio", "tmp", new File(Constants.TEMPORARY_STORAGE_PATH));
            tempFile.deleteOnExit();

            try {
                // Resize the image if necessary
                if (mustResizeWidth || mustResizeHeight) {
                    // Create temporary file with original image content
                    File fileToResize
                            = File.createTempFile("studio", "tmp", new File(Constants.TEMPORARY_STORAGE_PATH));
                    fileToResize.deleteOnExit();
                    writeFile(fileToResize.getPath(), imageContent);

                    try {
                        // Resize by width first if necessary
                        if (mustResizeWidth) {
                            ImageResizer resizer = new ImageResizer(fileToResize);
                            resizer.scaleToWidth(tempFile, maxWidth);
                            // Check again if resizing by height is still necessary
                            Image image = manager.loadImage(imageFormat, tempFile);
                            int imageHeight = image.getHeight();
                            if (maxHeight != -1) {
                                mustResizeHeight = (imageHeight > maxHeight);
                            }
                            if (mustResizeHeight) {
                                fileToResize.delete();
                                copyFiles(tempFile, fileToResize);
                                tempFile.delete();
                            }
                        }

                        // Resize by height if necessary
                        if (mustResizeHeight) {
                            ImageResizer resizer = new ImageResizer(fileToResize);
                            resizer.scaleToHeight(tempFile, maxHeight);
                        }
                        
                        return manager.loadImage(imageFormat, tempFile);
                    } finally {
                        fileToResize.delete();
                    }
                } else {
                    return manager.loadImage(imageFormat, new ByteArrayInputStream(imageContent));
                }
            } finally {
                tempFile.delete();
            }
        }

        /**
         * <p>Resizes the specified image to specified width and height (if necessary) keeping the original image aspect
         * ratio.</p>
         *
         * @param targetImage a <code>Image</code> representing the original image to be watermarked.
         * @param overlayImageFormat a <code>String</code> referencing the type of the overlay image.
         * @param overlayImageCOntent an <code>InputStream</code> providing the content of the overlay image.
         * @return an <code>Image</code> providing the content of the specified image possibly resized to specified
         *         width and height.
         * @throws IOException if an I/O error occurs while reading or writting image content.
         * @throws ImageException if original image can not be resized to specified size.
         * @throws ImagePersistenceException if original image can not be resized to specified size.
         * @throws UnsupportedFormatException if original image can not be resized to specified size.
         * @since TopCoder Studio Modifications Assembly v2 (Req# 5.10)
         */
        private static Image resizeOverlayImage(Image targetImage, String overlayImageFormat,
                                                byte[] overlayImageCOntent) throws ImagePersistenceException,
                                                                                   UnsupportedFormatException,
                                                                                   IOException,
                                                                                   ImageException {
            ImageOverlayManager manager = new ImageOverlayManager();
            Image overlayImage = manager.loadImage(overlayImageFormat, new ByteArrayInputStream(overlayImageCOntent));

            double widthAspect = overlayImage.getWidth() * 1.00 / targetImage.getWidth();
            double heightAspect = overlayImage.getHeight() * 1.00 / targetImage.getHeight();

            // Create temporary file to write the resized overlay image content to
            final File tempFile = File.createTempFile("studio", "tmp", new File(Constants.TEMPORARY_STORAGE_PATH));
            tempFile.deleteOnExit();

            // Create temporary file with original overlay image content
            File fileToResize
                    = File.createTempFile("studio", "tmp", new File(Constants.TEMPORARY_STORAGE_PATH));
            fileToResize.deleteOnExit();

            try {
                writeFile(fileToResize.getPath(), overlayImageCOntent);

                ImageResizer resizer = new ImageResizer(fileToResize);
                if (widthAspect > heightAspect) {
                    resizer.scaleToWidth(tempFile, targetImage.getWidth());
                } else {
                    resizer.scaleToHeight(tempFile, targetImage.getHeight());
                }
                return manager.loadImage(overlayImageFormat, tempFile);
            } finally {
                fileToResize.delete();
                tempFile.delete();
            }
        }
    }
}
