package com.topcoder.web.screening.request;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.common.BaseProcessor;

public class Default extends BaseProcessor {
    protected void businessProcessing() throws Exception {
        setNextPage(Constants.DEFAULT_PAGE);
        setIsNextPageInContext(true);
    }
}
