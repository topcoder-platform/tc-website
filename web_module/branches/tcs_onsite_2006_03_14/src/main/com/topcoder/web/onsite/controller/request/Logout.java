/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.onsite.controller.request;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;

/**
 * <strong>Purpose</strong>:
 * A processor to logout from the onsite app.
 * 
 * @author pulky
 * @version 1.0
 */
public class Logout extends BaseProcessor {

    /**
     * Processes the logount request.
     */
    protected void businessProcessing() throws TCWebException {
        getAuthentication().logout();
        getRequest().getSession().invalidate();
        setNextPage(getNextPage());
        setIsNextPageInContext(false);
        log.debug("on successful logout, going to " + getNextPage());
    }
}
