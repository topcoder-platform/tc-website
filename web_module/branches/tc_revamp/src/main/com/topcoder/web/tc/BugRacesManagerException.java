/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc;

import com.topcoder.util.errorhandling.BaseCriticalException;
import com.topcoder.util.errorhandling.ExceptionData;

/**
 * <p>
 * This is thrown if any error occurs in BugRacesManager. It's thrown by BugRacesManager (and its implementations).
 * </p>
 * <p>
 * Thread Safety: This class is not thread safe because its base class is not thread safe.
 * </p>
 * @author duxiaoyang
 * @version 1.0
 */
public class BugRacesManagerException extends BaseCriticalException {

    /**
     * <p>
     * Creates a new instance of this exception with the given message.
     * </p>
     * @param message
     *            the detailed error message of this exception
     */
    public BugRacesManagerException(String message) {
        super(message);
    }

    /**
     * <p>
     * Creates a new instance of this exception with the given message and cause.
     * </p>
     * @param message
     *            the detailed error message of this exception.
     * @param cause
     *            the inner cause of this exception.
     */
    public BugRacesManagerException(String message, Throwable cause) {
        super(message, cause);
    }

    /**
     * <p>
     * Creates a new instance of this exception with the given message and exception data.
     * </p>
     * @param message
     *            the detailed error message of this exception.
     * @param data
     *            the exception data.
     */
    public BugRacesManagerException(String message, ExceptionData data) {
        super(message, data);
    }

    /**
     * <p>
     * Creates a new instance of this exception with the given message, cause and exception data.
     * </p>
     * @param message
     *            the detailed error message of this exception.
     * @param cause
     *            the inner cause of this exception.
     * @param data
     *            the exception data.
     */
    public BugRacesManagerException(String message, Throwable cause, ExceptionData data) {
        super(message, cause, data);
    }
}
