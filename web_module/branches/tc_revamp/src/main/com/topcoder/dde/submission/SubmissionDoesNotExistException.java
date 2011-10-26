package com.topcoder.dde.submission;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: May 7, 2003
 * Time: 12:46:59 AM
 * To change this template use Options | File Templates.
 */
public class SubmissionDoesNotExistException extends Exception {
    public SubmissionDoesNotExistException() {
    }

    public SubmissionDoesNotExistException(String message) {
        super(message);
    }

    public SubmissionDoesNotExistException(String message, Throwable cause) {
        super(message, cause);
    }

    public SubmissionDoesNotExistException(Throwable cause) {
        super(cause);
    }
}
