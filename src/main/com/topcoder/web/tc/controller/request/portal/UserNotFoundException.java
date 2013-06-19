/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.portal;

import java.lang.Exception;

/**
 * <p>
 * This exception indicates that user was not found in 3scale portal.
 * </p>
 *
 * <p>
 * <b>Thread Safety: </b>
 * This class is not thread-safe since its base class is not thread-safe.
 * </p>
 *
 * @author gevak
 * @version 1.0
 */
public class UserNotFoundException extends Exception {

    /**
     * ID for serialization.
     */
    private static final long serialVersionUID = 3513151715438889072L;

    /**
     * <p>
     * Creates instance with specified error message.
     * </p>
     *
     * @param message Descriptive error message.
     */
    public UserNotFoundException(String message) {
        super(message);
    }

    /**
     * <p>
     * Creates instance with specified error message and inner cause.
     * </p>
     *
     * @param message Descriptive error message.
     * @param cause Inner cause.
     */
    public UserNotFoundException(String message, Throwable cause) {
        super(message, cause);
    }
}
