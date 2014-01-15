/*
 * Copyright (C) 2014 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.docusign;

import java.util.Map;

/**
 * It is the interface used to define the contract of the pluggable handler for each signed document.
 * 
 * Thread-safety.
 * The handler implementation should be effectively thread-safe.
 * @author vangavroche, gonia_119
 * @version 1.0
 */
public interface SignedDocumentHandler {
    /**
     * Handle the document.
     * @param userId The ID of user who signed the document
     * @param context A map that may store context information for the handler to use.
     * @throws HandlerPermanentErrorException - indicating that the method invocation context (like parameters)
     *              is invalid or the handler's state has some problem (like incorrectly configured).
     *              These are permanent errors representing the situation when the caller shouldn't retry.
     * @throws HandlerTemporaryErrorException - indicating that there are unexpected error occurring in the method
     *              execution. The errors may include database connection error,
     *              or unavailability of some depending service , or any other unexpected errors.
     *              These are temporary errors representing the situation when the caller could retry after a while.
     */
    void handleDocument(long userId, Map<String,String> context) throws HandlerPermanentErrorException,
        HandlerTemporaryErrorException;
}
