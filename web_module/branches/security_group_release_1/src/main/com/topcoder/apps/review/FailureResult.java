/**
 * Copyright (c) 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.DocumentAlreadySubmittedException;
import com.topcoder.shared.util.logging.Logger;


/**
 * This class is returned to indicate that a called business logic method executed without error but the result was a
 * negative response and no further data was returned.
 *
 * @author adic
 * @version 1.0
 */
public class FailureResult implements ResultData {

    /**
     * The test case review.
     */
    private Exception cause = null;

    /**
     * The test case review.
     */
    private String message = null;
    
    private static Logger log = Logger.getLogger(FailureResult.class);

    /**
     * Constructor (message and cause will be null).
     */
    FailureResult() {
        log.warn("FailureResult: (no message, no cause)");
    }

    /**
     * Constructor with message explaining the failure.
     *
     * @param message the message
     */
    FailureResult(String message) {
        this.message = message;
        log.warn("FailureResult: " + message);
    }

    /**
     * Constructor with wrapped cause exception.
     *
     * @param cause the exception (cause)
     */
    FailureResult(Exception cause) {
        this.cause = cause;
        //this.message = "(no message)";
        if (cause instanceof ConcurrentModificationException) {
            this.message = "This document has been changed since you started working";
        } else if (cause instanceof DocumentAlreadySubmittedException) {
            this.message = "This document has already been submitted (and marked as complete) so it cannot be "
                    + "resubmitted again without PM intervention";
        }
        log.warn("FailureResult: " + message + ": ", cause);
    }

    /**
     * Constructor with message explaining the failure and cause exception.
     *
     * @param message the message
     * @param cause the exception (cause)
     */
    FailureResult(String message, Exception cause) {
        this.message = message;
        this.cause = cause;
        log.warn("FailureResult: " + message + ": ", cause);
    }

    /**
     * Retrieves the Exception (if any) which caused this method to fail.
     *
     * @return a Exception indicating the reason for the failure.  null if the
     * failure was due to a business rule.
     */
    public Exception getCause() {
        return cause;
    }

    /**
     * Returns the reason (in human readable format) for the failure.
     *
     * @return a human-readable String indicating the reason for the failure.
     */
    public String getMessage() {
        return message;
    }

}
