package com.topcoder.web.screening.request;

import com.topcoder.web.screening.common.Constants;

public class ConfirmSession extends BaseSessionProcessor {
    public void process() {
        updateSessionInfo();

        setNextPage(Constants.SESSION_CONFIRM_PAGE);
        setNextPageInContext(true);
    }
}
