/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.tournament.tco09;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.tc.Constants;

/**
 * <p>A very simple controller to handle TCO09 landing page.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since 2009 TopCoder Open Site Integration
 */
public class Overview extends BaseProcessor {

    /**
     * <p>
     * Handles landing page request processing redirecting to the TCO09 overview page. 
     * </p>
     * 
     * @see com.topcoder.web.common.BaseProcessor#businessProcessing()
     */
    protected void businessProcessing() throws Exception {
        setNextPage(Constants.TCO09_OVERVIEW_PAGE);
        setIsNextPageInContext(true);
    }
}
