package com.topcoder.web.screening.request;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.shared.security.ClassResource;

public class CreateCandidate extends BaseSessionProcessor {
    protected void businessProcessing() throws TCWebException {
        if (getAuthentication().getUser().isAnonymous()) {
            throw new PermissionException(getAuthentication().getUser(), new ClassResource(this.getClass()));
        }
        updateSessionInfo();
        setNextPage(Constants.CONTROLLER_URL + "?" +
                    Constants.MODULE_KEY + "=" +
                    Constants.POPULATE_CANDIDATE_PROCESSOR + "&" +
                    Constants.REFERRER + "=" + 
                    Constants.POPULATE_SESSION_PROCESSOR);
        setIsNextPageInContext(false);
    }
}
