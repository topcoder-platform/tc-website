package com.topcoder.sql.wrapper;

/**
 * The Exception used to trace unclosed Connection or Statement
 * contents.
 *
 * @author veredox
 * @version Copyright 2003, TopCoder Software, Inc.  All rights reserved.
 */
public class ContentsNotClosedException extends Exception {

    /**
     * Creates a new ContentsNotClosedException
     */
    public ContentsNotClosedException() {
    }

    /**
     * Creates a new ContentsNotClosedException
     *
     * @param message the message
     */
    public ContentsNotClosedException(String message) {
        super(message);
    }

    /**
     * Creates a new ContentsNotClosedException
     *
     * @param message the message
     * @param cause the cause
     */
    public ContentsNotClosedException(String message, Throwable cause) {
        super(message, cause);
    }

    /**
     * Creates a new ContentsNotClosedException
     *
     * @param cause the cause
     */
    public ContentsNotClosedException(Throwable cause) {
        super(cause);
    }
}
