/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.memberphoto.servlet;

import javax.servlet.ServletException;


/**
 * <p>
 * This exception extends the <code>ServletException</code>, and it's thrown from
 * <code>MemberPhotoRemovalServlet</code> if any unexpected error occurs, it's used
 * to wrap the underlying exceptions.
 * </p>
 *
 * <p>
 * <strong>Thread safety:</strong>This is an exception class with no instance members
 * and hence immutable. It extends from <code>ServletException</code> which is thread-safe
 * and hence this class is also thread-safe.
 * </p>
 *
 * @author AleaActaEst, microsky
 * @version 1.0
 */
@SuppressWarnings("serial")
public class MemberPhotoRemovalException extends ServletException {
/**
     * <p>
     * Creates a new instance of this exception with the given message.
     * </p>
     * @param message the detailed error message of this exception
     */
    public MemberPhotoRemovalException(String message) {
        super(message);
    }

/**
     * <p>
     * Creates a new instance of this exception with the given message and cause.
     * </p>
     *
     * @param message the detailed error message of this exception
     * @param cause the inner cause of this exception
     */
    public MemberPhotoRemovalException(String message, Throwable cause) {
        super(message, cause);
    }
}
