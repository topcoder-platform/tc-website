package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;

public class Default extends BaseProcessor {
    protected void businessProcessing() throws TCWebException {
        setNextPage(Constants.DEFAULT_PAGE);
        setIsNextPageInContext(true);
    }
}
