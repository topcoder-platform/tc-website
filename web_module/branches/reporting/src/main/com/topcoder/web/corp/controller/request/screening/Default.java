package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.corp.common.Constants;

public class Default extends BaseScreeningProcessor {
    protected void screeningProcessing() throws TCWebException {
        setNextPage(Constants.DEFAULT_PAGE);
        setIsNextPageInContext(true);
    }
}
