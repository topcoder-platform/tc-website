package com.topcoder.web.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Provide a way to get an implementation of the TCRequest interface given
 * an http request.
 */
public class HttpObjectFactory {
    public static TCRequest createRequest(HttpServletRequest r) {
        String contentType = r.getContentType();
        TCRequest ret = null;
        //we'll cheat so that we don't have to instantiate an object to examine
        //the request only to find out that it is not a multipart request
        if (contentType == null || !contentType.toLowerCase().startsWith("multipart/form-data")) {
            ret = new SimpleRequest(r);
        } else {
            //don't have the implementation for this yet
            ret = new SimpleRequest(r);
        }
        return ret;
    }
    public static TCResponse createResponse(HttpServletResponse r ) {
        return new SimpleResponse(r);
    }
}
