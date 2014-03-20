/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services;

import com.topcoder.util.errorhandling.BaseCriticalException;
import com.topcoder.util.errorhandling.ExceptionData;

/**
 * <p>
 * This exception is the top-level exception thrown by all services. It extends
 * BaseCriticalException.
 * </p>
 * @author TCSASSEMBLER
 * @version 1.0 (Topcoder Security Groups Backend Model and Authorization
 *          Assembly v1.0 )
 * @since 1.0
 */
@SuppressWarnings("serial")
public class SecurityGroupException extends BaseCriticalException {

    /**
     * <p>
     * Creates a new exception instance with this error message.
     * </p>
     * 
     * @param message
     *            error message
     */
    public SecurityGroupException(String message) {
        super(message);
    }

    /**
     * <p>
     * This constructor creates a new exception instance with this error message
     * and cause of error.
     * </p>
     * 
     * @param message
     *            error message
     * @param cause
     *            cause of error
     */
    public SecurityGroupException(String message, Throwable cause) {
        super(message, cause);
    }

    /**
     * <p>
     * This constructor creates a new exception instance with this error message
     * and any additional data to attach to the exception.
     * </p>
     * 
     * @param message
     *            error message data
     * @param data
     *            additional data to attach to the exception
     */
    public SecurityGroupException(String message, ExceptionData data) {
        super(message, data);
    }

    /**
     * <p>
     * This constructor creates a new exception instance with this error
     * message, cause of error, and any additional data to attach to the
     * exception.
     * <p>
     * 
     * @param message
     *            error message
     * @param cause
     *            cause of error
     * @param data
     *            additional data to attach to the exception
     */
    public SecurityGroupException(String message, Throwable cause,
            ExceptionData data) {
        super(message, cause, data);
    }
}
