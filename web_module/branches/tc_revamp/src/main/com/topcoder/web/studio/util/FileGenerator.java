/*
 * Copyright (C) 2001 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

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
import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.image.manipulation.Image;
import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.common.dao.ImageDAO;
import com.topcoder.web.common.model.Path;
import com.topcoder.web.common.model.User;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.DAOUtil;
import com.topcoder.web.studio.dao.SubmissionDAO;
import com.topcoder.web.studio.dto.FileType;
import com.topcoder.web.studio.dto.Project;
import com.topcoder.web.studio.dto.Submission;
import com.topcoder.web.studio.dto.SubmissionImage;
import com.topcoder.web.studio.validation.UnifiedSubmissionValidator;
import static com.topcoder.web.common.model.Image.*;

/**
 * <p>A class implementing the thread job for generating the alternate representations for the submission submitted
 * by user to server.</p>
 *
 * <p>
 *   Version 1.2 (Re-platforming Studio Release 3 Assembly) Change notes:
 *   <ol>
 *     <li>Updated the logic to use contests hosted in <code>tcs_catalog</code> database instead of
 *     <code>studio_oltp</code> database.</li>
 *   </ol>
 * </p>
 * 
 * <p>
 * Version 1.3 (Replatforming Studio Release 5) change notes:
 *   <ol>
 *     <li>Using the dto classes in com.topcoder.web.studio.dto package instead of in com.topcoder.web.common.model.comp package.</li>
 *   </ol>
 * </p>
 *
 * @author isv, dok, pvmagacho, TCSASSEMBER
 * @version 1.2
 * @since TopCoder Studio Modifications Assembly (Req# 5.7)
 */
public class FileGenerator implements Runnable {
    private static final Logger log = Logger.getLogger(FileGenerator.class);
    
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
     * <p>An <code>int</code> providing the maximum size (in pixels) for the <code>medium</code> presentations of the
     * preview images.</p>
     *
     * @since Studio Submission Slideshow
     */
    private static final int ORIGINAL_IMAGE_SIZE = -1;

    /**
     * <p>An <code>Integer</code> array referencing the image types corresponding to non-watermarked image galleries.
     * </p>
     *
     * @since Studio Submission Slideshow
     */
    private static final Integer[] GALLERY_PLAIN_IMAGE_TYPE_IDS
            = new Integer[]{GALLERY_THUMBNAIL_TYPE_ID, GALLERY_SMALL_TYPE_ID, GALLERY_MEDIUM_TYPE_ID,
            GALLERY_FULL_TYPE_ID};

    /**
     * <p>An <code>Integer</code> array providing the sizes of the non-watermarked gallery images.</p>
     *
     * @since Studio Submission Slideshow
     */
    private static final int[] GALLERY_PLAIN_IMAGE_SIZES
            = new int[]{TINY_IMAGE_SIZE, SMALL_IMAGE_SIZE, MEDIUM_IMAGE_SIZE, ORIGINAL_IMAGE_SIZE};

    /**
     * <p>An <code>Integer</code> array referencing the image types corresponding to watermarked image galleries.</p>
     *
     * @since Studio Submission Slideshow
     */
    private static final Integer[] GALLERY_WATERMARKED_IMAGE_TYPE_IDS
            = new Integer[]{GALLERY_SMALL_WATERMARKED_TYPE_ID, GALLERY_MEDIUM_WATERMARKED_TYPE_ID,
            GALLERY_FULL_WATERMARKED_TYPE_ID};

    /**
     * <p>An <code>Integer</code> array providing the sizes of the watermarked gallery images.</p>
     *
     * @since Studio Submission Slideshow
     */
    private static final int[] GALLERY_WATERMARKED_IMAGE_SIZES
            = new int[]{SMALL_IMAGE_SIZE, MEDIUM_IMAGE_SIZE, ORIGINAL_IMAGE_SIZE};


    /**
     * <p>A <code>String</code> array listing the formats currently supported by <code>Image Overlay</code>
     * component.</p>
     */
    private static final String[] IMAGE_OVERLAY_SUPPORTED_TYPES
            = {ImagePersistenceHandler.BMP_FORMAT, ImagePersistenceHandler.GIF_FORMAT,
            ImagePersistenceHandler.JPG_FORMAT, ImagePersistenceHandler.PNG_FORMAT,
            ImagePersistenceHandler.PNM_FORMAT, ImagePersistenceHandler.TIFF_FORMAT};

    /**
     * <p>A <code>Project</code> representing the project which the submission belongs to.</p>
     */
    private Project project;

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
     * @param project        a <code>Project</code> representing the project which the submission belongs to.
     * @param submission     a <code>Submission</code> representing the submission submitted to server.
     * @param submissionFile an <code>InputStream</code> providing the original content of submission.
     * @param submitter      a <code>User</code> representing the user who have submitted the submission.
     */
    public FileGenerator(Project project, Submission submission, UploadedFile submissionFile, User submitter) {
        this.project = project;
        this.submission = submission;
        this.submissionFile = submissionFile;
        this.submitter = submitter;
    }

    /**
     * <p>Executes the main job of the thread.</p>
     */
    public void run() {
        generateFiles();
    }

    /**
     * <p>Analyzes the submitted file and creates the files with alternate
     * representations of the submission. It is provided for convenience in the case that
     * the caller does not want to process files asynchronously.</p>
     */
    public void generateFiles() {
        long start = System.currentTimeMillis();
        long submissionId = this.submission.getId();
        HibernateUtils.begin();
        boolean success = false;
        try {
            SubmissionDAO submissionDAO = DAOUtil.getFactory().getSubmissionDAO();

            String fileName = this.submission.getUpload().getParameter();
            BundledFileAnalyzer analyzer = UnifiedSubmissionValidator.getBundledFileParser(fileName);
            analyzer.analyze(this.submissionFile.getInputStream(), true);

            // Holds a flag indicating whether the submission has been updated and needs the changes to be saved
            // to persistent data store
            boolean submissionUpdated = false;

            // If preview image is provided with the submission then treat it as a first image from the gallery (even
            // though the project may not require to include gallery)
            int fileIndex = 1;
            if (analyzer.isPreviewImageAvailable()) {
                fileName = null;
                try {
                    fileName = UnifiedSubmissionValidator.getFileName(analyzer.getPreviewImagePath());
                    byte[] fileContent = analyzer.getPreviewImageContent();
                    FileType fileType = analyzer.getPreviewImageFileType();
                    generateImages(fileName, fileContent, fileType, GALLERY_PLAIN_IMAGE_TYPE_IDS, GALLERY_PLAIN_IMAGE_SIZES,
                                   false, fileIndex);
                    generateImages(fileName, fileContent, fileType, GALLERY_WATERMARKED_IMAGE_TYPE_IDS,
                                   GALLERY_WATERMARKED_IMAGE_SIZES, true, fileIndex);
                    generatePreviewImagePresentations(fileContent, fileType, fileName, analyzer.isPreviewFileAvailable());
                    fileIndex++;
                    submissionUpdated = true;
                } catch (Exception e) {
                    log.error("Failed to generate alternate presentations for preview image [" + fileName + "]", e);
                }
            }

            // Generate "preview" representation and gallery images from preview file if it is provided
            if (analyzer.isPreviewFileAvailable()) {
                byte[] previewFileContent = analyzer.getPreviewFileContent();
                String fullName = UnifiedSubmissionValidator.calcAlternateFileName(this.project, this.submitter,
                                                                            this.submission,
                                                                            analyzer.getPreviewFilePath(), "preview");
                writeFile(fullName, previewFileContent);

                // Since Studio Submission Slideshow - generate gallery images if necessary
                // reload the contest type from the db since this object was created in another session.
                // there may be reason to reload all of the objects given to this inner class, but we'll start here.
                if (Constants.GALLERY_IDS.contains(this.project.getCategoryId())) {
                    BundledFileAnalyzer previewFileAnalyzer
                            = UnifiedSubmissionValidator.getBundledFileParser(analyzer.getPreviewFilePath());
                    Map<String, byte[]> files = previewFileAnalyzer.getFiles(previewFileContent);
                    for (Map.Entry<String, byte[]> file : files.entrySet()) {
                        fileName = null;
                        try {
                            fileName = file.getKey();
                            if (log.isDebugEnabled()) {
                                log.debug("generating for " + fileName);
                            }
                            byte[] fileContent = file.getValue();
                            FileType fileType = UnifiedSubmissionValidator.getFileType(fileName);
                            if ((fileType != null) && fileType.getImageFile()) {
                                generateImages(fileName, fileContent, fileType,
                                        GALLERY_PLAIN_IMAGE_TYPE_IDS, GALLERY_PLAIN_IMAGE_SIZES, false,
                                        fileIndex);
                                generateImages(fileName, fileContent, fileType,
                                        GALLERY_WATERMARKED_IMAGE_TYPE_IDS, GALLERY_WATERMARKED_IMAGE_SIZES,
                                        true, fileIndex);

                                // Use the first image from the gallery as preview image
                                if (fileIndex == 1) {
                                    generatePreviewImagePresentations(fileContent, fileType, fileName,
                                                                      analyzer.isPreviewFileAvailable());
                                }

                                fileIndex++;
                                submissionUpdated = true;
                            }
                        } catch (Exception e) {
                            log.error("Failed to generate alternate presentations for gallery image ["
                                      + fileName + "]", e);
                        }
                    }
                }
            }

            // If submission images have been generated then saves updated submission to data store
            if (submissionUpdated) {
                submissionDAO.saveOrUpdate(this.submission);
            }
            success = true;
        } catch (IOException e) {
            log.error("Could not generate alternate presentations for submission [" + this.submission.getId() + "]",
                    e);
        } catch (Throwable e) {
            log.error("Could not generate alternate presentations for submission [" + this.submission + "]",
                    e);
        } finally {
            if (success) {
                HibernateUtils.getSession().flush();
                HibernateUtils.commit();
            } else {
                if (HibernateUtils.getSession().getTransaction().isActive()) {
                    HibernateUtils.rollback();
                }
            }
            HibernateUtils.closeSession();
        }
        if (log.isInfoEnabled()) {
            log.info(new StringBuilder(100).append("generating images for submission ").
                    append(submissionId).append(" took ").append(System.currentTimeMillis() - start).append(" ms"));
        }

    }


    /**
     * <p>Generates the alternate presentations for the specified preview image.</p>
     *
     * @param imageContent         a <code>byte</code> array providing the content of the original image.
     * @param previewImageFileType a <code>StudioFileType</code> representing the type of the preview image.
     * @param previewImagePath     a <code>String</code> providing the path to preview image within submission.
     * @param previewFileAvailable <code>true</code> if preview file is available in the submission;
     *                             <code>false</code> otherwise.
     * @throws IOException                if an I/O error occurs while reading or writing image content.
     * @throws ImageException             if original image can not be resized to specified size.
     * @throws ImagePersistenceException  if original image can not be resized to specified size.
     * @throws UnsupportedFormatException if original image can not be resized to specified size.
     * @throws ImageOverlayProcessingException
     *                                    if original image can not be resized to specified size.
     */
    private void generatePreviewImagePresentations(byte[] imageContent, FileType previewImageFileType,
                                                   String previewImagePath, boolean previewFileAvailable)
            throws IOException, ImageException, ImagePersistenceException, UnsupportedFormatException,
            ImageOverlayProcessingException {
        String imageName = UnifiedSubmissionValidator.calcAlternateFileName(this.project, this.submitter, this.submission,
                                                                     previewImagePath, "image");
        String watermarkedImageName
                = UnifiedSubmissionValidator.calcAlternateFileName(this.project, this.submitter, this.submission,
                                                            previewImagePath, "imagew");
        writeFile(imageName, imageContent);
        createPresentation(watermarkedImageName, true, ORIGINAL_IMAGE_SIZE, imageContent, previewImageFileType);

        if (!previewFileAvailable) {
            String fullName = UnifiedSubmissionValidator.calcAlternateFileName(this.project, this.submitter,
                    this.submission, previewImagePath,
                    "preview");
            createPresentation(fullName, true, ORIGINAL_IMAGE_SIZE, imageContent, previewImageFileType);
        }
    }

    /**
     * @param originalImagePath a <code>String</code> providing the path to original image file.
     * @param imageContent      a <code>byte</code> array providing the content of the original image.
     * @param imageFileType     a <code>StudioFileType</code> representing the type of the original image.
     * @param imageTypeIds      a <code>Integer</code> array listing the IDs of type for the images to be generated.
     * @param imageTypeSizes    an <code>int</code> array listing the sizes of the images to be generated.
     * @param watermark         <code>true</code> if generated images must be watermarked; <code>false</code> otherwise.
     * @param fileIndex         an <code>int</code> providing the index of the original image in collection of images of
     *                          same image_type.
     * @throws IOException                if an I/O error occurs while reading or writing image content.
     * @throws ImageException             if original image can not be resized to specified size.
     * @throws ImagePersistenceException  if original image can not be resized to specified size.
     * @throws UnsupportedFormatException if original image can not be resized to specified size.
     * @throws ImageOverlayProcessingException
     *                                    if original image can not be resized to specified size.
     */
    private void generateImages(String originalImagePath, byte[] imageContent, FileType imageFileType,
                                Integer[] imageTypeIds, int[] imageTypeSizes, boolean watermark, int fileIndex)
            throws IOException, ImageException, ImagePersistenceException, UnsupportedFormatException,
            ImageOverlayProcessingException {
        ImageDAO imageDAO = DAOUtil.getFactory().getImageDAO();
        for (int i = 0; i < imageTypeIds.length; i++) {
            int imageTypeId = imageTypeIds[i];
            int imageSize = imageTypeSizes[i];
            String imageFileName
                    = UnifiedSubmissionValidator.calcAlternateFileName(this.project, this.submitter, this.submission,
                    originalImagePath,
                    String.valueOf(imageTypeId) + "_" + fileIndex);
            Image presentation = createPresentation(imageFileName, watermark, imageSize, imageContent,
                    imageFileType);

            // Generate image and save it to persistent data store
            Path imagePath = new Path();
            imagePath.setPath(Util.createSubmissionPath(this.project, this.submitter));
            DAOUtil.getFactory().getPathDAO().saveOrUpdate(imagePath);

            com.topcoder.web.common.model.Image image = new com.topcoder.web.common.model.Image();
            String justFileName = UnifiedSubmissionValidator.getFileName(imageFileName);
            if (watermark) { // If the image is watermarked then the extension must be changed to match the type of
                // watermarked image
                int pos = justFileName.lastIndexOf(".");
                image.setFileName(justFileName.substring(0, pos + 1) + Constants.WATERMARK_FILE_TYPE.toLowerCase());
            } else {
                image.setFileName(justFileName);
            }

            image.setHeight(presentation.getHeight());
            image.setImageTypeId(imageTypeId);
            image.setNew(true);
            image.setOriginalFileName(UnifiedSubmissionValidator.getFileName(originalImagePath));
            image.setPath(imagePath);
            image.setWidth(presentation.getWidth());
            imageDAO.saveOrUpdate(image);

            // Map submission to generated image
            SubmissionImage submissionImage = new SubmissionImage();
            submissionImage.setSubmission(this.submission);
            submissionImage.setImage(image);
            submissionImage.setSortIndex(fileIndex);
            this.submission.getImages().add(submissionImage);
        }
    }

    /**
     * <p>Generates the alternate representation of specified type for the specified image.</p>
     *
     * @param path          a <code>String</code> providing the name of the file.
     * @param watermark     <code>true</code> if create image copy must be watermarked; <code>false</code> otherwise.
     * @param maxSize       an <code>int</code> providing the maximum size (in pixels) of the created copy or
     *                      <code>-1</code> if original image size must be used.
     * @param imageContent  a <code>byte</code> array providing the content of original image.
     * @param imageFileType a <code>StudioFileType</code> representing the file type for the image to be
     *                      watermarked.
     * @return an <code>Image</code> representing the image providing the requested presentation of the specified
     *         image.
     * @throws IOException                if an I/O error occurs while reading or writing image content.
     * @throws ImageException             if original image can not be resized to specified size.
     * @throws ImagePersistenceException  if original image can not be resized to specified size.
     * @throws UnsupportedFormatException if original image can not be resized to specified size.
     * @throws ImageOverlayProcessingException
     *                                    if original image can not be resized to specified size.
     */
    private Image createPresentation(final String path, boolean watermark, int maxSize, final byte[] imageContent,
                                     final FileType imageFileType) throws IOException, ImageException,
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
            Image targetImage = resizeIfNecessary(maxSize, maxSize, imageFormat, imageContent);

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
                return watermarkedImage;
            } else {
                manager.storeImage(targetImage, imageFormat, processedImageFile);
                return targetImage;
            }
        } finally {
            tempFile.delete();
        }
    }

    /**
     * <p>Writes the specified content to specified file on disk.</p>
     *
     * @param path    a <code>String</code> providing the name of the file.
     * @param content a <code>byte</code> array providing the content of the file to be written.
     * @throws IOException if an I/O error occurs while writing file content to disk.
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
     * <p>Reads the content of specified stream into byte array.</p>
     *
     * @param content an <code>InputStream</code> providing the content of the file to be written.
     * @return a <code>byte</code> array providing the content read from specified string.
     * @throws IOException if an I/O error occurs while writing file content to disk.
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
     * @param to   a <code>File</code> referencing the new location of the copy.
     * @throws IOException if an I/O error occurs while writing file content to disk.
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
     * @param maxWidth     an <code>int</code> providing the maximum width (in pixels) of the created copy or
     *                     <code>-1</code> if original image width must be used.
     * @param maxHeight    an <code>int</code> providing the maximum height (in pixels) of the created copy or
     *                     <code>-1</code> if original image height must be used.
     * @param imageFormat  a <code>String</code> referencing the type of the image.
     * @param imageContent an <code>InputStream</code> providing the content of the image.
     * @return an <code>Image</code> providing the content of the specified image possibly resized to specified
     *         width and height.
     * @throws IOException                if an I/O error occurs while reading or writing image content.
     * @throws ImageException             if original image can not be resized to specified size.
     * @throws ImagePersistenceException  if original image can not be resized to specified size.
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
        if (maxWidth != ORIGINAL_IMAGE_SIZE || maxHeight != ORIGINAL_IMAGE_SIZE) {
            ByteArrayInputStream stream = new ByteArrayInputStream(imageContent);
            Image image = manager.loadImage(imageFormat, stream);
            int imageWidth = image.getWidth();
            int imageHeight = image.getHeight();
            if (maxWidth != ORIGINAL_IMAGE_SIZE) {
                mustResizeWidth = (imageWidth > maxWidth);
            }
            if (maxHeight != ORIGINAL_IMAGE_SIZE) {
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
     * @param targetImage         a <code>Image</code> representing the original image to be watermarked.
     * @param overlayImageFormat  a <code>String</code> referencing the type of the overlay image.
     * @param overlayImageCOntent an <code>InputStream</code> providing the content of the overlay image.
     * @return an <code>Image</code> providing the content of the specified image possibly resized to specified
     *         width and height.
     * @throws IOException                if an I/O error occurs while reading or writing image content.
     * @throws ImageException             if original image can not be resized to specified size.
     * @throws ImagePersistenceException  if original image can not be resized to specified size.
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
