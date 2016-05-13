/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.services;


/**
 * This exception will be thrown if the requesting entity is not found.
 * <p>
 * <strong>Thread Safety:</strong> This class is not thread-safe as its parent is not thread-safe.
 * </p>
 * 
 * @author sampath01, leo_lol
 * @version 1.0
 * @since 1.0
 */
public class EntityNotFoundException extends ServiceException {

    /**
     * Generated serial.
     */
    private static final long serialVersionUID = -6734890300399650384L;

    /**
     * Constructor with exception message.
     */
    public EntityNotFoundException(String msg) {
        super(msg);
    }

    /**
     * Constructor with both exception message and cause.
     */
    public EntityNotFoundException(String msg, Throwable cause) {
        super(msg, cause);
    }
}
