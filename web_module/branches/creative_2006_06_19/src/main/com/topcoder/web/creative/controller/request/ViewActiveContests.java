package com.topcoder.web.creative.controller.request;

import com.topcoder.web.common.BaseProcessor;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 18, 2006
 */
public class ViewActiveContests extends BaseProcessor {
    protected void businessProcessing() throws Exception {
        setNextPage("/activeContests.jsp");
        setIsNextPageInContext(true);
    }
}
