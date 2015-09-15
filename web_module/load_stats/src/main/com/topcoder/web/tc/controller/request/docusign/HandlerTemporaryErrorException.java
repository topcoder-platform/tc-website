/*
 * Copyright (C) 2014 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.docusign;

import com.topcoder.util.errorhandling.BaseException;

/**
 * The exception represents the unexpected error occurs in the handler.
 * It is thrown by the SignedDocumentHandler indicating that there are unexpected error occurring 
 * in the method execution. The errors may include database connection error,
 * or unavailability of some depending service , or any other unexpected errors.
 * These are temporary errors representing the situation when the caller could retry after a while.
 *
 * Thread-safety:
 * The base class is not thread-safe so this one is not, either.
 *
 * @author vangavroche, gonia_119
 * @vesrion 1.0
 */
public class HandlerTemporaryErrorException extends BaseException {
    /**
     * The constructor with message.
     * @param message the exception message.
     */
    public HandlerTemporaryErrorException(String message) {
        super(message);
    }
    /**
     * The constructor with message and exception.
     * @param message the exception message.
     * @param cause the exception entity.
     */
    public HandlerTemporaryErrorException(String message, Throwable cause) {
        super(message, cause);
    }
}
