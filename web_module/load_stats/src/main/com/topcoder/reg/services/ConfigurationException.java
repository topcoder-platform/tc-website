/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.services;

import com.topcoder.util.errorhandling.BaseRuntimeException;

/**
 * This exception will be thrown if there is a configuration error found.
 * <p>
 * <strong>Thread Safety:</strong> This class is not thread-safe as its parent is not thread-safe.
 * </p>
 * 
 * @author sampath01, leo_lol
 * @version 1.0
 * @since 1.0
 */
public class ConfigurationException extends BaseRuntimeException {

    /**
     * Generated serial.
     */
    private static final long serialVersionUID = -5354431649938145785L;

    /**
     * Default constructor.
     */
    public ConfigurationException() {
        super();
    }

    /**
     * Constructor with exception message.
     */
    public ConfigurationException(String msg) {
        super(msg);
    }

    /**
     * Constructor with exception cause.
     */
    public ConfigurationException(Throwable cause) {
        super(cause);
    }

    /**
     * Constructor with both exception message and cause.
     */
    public ConfigurationException(String msg, Throwable cause) {
        super(msg, cause);
    }
}
