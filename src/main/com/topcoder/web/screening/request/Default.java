package com.topcoder.web.screening.request;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;

public class Default extends BaseProcessor {
    protected void businessProcessing() throws TCWebException {
        setNextPage(Constants.DEFAULT_PAGE);
        setIsNextPageInContext(true);
    }
}
