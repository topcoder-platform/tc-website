/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.services;

import com.topcoder.util.errorhandling.BaseException;

/**
 * This exception will be thrown if there is a service error found.
 * <p>
 * <strong>Thread Safety:</strong> This class is not thread-safe as its parent is not thread-safe.
 * </p>
 * 
 * @author sampath01, leo_lol
 * @version 1.0
 * @since 1.0
 */
public class ServiceException extends BaseException {

    /**
     * Generated serial.
     */
    private static final long serialVersionUID = 6377675691515405958L;

    /**
     * Constructor with exception message.
     */
    public ServiceException(String msg) {
        super(msg);
    }

    /**
     * Constructor with both exception message and cause.
     */
    public ServiceException(String msg, Throwable cause) {
        super(msg, cause);
    }
}
