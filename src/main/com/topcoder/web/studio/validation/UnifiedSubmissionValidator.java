/*
 * Copyright (C) 2005-2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.validation;

import com.topcoder.servlet.request.FileDoesNotExistException;
import com.topcoder.servlet.request.PersistenceException;
import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.validation.BasicResult;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.Validator;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.FileTypeDAO;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.ContestProperty;
import com.topcoder.web.studio.model.MimeType;
import com.topcoder.web.studio.model.StudioFileType;
import com.topcoder.web.studio.model.Submission;
import com.topcoder.web.studio.util.BundledFileAnalyzer;
import com.topcoder.web.studio.util.JarFileAnalyzer;
import com.topcoder.web.studio.util.ZipFileAnalyzer;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.text.MessageFormat;
import java.util.List;
import java.util.Map;

/**
 * <p>A validator for the submission files submitted by the users to server in context of specific contest. Implements
 * the logic for validating the submissions for providing non-empty source files as well as preview images or preview
 * files based on contest settings.</p>
 *
 * <p>Also provides a set of helpful static utility methods which could be used for determining the types of submitted
 * files, getting the file parsers based on file types, etc.</p>
 *
 * @author dok, isv
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 29, 2006
 */
public class UnifiedSubmissionValidator implements Validator {

    /**
     * <p>A <code>Logger</code> to be used for logging the events occurring in the course of submission validations.</p>
     */
    protected static final Logger log = Logger.getLogger(UnifiedSubmissionValidator.class);

    /**
     * <p>A <code>Contest</code> representing the contest which the submissions to be validated by this validator belong
     * to.</p>
     */
    private Contest contest;

    /**
     * <p>Constructs new <code>SubmissionValidator</code> instance to be used for validating the submissions in context
     * of specified contest.</p>
     *
     * @param contest a <code>Contest</code> which the submissions to be validated by this validator belong to. 
     */
    public UnifiedSubmissionValidator(Contest contest) {
        this.contest = contest;
    }

    /**
     * <p>Validates the specified input which is expected to provide the {@link UploadedFile} containing the submission
     * submitted by the user to server.</p>
     *
     * @param input a <code>ValidationInput</code> representing the submission to be validated.
     * @return a <code>ValidationResult</code> providing the result of submission validation. 
     */
    public ValidationResult validate(ValidationInput input) {
        UploadedFile submission = (UploadedFile) input.getInput();

        byte[] arr = null;
        if (submission == null) {
            return new BasicResult(false, "Submission was empty");
        } else if (submission.getContentType() == null) {
            return new BasicResult(false, "File type not included in submission.");
        }

        int ret = 0;
        MimeType mt = null;
        try {
            arr = new byte[(int) submission.getSize()];
            ret = submission.getInputStream().read(arr);
            mt = getMimeType(submission);
        } catch (FileDoesNotExistException e) {
            log.warn("Communication error when receiving submission.", e);
            return new BasicResult(false, "Communication error when receiving submission.");
        } catch (PersistenceException e) {
            log.warn("Communication error when receiving submission.", e);
            return new BasicResult(false, "Communication error when receiving submission.");
        } catch (IOException e) {
            log.warn("Communication error when receiving submission.", e);
        }

        if (ret == 0) {
            return new BasicResult(false, "Submission was empty");
        } else if (mt == null) {
            return new BasicResult(false, "Unknown file type submitted: " + submission.getContentType());
        } else if (!isBundledFile(mt)) {
            return new BasicResult(false, "Invalid file type submitted: " + submission.getContentType());
        } else {
            // at this point we have an actual submission file that's not empty and it's a bundled file
            // Since TopCoder Studio Modifications Assembly - additional validation logic is applied for bundled
            // files. Req# 5.6
            BundledFileAnalyzer fileParser = getBundledFileParser(mt);
            Map<Integer,String> contestConfig = this.contest.getConfigMap();
            boolean previewImageRequired
                    = Boolean.parseBoolean(contestConfig.get(ContestProperty.REQUIRE_PREVIEW_IMAGE));
            boolean previewFileRequired
                    = Boolean.parseBoolean(contestConfig.get(ContestProperty.REQUIRE_PREVIEW_FILE));

            try {
                fileParser.analyze(new ByteArrayInputStream(arr), false);
                                
                boolean nativeSubmissionProvided = fileParser.isNativeSubmissionAvailable();
                boolean previewImageProvided = !previewImageRequired || fileParser.isPreviewImageAvailable();
                boolean previewFileProvided = !previewFileRequired || fileParser.isPreviewFileAvailable();
                if (!nativeSubmissionProvided) {
                    return new BasicResult(false, Constants.ERROR_MSG_NO_NATIVE_SUBMISSION);
                }
                if (!previewImageProvided) {
                    return new BasicResult(false, Constants.ERROR_MSG_NO_PREVIEW_IMAGE);
                }
                if (!previewFileProvided) {
                    return new BasicResult(false, Constants.ERROR_MSG_NO_PREVIEW_FILE);
                }
            } catch (IOException e) {
                log.error("Could not validate the input due to I/O error", e);
                return new BasicResult(false, "Communication error when receiving submission.");
            }
        }

        return ValidationResult.SUCCESS;
    }

    /**
     * Figure out the mime type for the given submission.
     * also do a second level of checking because some client machines don't identify the mime type correctly.  so
     * we'll be a bit lenient.  if they get the extension right, return the first mime type associated with the file
     * type identified by the extension.
     *
     * @param submission the submission file
     * @return the mime type of the submission
     * @throws FileDoesNotExistException when the uploaded file doesn't exist
     * @throws PersistenceException      not sure when, see FileUpload component docs
     */
    public static MimeType getMimeType(UploadedFile submission) throws FileDoesNotExistException, PersistenceException {
        MimeType mt = StudioDAOUtil.getFactory().getMimeTypeDAO().find(submission.getContentType());

        // BUGR-4567
        if(submission.getContentType().equals("application/octet-stream")){
             String ext = submission.getRemoteFileName().substring(submission.getRemoteFileName().lastIndexOf('.') + 1);
             if(ext.equals("zip")) mt = StudioDAOUtil.getFactory().getMimeTypeDAO().find("application/zip");
        }
                
        if (mt == null) {
            log.info("didn't find mime type " + submission.getContentType());
            String ext = submission.getRemoteFileName().substring(submission.getRemoteFileName().lastIndexOf('.') + 1);
            for (StudioFileType ft : StudioDAOUtil.getFactory().getFileTypeDAO().getFileTypes()) {
                if (ft.getExtension().equals(ext)) {
                    mt = ft.getMimeTypes().iterator().next();
                }
            }
        }
        return mt;
    }

    /**
     * <p>Gets the parser for the bundled file corresponding to specified mime type.</p>
     *
     * @param mimeType a <code>MimeType</code> providing the type of submission file.
     * @return a <code>BundledFileAnalyzer</code> which could be used for parsing the provided bundled file.
     * @throws IllegalArgumentException if specified mime type does not correspond to bundled files or there is no
     *         parser mapped to specified mime type.
     * @since TopCoder Studio Modifications Assembly (Req# 5.6)
     */
    public static BundledFileAnalyzer getBundledFileParser(MimeType mimeType) {
        StudioFileType fileType = mimeType.getFileType();
        Integer fileTypeId = fileType.getId();
        if (!fileType.isBundledFile()) {
            throw new IllegalArgumentException(MessageFormat.format(Constants.ERROR_MSG_NOT_BUNDLED_FILE, fileTypeId));
        }
        if (StudioFileType.ZIP_ARCHIVE_TYPE_ID.equals(fileTypeId)) {
            return new ZipFileAnalyzer();
        } else if (StudioFileType.JAR_ARCHIVE_TYPE_ID.equals(fileTypeId)) {
            return new JarFileAnalyzer();
        } else {
            throw new IllegalArgumentException(MessageFormat.format(Constants.ERROR_MSG_NO_BUNDLED_FILE_PARSER,
                                                                    fileTypeId));
        }
    }

    /**
     * <p>Calculates the name for the file with the alternate representation of specified type for specified
     * submission.</p>
     *
     * @param contest a <code>Contest</code> representing the contest which the submission belongs to.
     * @param user a <code>User</code> representing the user who have submitted the submission.
     * @param submission a <code>Submission</code> representing the submission submitted to server.
     * @param originalFileName a <code>String</code> providing the original name for the file.
     * @param type a <code>String</code> specifying the type of file to be created ("tiny", "small", "medium" or
     *        "full").
     * @return a <code>String</code> providing the path to file with content of specified type for specified
     *         submission.
     * @since TopCoder Studio Modifications Assembly (Req# 5.7)
     */
    public static String calcAlternateFileName(Contest contest, User user, Submission submission,
                                               String originalFileName, String type) {
        String sep = System.getProperty("file.separator");
        String ext = originalFileName.substring(originalFileName.lastIndexOf('.'));
        StringBuilder buffer = new StringBuilder(80);
        buffer.append(Constants.ROOT_STORAGE_PATH);
        buffer.append(sep);
        buffer.append(Constants.SUBMISSIONS_DIRECTORY_NAME);
        buffer.append(sep);
        buffer.append(contest.getId());
        buffer.append(sep);
        buffer.append(user.getHandle().toLowerCase());
        buffer.append("_");
        buffer.append(user.getId());
        buffer.append(sep);
        buffer.append(submission.getId());
        buffer.append("_");
        buffer.append(type);
        buffer.append(ext);
        return buffer.toString();
    }

    /**
     * <p>Determines the type of the file matching the specified name.</p>
     *
     * @param fileName a <code>String</code> providing the name of the file.
     * @return a <code>StudioFileType</code> representing the file type corresponding to specified entry or
     *         <code>null</code> if the type of the entry is not recognized.
     * @since TopCoder Studio Modifications Assembly (Req# 5.7, 5.11)
     */
    public static StudioFileType getFileType(String fileName) {
        FileTypeDAO fileTypeDAO = StudioDAOUtil.getFactory().getFileTypeDAO();
        List<StudioFileType> fileTypes = fileTypeDAO.getFileTypes();
        int pos = fileName.lastIndexOf('.');
        String extension = fileName.substring(pos + 1);
        for (StudioFileType fileType : fileTypes) {
            if (extension.equalsIgnoreCase(fileType.getExtension())) {
                return fileType;
            }
        }
        return null;
    }

    /**
     * <p>Gets the name of the file from the specified full path to the file.</p>
     *
     * @param fullPath a <code>Contest</code> representing the full path to the file.
     * @return a <code>String</code> providing just the name of the file referenced by the specified path. 
     * @since Studio Submission Slideshow
     */
    public static String getFileName(String fullPath) {
        String sep = System.getProperty("file.separator");
        int pos = fullPath.lastIndexOf(sep);
        return fullPath.substring(pos + 1);
    }

    /**
     * <p>Gets the parser for the bundled file corresponding to specified file path.</p>
     *
     * @param filePath a <code>MimeType</code> providing the path to file.
     * @return a <code>BundledFileAnalyzer</code> which could be used for parsing the provided bundled file.
     * @throws IllegalArgumentException if specified mime type does not correspond to bundled files or there is no
     *         parser mapped to specified mime type.
     * @since Studio Submission Slideshow
     */
    public static BundledFileAnalyzer getBundledFileParser(String filePath) {
        StudioFileType fileType = getFileType(filePath);
        Integer fileTypeId = fileType.getId();
        if (!fileType.isBundledFile()) {
            throw new IllegalArgumentException(MessageFormat.format(Constants.ERROR_MSG_NOT_BUNDLED_FILE, fileTypeId));
        }
        if (StudioFileType.ZIP_ARCHIVE_TYPE_ID.equals(fileTypeId)) {
            return new ZipFileAnalyzer();
        } else if (StudioFileType.JAR_ARCHIVE_TYPE_ID.equals(fileTypeId)) {
            return new JarFileAnalyzer();
        } else {
            throw new IllegalArgumentException(MessageFormat.format(Constants.ERROR_MSG_NO_BUNDLED_FILE_PARSER,
                                                                    fileTypeId));
        }
    }

    /**
     * <p>Checks whether the specified mime type corresponds to bundled file or not.</p>
     *
     * @param mimeType a <code>MimeType</code> providing the type of submission file.
     * @return <code>true</code> if specified mime type corresponds to a bundled file; <code>false</code> otherwise.
     * @since TopCoder Studio Modifications Assembly (Req# 5.6)
     */
    public static boolean isBundledFile(MimeType mimeType) {
        return mimeType.getFileType().isBundledFile();
    }
}
