package com.topcoder.web.screening.request;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.common.PermissionException;
import com.topcoder.shared.security.ClassResource;

public class ConfirmSession extends BaseSessionProcessor {
    public void process() throws Exception {
        if (getAuthentication().getUser().isAnonymous()) {
            throw new PermissionException(getAuthentication().getUser(), new ClassResource(this.getClass()));
        }
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
