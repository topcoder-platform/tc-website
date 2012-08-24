/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller;

import com.topcoder.util.errorhandling.BaseException;

/**
 * <p>Represents an exception related to Payoneer Service API calls.</p>
 *
 * @author VolodymyrK
 * @version 1.0
 */
public class PayoneerServiceException extends BaseException {

    /**
     * Create a new PayoneerServiceException instance with the specified error message.
     *
     * @param message
     *            the error message of the exception
     */
    public PayoneerServiceException(String message) {
        super(message);
    }

    /**
     * Create a new PayoneerServiceException instance with the specified error
     * message and inner exception.
     *
     * @param message
     *            the error message of the exception
     * @param cause
     *            the inner exception
     */
    public PayoneerServiceException(String message, Throwable cause) {
        super(message, cause);
    }
}
