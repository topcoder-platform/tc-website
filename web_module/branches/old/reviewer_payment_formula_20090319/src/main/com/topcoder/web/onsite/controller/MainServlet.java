/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.onsite.controller;

import com.topcoder.shared.security.Resource;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.security.WebAuthentication;

/**
 * <strong>Purpose</strong>:
 * Main Servlet for the onsite app.
 * 
 * @author pulky
 * @version 1.0
 */
public class MainServlet extends BaseServlet {

    /**
     * Validates the user for permission.
     * Since there are no specific requirements, always returns true.
     *
     * @param auth the WebAuthentication object
     * @param r the resource to validate
     *
     * @return true
     */
    protected boolean hasPermission(WebAuthentication auth, Resource r) {
        return true;
    }
}