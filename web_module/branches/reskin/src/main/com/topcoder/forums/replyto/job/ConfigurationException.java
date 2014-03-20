/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.forums.replyto.job;

/**
 * <p>
 * This exception will be thrown by {@link ForumReplyEmailRetrievalJob} to indicate configuration errors.
 * </p>
 * <p>
 * <b>Thread Safety:</b> Exceptions are not thread safe.
 * </p>
 *
 * @author albertwang, TCSDEVELOPER
 * @version 1.0
 * @since Module Assembly - TC Forums Reply To Email Feature
 */
public class ConfigurationException extends RuntimeException {
    /**
     * <p>
     * The serial version UID.
     * </p>
     */
    private static final long serialVersionUID = 6082846889074491643L;

    /**
     * <p>
     * Creates a new instance of this exception with the given message.
     * </p>
     *
     * @param message
     *            the detailed error message of this exception
     */
    public ConfigurationException(String message) {
        super(message);
    }

    /**
     * <p>
     * Creates a new instance of this exception with the given message and cause.
     * </p>
     *
     * @param message
     *            the detailed error message of this exception
     * @param cause
     *            the inner cause of this exception
     */
    public ConfigurationException(String message, Throwable cause) {
        super(message, cause);
    }
}
