package com.topcoder.web.openaim.controller.request.myopenaim;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;

/**
 *
 * @author  pulky
 */
public class MyOpenAIMHome extends BaseProcessor {
    protected void businessProcessing() throws TCWebException {
        setNextPage("/myopenaim/home.jsp");
        setIsNextPageInContext(true);
    }
}

