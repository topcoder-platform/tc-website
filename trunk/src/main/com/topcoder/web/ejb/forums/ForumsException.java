/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.ejb.forums;

/**
 * <p>
 * This exception is thrown from the Forums Bean if any error occurs.
 * </p>
 * 
 * <strong>Thread-safety:</strong>
 * <p>
 * Implementation needs to be thread-safe.
 * </p>
 * 
 * @author Shorty
 * @version 1.0
 */
public class ForumsException extends Exception {

    /**
     * Constructor with error message.
     * 
     * @param message
     *            - the error message.
     */
    public ForumsException(String message) {
        super(message);
    }

    /**
     * Constructor with error message and inner cause.
     * 
     * @param message
     *            - the error message.
     * @param cause
     *            - the inner cause.
     */
    public ForumsException(String message, Throwable cause) {
        super(message, cause);
    }
}
