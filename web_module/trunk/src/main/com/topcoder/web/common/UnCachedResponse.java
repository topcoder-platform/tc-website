package com.topcoder.web.common;

import javax.servlet.http.HttpServletResponse;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 13, 2006
 */
public class UnCachedResponse extends SimpleResponse {
    public UnCachedResponse(HttpServletResponse response) {
        super(response);
        this.response.setHeader("Cache-Control","no-store");
        this.response.setHeader("Pragma","no-cache");
        this.response.setDateHeader ("Expires", 0);
    }

}
