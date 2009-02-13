package com.topcoder.dde.submission;

/**
 */
public class SubmitterDoesNotExistException extends Exception {

    public SubmitterDoesNotExistException() {
    }

    public SubmitterDoesNotExistException(String message) {
        super(message);
    }

    public SubmitterDoesNotExistException(String message, Throwable cause) {
        super(message, cause);
    }

    public SubmitterDoesNotExistException(Throwable cause) {
        super(cause);
    }
}
