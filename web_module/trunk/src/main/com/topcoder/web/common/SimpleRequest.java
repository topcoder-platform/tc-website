package com.topcoder.web.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

/**
 * this class could extend HttpServletRequestWrapper which would provide
 * the standard behavior without doing so explicitly.  HttpServletRequestWrapper
 * isn't available util servlet 1.3
 */
public class SimpleRequest extends HttpServletRequestWrapper implements TCRequest {

    public SimpleRequest(HttpServletRequest httpServletRequest) {
        super(httpServletRequest);
    }


}
