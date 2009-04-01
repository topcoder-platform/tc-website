package com.topcoder.web.common;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

/**
 * @author dok
 *         Date: Jan 17, 2004
 */
public class SimpleResponse extends HttpServletResponseWrapper implements TCResponse {

    public SimpleResponse(HttpServletResponse httpServletResponse) {
        super(httpServletResponse);
    }
}
