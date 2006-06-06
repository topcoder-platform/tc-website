/*
 * Copyright (c) 2005 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.screening.rules;
import com.topcoder.file.directoryvalidator.ValidationLogger;
import java.io.File;
import com.topcoder.apps.screening.ScreeningLogger;
import com.topcoder.apps.screening.ResponseCode;
import com.topcoder.apps.screening.SimpleScreeningData;

/**
 * <strong>Purpose</strong>:
 * ValidationLogger adapter to log to the ScreeningLogger.
 *
 * @author WishingBone
 * @version 1.0
 */
public class MyValidationLogger implements ValidationLogger {

    /**
     * <strong>Purpose</strong>:
     * The ScreeningLogger instance to log to.
     */
    private ScreeningLogger logger;

    /**
     * <strong>Purpose</strong>:
     * Whether validation succeeds.
     */
    private boolean success = true;

    /**
     * <strong>Purpose</strong>:
     * Create MyValidationLogger instance.
     */
    public MyValidationLogger(ScreeningLogger logger) {
        this.logger = logger;
    }

    /**
     * <p>This method will be called by the DirectoryManager if the file successfully passes
     * the validator's validation.</p>
     *
     * @param file the file under validation currently.
     * @param msg the message associated to the Validator.
     */
    public void validateSucceeded(File file, String msg) {
    }

    /**
     * <p>This method will be called by the DirectoryManager if the file fails to pass the
     * validator's validation.</p>
     *
     * @param file the file under validation currently.
     * @param msg the message associated with the validator.
     */
    public void validateFailed(File file, String msg) {
        this.success = false;
        this.logger.log(new SimpleScreeningData(msg + " (" + file.getName() + ")", ResponseCode.INVALID_DIRECTORY));
    }

    /**
     * <p>Calculate the total validations.</p>
     */
    public void logFinalReport() {
    }

    /**
     * <p>Reset the state of the ValidationLogging, this method will be called before the logging
     * begins and after the logging finishes in the DirectoryManager.create(File xmlFile) method to
     * ensure the overall progress collected in the logger is correct.
     */
    public void reset() {
    }

    /**
     * <p>Checks whether validation succeeds.</p>
     */
    public boolean isSuccessful() {
        return this.success;
    }

}
