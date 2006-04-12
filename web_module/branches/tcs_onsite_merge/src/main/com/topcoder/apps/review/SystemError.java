/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.util.errorhandling.BaseError;

/**
 * Generic error which wraps any error occuring in the business logic layer.
 *
 * @author adic
 * @version 1.0
 */
public class SystemError extends BaseError {

    /**
     * Constructor with no message and no wrapped exception.
     */
    public SystemError() {
        super();
    }

    /**
     * Constructor with message and no wrapped exception.
     *
     * @param message the message
     */
    public SystemError(String message) {
        super(message);
    }

    /**
     * Constructor with no message and wrapped exception.
     *
     * @param wrappedException the wrapped exception
     */
    public SystemError(Throwable wrappedException) {
        super(wrappedException);
    }

    /**
     * Constructor with message and wrapped exception.
     *
     * @param message the message
     * @param wrappedException the wrapped exception
     */
    public SystemError(String message, Throwable wrappedException) {
        super(message, wrappedException);
    }

}

