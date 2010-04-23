package com.topcoder.web.tc.controller.request.tournament.tco08;

import com.topcoder.web.common.BaseProcessor;

/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 13, 2007
 */
public class Overview extends BaseProcessor {

    protected void businessProcessing() throws Exception {
        setNextPage("/tournaments/tco08/about.jsp");
        setIsNextPageInContext(true);
    }
}
