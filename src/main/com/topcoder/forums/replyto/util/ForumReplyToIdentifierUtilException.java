/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.forums.replyto.util;

/**
 * This exception will be thrown by {@link #ForumReplyToIdentifierUtil}.
 *
 * @author flexme
 * @version 1.0
 * @since Module Assembly - TC Forums Reply To Email Feature
 */
public class ForumReplyToIdentifierUtilException extends Exception {
    /**
     * Represents the serial version unique id.
     */
    private static final long serialVersionUID = 954682032587602334L;

    /**
     * Construct the exception with a message.
     *
     * @param message the message.
     */
    public ForumReplyToIdentifierUtilException(String message) {
        super(message);
    }

    /**
     * Construct the exception with a message and cause.
     *
     * @param message the message.
     * @param cause the cause.
     */
    public ForumReplyToIdentifierUtilException(String message, Throwable cause) {
        super(message, cause);
    }
}
