package com.topcoder.web.screening.request;

import com.topcoder.web.screening.common.Constants;

public class ConfirmSession extends BaseSessionProcessor {
    public void process() throws Exception {
        requireLogin();
        updateSessionInfo();

        //validate the info
        if(!validateSessionInfo()) {
            setNextPage(Constants.SESSION_SETUP_PAGE);
            setNextPageInContext(true);
            return;
        }

        setNextPage(Constants.SESSION_CONFIRM_PAGE);
        setNextPageInContext(true);
    }
}
