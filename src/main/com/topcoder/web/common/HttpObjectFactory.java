/*
 * Copyright (C) 2001-2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common;

import com.topcoder.servlet.request.RequestParser;
import com.topcoder.shared.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Provide a way to get an implementation of the TCRequest interface given
 * an http request.
 *
 * <p>
 * Version 1.1 (Upload Progress Bar Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Added {@link #createRequest(HttpServletRequest, RequestParser)} method.</li>
 *     <li>Updated {@link #createRequest(HttpServletRequest)} method to delegate to above created method.</li>
 *   </ol>
 * </p>
 *
 * @author isv 
 * @version 1.1
 */
public class HttpObjectFactory {
    
    private static Logger log = Logger.getLogger(HttpObjectFactory.class);

    /**
     * <p>Creates the appropriate wrapper around the specified incoming request from the client.</p>
     * 
     * @param r an <code>HttpServletRequest</code> representing incoming request from the client. 
     * @return a <code>TCRequest</code> wrapping the incoming request from the client. 
     */
    public static TCRequest createRequest(HttpServletRequest r) {
        return createRequest(r, null); 
    }

    /**
     * <p>Creates the appropriate wrapper around the specified incoming request from the client.</p>
     * 
     * @param r an <code>HttpServletRequest</code> representing incoming request from the client. 
     * @param uploadRequestParser a <code>RequestParser</code> to be used for parsing the incoming request in case the
     *        type of the request is <code>multipart/form-data</code>. May be <code>null</code> (in that case default 
     *        request parser will be used). 
     * @return a <code>TCRequest</code> wrapping the incoming request from the client. 
     * @since 1.1
     */
    public static TCRequest createRequest(HttpServletRequest r, RequestParser uploadRequestParser) {
        String contentType = r.getContentType();
        //log.debug("content type: " + contentType);
        TCRequest ret = null;
        //we'll cheat so that we don't have to instantiate an object to examine
        //the request only to find out that it is not a multipart request
        if (contentType == null || !contentType.toLowerCase().startsWith("multipart/form-data")) {
            ret = new SimpleRequest(r);
        } else if (contentType.toLowerCase().startsWith("multipart/form-data")) {
            try {
                if (uploadRequestParser == null) {
                    ret = new MultipartRequest(r);
                } else {
                    ret = new MultipartRequest(r, uploadRequestParser);
                }
            } catch (IOException ex) {
                throw new RuntimeException(ex);
            }
        } else {
            //don't have the implementation for this yet
            ret = new SimpleRequest(r);
        }
        return ret;
    }

    /**
     * this method ignores multipart requests, and just makes simple requests
     * @param r the request
     * @return the wrapped request
     */
    public static TCRequest createSimpleRequest(HttpServletRequest r) {
        return new SimpleRequest(r);
    }

    public static TCResponse createResponse(HttpServletResponse r) {
        return new SimpleResponse(r);
    }

    /**
     * @param r
     * @return a TCResponse object whose headers will tell proxy servers/browsers not to cache the page
     */
    public static TCResponse createUnCachedResponse(HttpServletResponse r) {
        return new UnCachedResponse(r);
    }

}
