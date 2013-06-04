/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.forums.replyto.util;

/**
 * This exception will be thrown by {@link #UserUtil}.
 *
 * @author flexme
 * @version 1.0
 * @since Module Assembly - TC Forums Reply To Email Feature
 */
public class UserUtilException extends Exception {
    /**
     * Represents the serial version unique id.
     */
    private static final long serialVersionUID = -2358793467923497534L;

    /**
     * Construct the exception with a message.
     *
     * @param message the message.
     */
    public UserUtilException(String message) {
        super(message);
    }

    /**
     * Construct the exception with a message and cause.
     *
     * @param message the message.
     * @param cause the cause.
     */
    public UserUtilException(String message, Throwable cause) {
        super(message, cause);
    }
}
