/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.onsite.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.onsite.Constants;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.shared.util.logging.Logger;

/**
 * <strong>Purpose</strong>:
 * A Processor that builds a path to a static page out of a numbered series of parameters.
 *
 * @author Ambrose Feinstein, pulky
 * @version 1.0
 */
public class Static extends BaseProcessor {

    /**
     * The logger to log to.
     */
    private static final Logger log = Logger.getLogger(Static.class);

    /**
     * Processes a static request.
     * Parses the request parameters and redirects to the resulting page.
     */
    protected void businessProcessing() throws Exception {
        StringBuffer path = new StringBuffer(100);
        for (int i = 1; ; i++) {
            String p = getRequest().getParameter(Constants.STATIC_PREFIX + i);
            if (p == null) break;
            if (!isLegal(p)) throw new NavigationException();
            path.append("/").append(p);
        }
        if (path.length() == 0)
            path.append(Constants.DEFAULT_PAGE);
        else
            path.append(".jsp");

        log.debug("Forwarding to: " + path.toString());
        setNextPage(path.toString());
        setIsNextPageInContext(true);
    }


    /**
     * Validates the parameter to be a legal path component.
     *
     * @param s the parameter string to validate
     *
     * @return true if String s is legal
     */
    public static boolean isLegal(String s) {
        if (s == null) return false;
        if (s.equals("")) return false;
        char[] c = s.toCharArray();
        for (int i = 0; i < c.length; i++)
            if (0 > "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-_".indexOf(c[i]))
                return false;
        return true;
    }
}
