package com.topcoder.web.common.dao;

/**
 * <p>
 * This exception is thrown, if any exception occurred while retrieving invalid handle from persistence.
 * </p>
 * <p>
 * Thread - safety. The class is not thread - safe as it's base class not.
 * </p>
 */
public class InvalidHandleDAOException extends RuntimeException {

    /**
     * Represents generated serial id.
     */
    private static final long serialVersionUID = -4118935500728745723L;

    /**
     * Creates exception with message parameter.
     * @param message the exception message
     */
    public InvalidHandleDAOException(String message) {
        super(message);
    }

    /**
     * Creates exception with message parameter and cause.
     * @param message the exception message
     * @param cause the exception cause
     */
    public InvalidHandleDAOException(String message, Throwable cause) {
        super(message, cause);
    }
}
