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
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageInputStream;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 20, 2006
 */
public class Submit extends BaseSubmissionDataProcessor {
    private File f = null;

    protected void dbProcessing() throws Exception {
        if (userLoggedIn()) {
            Long contestId;

            try {
                contestId = new Long(getRequest().getParameter(Constants.CONTEST_ID));
            } catch (NumberFormatException e) {
                throw new NavigationException("Invalid contest specified.");
            }

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
                ValidationResult submissionResult = new SubmissionValidator(c).validate(new ObjectInput(submissionFile));
                if (!submissionResult.isValid()) {
                    addError(Constants.SUBMISSION, submissionResult.getMessage());
                }

                ValidationResult rankResult = new IntegerValidator("Please input a valid integer for rank.").validate(new StringInput(rank));
                if (!rankResult.isValid()) {
                    addError(Constants.SUBMISSION_RANK, rankResult.getMessage());
                }

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
                    s.setOriginalFileName(submissionFile.getRemoteFileName());
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

                    String ext = submissionFile.getRemoteFileName().substring(submissionFile.getRemoteFileName().lastIndexOf('.'));

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
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }

    protected void exceptionCallBack() {
        if (f != null) {
            try {
                f.delete();
            } catch (Throwable e) {
                log.error("Error attempting to remove file (" + f.getPath() + f.getName() + ") after exception: " + e.getMessage());
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
     * @author TCSDEVELOPER
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
            log.debug("begin file processing");
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
                    writeFile(imageName, imageContent);
                    createWatermarkCopy(tinyName, false, 120, imageContent, analyzer.getPreviewImageFileType());
                    createWatermarkCopy(smallName, true, 300, imageContent, analyzer.getPreviewImageFileType());
                    createWatermarkCopy(mediumName, true, 555, imageContent, analyzer.getPreviewImageFileType());
                    if (!analyzer.isPreviewFileAvailable()) {
                        String fullName = SubmissionValidator.calcAlternateFileName(this.contest, this.submitter,
                                                                                    this.submission,
                                                                                    analyzer.getPreviewImagePath(),
                                                                                    "full");
                        createWatermarkCopy(fullName, true, -1, imageContent, analyzer.getPreviewImageFileType());
                    }
                }
            } catch (IOException e) {
                e.printStackTrace();
            } catch (PersistenceException e) {
                e.printStackTrace();
            } catch (FileDoesNotExistException e) {
                e.printStackTrace();
            } catch (ImageException e) {
                e.printStackTrace();
            } catch (ImagePersistenceException e) {
                e.printStackTrace();
            } catch (UnsupportedFormatException e) {
                e.printStackTrace();
            } catch (ImageOverlayProcessingException e) {
                e.printStackTrace();
            } finally {
                Session session = HibernateUtils.getSession();
                Transaction transaction = session.getTransaction();
                if (transaction != null && transaction.isActive()) {
                    session.flush();
                }
                HibernateUtils.commit();
//                HibernateUtils.close();
                HibernateUtils.closeSession();
            }
            log.debug("end file processing");
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
        private void createWatermarkCopy(String path, boolean watermark, int maxSize, byte[] imageContent,
                                         StudioFileType imageFileType) throws IOException, ImageException,
                                                                              ImagePersistenceException,
                                                                              UnsupportedFormatException,
                                                                              ImageOverlayProcessingException {

            ImageOverlayManager manager = new ImageOverlayManager();

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

            // Determine whether the original image must be resized or not
            boolean mustResize = false;
            if (maxSize != -1) {
                Image image = manager.loadImage(imageFormat, new ByteArrayInputStream(imageContent));
                int imageWidth = image.getWidth();
                mustResize = (imageWidth > maxSize);
            }

            // Resize the original image if necessary
            if (mustResize) {
                File tempFile = File.createTempFile("studio", "tmp", new File(Constants.ROOT_STORAGE_PATH+System.getProperty("file.separator")+Constants.SUBMISSIONS_DIRECTORY_NAME));
                tempFile.deleteOnExit();
                writeFile(tempFile.getPath(), imageContent);

                ImageResizer resizer = new ImageResizer(tempFile);
                File resizedPath = new File(path);
                resizer.scaleToWidth(resizedPath, maxSize);
                
                tempFile.delete();
            } else {
                writeFile(path, imageContent);
            }
            
            // Watermark the original image if necessary
            if (watermark) {
                Image overlayImage = manager.loadImage(Constants.WATERMARK_FILE_TYPE, Constants.WATERMARK_FILE_PATH);
                Image targetImage = manager.loadImage(imageFormat, path);

                TransparencySpecification transspec = new TransparencySpecification();
                transspec.setColorTransparency(Constants.WATERMARK_OVERLAY_IMAGE_RED,
                                               Constants.WATERMARK_OVERLAY_IMAGE_GREEN,
                                               Constants.WATERMARK_OVERLAY_IMAGE_BLUE,
                                               Constants.WATERMARK_OVERLAY_IMAGE_TRANSPARENCY);
                transspec.setImageTransparency(Constants.WATERMARK_BASE_IMAGE_TRANSPARENCY);
                OverlaySpecification overlaySpec = new OverlaySpecification(transspec,
                                                                            OverlayType.SCALE_FIT_OVERLAY_IMAGE, 0, 0);
                Watermarker watermarker = new Watermarker(manager, overlayImage, overlaySpec);
                Image watermarkedImage = watermarker.watermarkImage(targetImage);

                File imagePath = new File(path);
                manager.storeImage(watermarkedImage, Constants.WATERMARK_FILE_TYPE, imagePath);

                // Need to change the extension of the watermarked file as originally it corresponds to type of base
                // image but the watermarked image is in overlay image format
                int pos = path.lastIndexOf(".");
                File newImagePath = new File(path.substring(0, pos + 1) + Constants.WATERMARK_FILE_TYPE.toLowerCase());
                imagePath.renameTo(newImagePath);
            }
        }

        /**
         * <p>Writes the specified content to specified file on disk.</p>
         *
         * @param path a <code>String</code> providing the name of the file.
         * @param content a <code>byte</code> array providing the content of the file to be written.
         * @throws IOException if an I/O error occurs while writting file content to disk.
         */
        private void writeFile(String path, byte[] content) throws IOException {
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
    }
}
