package com.topcoder.web.studio.controller.request.mystudio;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;

/**
 *
 * @author  pulky
 */
public class MyStudioHome extends BaseProcessor {
    protected void businessProcessing() throws TCWebException {
        setNextPage("/mystudio/home.jsp");
        setIsNextPageInContext(true);
    }
}

