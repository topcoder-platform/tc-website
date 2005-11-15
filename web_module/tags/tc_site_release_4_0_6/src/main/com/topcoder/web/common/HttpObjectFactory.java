package com.topcoder.web.common;

import com.topcoder.shared.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Provide a way to get an implementation of the TCRequest interface given
 * an http request.
 */
public class HttpObjectFactory {
    private static Logger log = Logger.getLogger(HttpObjectFactory.class);
    public static TCRequest createRequest(HttpServletRequest r) {
        String contentType = r.getContentType();
        log.debug("content type: " + contentType);
        TCRequest ret = null;
        //we'll cheat so that we don't have to instantiate an object to examine
        //the request only to find out that it is not a multipart request
        if (contentType == null || !contentType.toLowerCase().startsWith("multipart/form-data")) {
            ret = new SimpleRequest(r);
        } else if (contentType.toLowerCase().startsWith("multipart/form-data")) {
            try {
                ret = new MultipartRequest(r);
            } catch (IOException ex) {
                throw new RuntimeException(ex);
            }
        } else {
            //don't have the implementation for this yet
            ret = new SimpleRequest(r);
        }
        return ret;
    }

    public static TCResponse createResponse(HttpServletResponse r) {
        return new SimpleResponse(r);
    }
}
