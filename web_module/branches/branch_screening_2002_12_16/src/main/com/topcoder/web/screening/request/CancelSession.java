package com.topcoder.web.screening.request;

import com.topcoder.web.screening.common.Constants;

public class CancelSession extends BaseSessionProcessor {
    public void process() throws Exception {
        clearSessionInfo();

        setNextPage(Constants.DEFAULT_PAGE);
        setNextPageInContext(false);
    }
}
