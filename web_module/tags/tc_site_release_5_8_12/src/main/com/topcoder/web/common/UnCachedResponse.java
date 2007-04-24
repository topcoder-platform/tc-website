package com.topcoder.web.common;

import javax.servlet.http.HttpServletResponse;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 13, 2006
 */
public class UnCachedResponse extends SimpleResponse {

    /**
     * build the response object and set headers such that
     * browsers/proxies will not cache this response.
     *
     * @param response
     */
    public UnCachedResponse(HttpServletResponse response) {
        super(response);
        init();
    }

    /**
     * accept a flag indicating whether or not to overwrite the headers we're setting to
     * make proxies/browsers not cache the response.  this is an all or nothing operation.
     * if any of the headers that we're concerned with are set, then we' don't overwrite any.
     *
     * @param response
     * @param overwrite
     */
    public UnCachedResponse(HttpServletResponse response, boolean overwrite) {
        super(response);
        if (overwrite) {
            init();
        } else {
            if (!this.response.containsHeader("Cache-Control") &&
                    !this.response.containsHeader("Expires")) {
                init();
            }
        }

    }

    private void init() {
        this.response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        this.response.setHeader("Cache-Control", "pre-check=0, post-check=0");
        this.response.setDateHeader("Expires", 0);
    }

}
