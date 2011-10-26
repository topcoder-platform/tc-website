/*
 * Copyright (C) 2005-2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.validation;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.text.MessageFormat;
import java.util.List;

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
import com.topcoder.web.studio.dao.DAOUtil;
import com.topcoder.web.studio.dto.FileType;
import com.topcoder.web.studio.dto.Project;
import com.topcoder.web.studio.dto.Submission;
import com.topcoder.web.studio.util.BundledFileAnalyzer;
import com.topcoder.web.studio.util.JarFileAnalyzer;
import com.topcoder.web.studio.util.Util;
import com.topcoder.web.studio.util.ZipFileAnalyzer;

/**
 * <p>A validator for the submission files submitted by the users to server in context of specific contest. Implements
 * the logic for validating the submissions for providing non-empty source files as well as preview images or preview
 * files based on contest settings.</p>
 *
 * <p>Also provides a set of helpful static utility methods which could be used for determining the types of submitted
 * files, getting the file parsers based on file types, etc.</p>
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
 *   Version 1.3 (Re-platforming Studio Release 4 Assembly) Change notes:
 *   <ol>
 *     <li>Fixed {@link #getFileType(String) and {@link #getBundledFileParser(String)} javadocs, removing old studio model
 *         references.</li>
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
 * @author dok, isv, pvmagacho, TCSASSEMBER
 * @version 1.4
 */
public class UnifiedSubmissionValidator implements Validator {

    /**
     * <p>A <code>Logger</code> to be used for logging the events occurring in the course of submission validations.</p>
     */
    protected static final Logger log = Logger.getLogger(UnifiedSubmissionValidator.class);

    /**
     * <p>A <code>Project</code> representing the contest which the submissions to be validated by this validator belong
     * to.</p>
     */
    private Project project;

    /**
     * <p>Constructs new <code>UnifiedSubmissionValidator</code> instance to be used for validating the submissions in context
     * of specified contest.</p>
     *
     * @param contest a <code>Project</code> which the submissions to be validated by this validator belong to. 
     */
    public UnifiedSubmissionValidator(Project project) {
        this.project = project;
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
        try {
            arr = new byte[(int) submission.getSize()];
            ret = submission.getInputStream().read(arr);
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
        } else {
            // at this point we have an actual submission file that's not empty and it's a bundled file
            // Since TopCoder Studio Modifications Assembly - additional validation logic is applied for bundled
            // files. Req# 5.6
            BundledFileAnalyzer fileParser;
            try {
                fileParser = getBundledFileParser(submission.getRemoteFileName());
            } catch (PersistenceException e) {
                log.warn("Error getting bundled file parser.", e);
                return new BasicResult(false, "Error getting bundled file parser.");
            } catch (FileDoesNotExistException e) {
                log.warn("Error getting bundled file parser.", e);
                return new BasicResult(false, "Error getting bundled file parser.");
            }
            
            try {
                fileParser.analyze(new ByteArrayInputStream(arr), false);
                                
                boolean nativeSubmissionProvided = fileParser.isNativeSubmissionAvailable();
                boolean previewImageProvided = fileParser.isPreviewImageAvailable();
                boolean previewFileProvided = fileParser.isPreviewFileAvailable();
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
    public static String calcAlternateFileName(Project contest, User user, Submission submission,
                                               String originalFileName, String type) {
        String ext = originalFileName.substring(originalFileName.lastIndexOf('.'));
        StringBuilder buffer = new StringBuilder(80);
        buffer.append(Util.createSubmissionPath(contest, user));
        buffer.append(submission.getId());
        buffer.append("_");
        buffer.append(type);
        buffer.append(ext);
        return buffer.toString();
    }

    /**
     * <p>Determines the file type of the file matching the specified name.</p>
     *
     * @param fileName a <code>String</code> providing the name of the file.
     * @return a <code>FileType</code> representing the file type corresponding to specified entry or
     *         <code>null</code> if the type of the entry is not recognized.
     * @since TopCoder Studio Modifications Assembly (Req# 5.7, 5.11)
     */
    public static FileType getFileType(String fileName) {
        List<FileType> fileTypes = DAOUtil.getFactory().getFileTypeCatalogDAO().getFileTypes();
        int pos = fileName.lastIndexOf('.');
        String extension = fileName.substring(pos + 1);
        for (FileType fileType : fileTypes) {
            if (log.isDebugEnabled()) {
                log.debug("Comparing " + extension + " to " + fileType.getExtension() + " = " 
                        + extension.equalsIgnoreCase(fileType.getExtension()));
            }
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
     * @param filePath a <code>String</code> providing the path to file.
     * @return a <code>BundledFileAnalyzer</code> which could be used for parsing the provided bundled file.
     * @throws IllegalArgumentException if specified file type does not correspond to bundled files or there is no
     *         parser mapped to specified type type.
     * @since Studio Submission Slideshow
     */
    public static BundledFileAnalyzer getBundledFileParser(String filePath) {
        FileType fileType = getFileType(filePath);
        Long fileTypeId = fileType.getId();
        if (!fileType.getBundled()) {
            throw new IllegalArgumentException(MessageFormat.format(Constants.ERROR_MSG_NOT_BUNDLED_FILE, fileTypeId));
        }
        if (FileType.ZIP_ARCHIVE_TYPE_ID.equals(fileTypeId)) {
            return new ZipFileAnalyzer();
        } else if (FileType.JAR_ARCHIVE_TYPE_ID.equals(fileTypeId)) {
            return new JarFileAnalyzer();
        } else {
            throw new IllegalArgumentException(MessageFormat.format(Constants.ERROR_MSG_NO_BUNDLED_FILE_PARSER,
                                                                    fileTypeId));
        }
    }
}