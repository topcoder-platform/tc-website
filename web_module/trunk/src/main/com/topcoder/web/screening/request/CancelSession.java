package com.topcoder.web.screening.request;

import com.topcoder.web.screening.common.Constants;

public class CancelSession extends BaseSessionProcessor {
    public void process() throws Exception {
        requireLogin();
        clearSessionInfo();

        setNextPage(Constants.CONTROLLER_URL);
        setNextPageInContext(false);
    }
}
