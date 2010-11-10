/*
 * Copyright (C) 2005-2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.validation;

import java.io.IOException;

import com.topcoder.servlet.request.FileDoesNotExistException;
import com.topcoder.servlet.request.PersistenceException;
import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.validation.BasicResult;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.Validator;
import com.topcoder.web.studio.model.MimeType;

/**s
 * @author aisacovich
 * @version $Revision: 70792 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 29, 2006
 */
public class SourceSubmissionValidator implements Validator {

    /**
     * <p>A <code>Logger</code> to be used for logging the events occurring in the course of submission validations.</p>
     */
    protected static final Logger log = Logger.getLogger(SourceSubmissionValidator.class);

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
            mt = UnifiedSubmissionValidator.getMimeType(submission);
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
        } else if (!UnifiedSubmissionValidator.isBundledFile(mt)) {
            return new BasicResult(false, "Invalid file type submitted: " + submission.getContentType());
        }

        return ValidationResult.SUCCESS;
    }

}
