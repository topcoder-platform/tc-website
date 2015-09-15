/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller;

import com.topcoder.util.errorhandling.BaseException;

/**
 * <p>Represents an exception related to PayPal Service API calls.</p>
 *
 * @author VolodymyrK
 * @version 1.0
 */
public class PayPalServiceException extends BaseException {

    /**
     * Create a new PayPalServiceException instance with the specified error message.
     *
     * @param message
     *            the error message of the exception
     */
    public PayPalServiceException(String message) {
        super(message);
    }

    /**
     * Create a new PayPalServiceException instance with the specified error
     * message and inner exception.
     *
     * @param message
     *            the error message of the exception
     * @param cause
     *            the inner exception
     */
    public PayPalServiceException(String message, Throwable cause) {
        super(message, cause);
    }
}
