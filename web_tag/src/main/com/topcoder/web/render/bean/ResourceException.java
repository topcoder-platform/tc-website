/*
 * ResourceException
 *
 * An exception that may be thrown by Resource accessors in the PageBuilder
 * Content Management web application.
 *
 * By John C. Bollinger
 * Copyright 2002, Topcoder, Inc.
 *
 */

package com.topcoder.web.render.bean;

class ResourceException extends Exception {
    public ResourceException(String message) {
        super(message);
    }
}

