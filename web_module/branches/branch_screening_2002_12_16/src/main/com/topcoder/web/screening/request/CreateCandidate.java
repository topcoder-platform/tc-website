package com.topcoder.web.screening.request;

import com.topcoder.web.screening.common.Constants;

public class CreateCandidate extends BaseSessionProcessor {
    public void process() {
        updateSessionInfo();
        setNextPage(Constants.CONTROLLER_URL + "?" +
                    Constants.REQUEST_PROCESSOR + "=" + 
                    Constants.POPULATE_CANDIDATE_PROCESSOR);
        setNextPageInContext(true);
    }
}
