/*
 * Copyright (C) 2005-2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.validation;

import java.io.ByteArrayInputStream;
import java.io.IOException;

import com.topcoder.servlet.request.FileDoesNotExistException;
import com.topcoder.servlet.request.PersistenceException;
import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.validation.BasicResult;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.Validator;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dto.FileType;
import com.topcoder.web.studio.dto.Project;
import com.topcoder.web.studio.util.BundledFileAnalyzer;

/**
 * <p>Class used to validate the source file from contest <code>Submission</code>.</p>
 * 
 * <p>
 *   Version 1.1 (Re-platforming Studio Release 3 Assembly) Change notes:
 *   <ol>
 *     <li>Updated the logic to use contests hosted in <code>tcs_catalog</code> database instead of
 *     <code>studio_oltp</code> database.</li>
 *   </ol>
 * </p>
 * 
 * <p>
 * Version 1.2 (Replatforming Studio Release 5) change notes:
 *   <ol>
 *     <li>Using the dto classes in com.topcoder.web.studio.dto package instead of in com.topcoder.web.common.model.comp package.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.3 (TopCoder Studio Improvements 1 Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Updated {@link #validate(ValidationInput)} method to check the submitted file for empty content.</li>
 *   </ol>
 * </p>
 *
 * @author aisacovich, pvmagacho, isv
 * @version 1.2
 */
public class SourceSubmissionValidator implements Validator {

    /**
     * <p>A <code>Logger</code> to be used for logging the events occurring in the course of submission validations.</p>
     */
    protected static final Logger log = Logger.getLogger(SourceSubmissionValidator.class);

    /**
     * <p>A <code>Project</code> representing the contest which the submissions to be validated by this validator belong
     * to.</p>
     */
    private Project project;

    /**
     * <p>Constructs new <code>SourceSubmissionValidator</code> instance to be used for validating the submissions in context
     * of specified contest.</p>
     *
     * @param contest a <code>Contest</code> which the submissions to be validated by this validator belong to. 
     */
    public SourceSubmissionValidator(Project project) {
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
        FileType ft = null;
        try {
            arr = new byte[(int) submission.getSize()];
            ret = submission.getInputStream().read(arr);
            ft = UnifiedSubmissionValidator.getFileType(submission.getRemoteFileName());
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
        } else if (ft == null) {
            return new BasicResult(false, "Unknown file type submitted: " + submission.getContentType());
        } else if (!ft.getBundled()) {
            return new BasicResult(false, "Invalid file type submitted: " + submission.getContentType());
        } else {
            BundledFileAnalyzer fileParser;
            try {
                fileParser = UnifiedSubmissionValidator.getBundledFileParser(submission.getRemoteFileName());
            } catch (PersistenceException e) {
                log.warn("Error getting bundled file parser.", e);
                return new BasicResult(false, "Error getting bundled file parser.");
            } catch (FileDoesNotExistException e) {
                log.warn("Error getting bundled file parser.", e);
                return new BasicResult(false, "Error getting bundled file parser.");
            }

            try {
                fileParser.analyze(new ByteArrayInputStream(arr), false);

                if (fileParser.isEmpty()) {
                    return new BasicResult(false, "Archive file was empty");
                }
            } catch (IOException e) {
                log.error("Could not validate the input due to I/O error", e);
                return new BasicResult(false, "Communication error when receiving submission.");
            }
        }

        return ValidationResult.SUCCESS;
    }

}
