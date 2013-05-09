/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.services;


/**
 * This exception will be thrown if there is an error while accessing DB.
 * <p>
 * <strong>Thread Safety:</strong> This class is not thread-safe as its parent is not thread-safe.
 * </p>
 * 
 * @author sampath01, leo_lol
 * @version 1.0
 * @since 1.0
 */
public class PersistenceException extends ServiceException {

    /**
     * Generated serial.
     */
    private static final long serialVersionUID = -1078548349256091017L;

    /**
     * Constructor with exception message.
     */
    public PersistenceException(String msg) {
        super(msg);
    }

    /**
     * Constructor with both exception message and cause.
     */
    public PersistenceException(String msg, Throwable cause) {
        super(msg, cause);
    }
}
