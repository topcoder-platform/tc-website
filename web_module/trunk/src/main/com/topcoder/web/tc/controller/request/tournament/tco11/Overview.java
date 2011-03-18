/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.tournament.tco11;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.tc.TCO11Constants;

/**
 * <p>A controller for servicing the requests for viewing the landing page for the <code>2011 TCO Website</code>
 * application.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class Overview extends BaseProcessor {

    /**
     * <p>Constructs new <code>Overview</code> instance. This implementation does nothing.</p>
     */
    public Overview() {
    }

    /**
     * <p>Handles landing page request processing redirecting to the TCO11 overview page.</p>
     *
     * @see com.topcoder.web.common.BaseProcessor#businessProcessing()
     */
    protected void businessProcessing() throws Exception {
        setNextPage(TCO11Constants.TCO11_OVERVIEW_PAGE);
        setIsNextPageInContext(true);
    }
}
