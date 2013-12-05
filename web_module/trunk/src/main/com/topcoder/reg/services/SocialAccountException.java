/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.services;

/**
 * The exception occurs in social account related operations.
 * 
 * @author ecnu_haozi
 * @version 1.0
 * @since 1.0 (Release Assembly - TopCoder Website Social Login)
 */
public class SocialAccountException extends Exception {

    /**
     * Generated serial.
     */
    private static final long serialVersionUID = -8527624034758366274L;

    /**
     * Constructor with exception message.
     * 
     * @param msg
     *            meassage.
     */
    public SocialAccountException(String msg) {
        super(msg);
    }

    /**
     * Constructor with both exception message and cause.
     * 
     * @param msg
     *            meassage.
     * @param cause
     *            cause.
     */
    public SocialAccountException(String msg, Throwable cause) {
        super(msg, cause);
    }
}
