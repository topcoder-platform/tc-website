package com.topcoder.web.screening.request;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.common.PermissionException;
import com.topcoder.shared.security.ClassResource;

public class CancelSession extends BaseSessionProcessor {
    public void process() throws Exception {
        if (getAuthentication().getUser().isAnonymous()) {
            throw new PermissionException(getAuthentication().getUser(), new ClassResource(this.getClass()));
        }
        clearSessionInfo();

        setNextPage(Constants.CONTROLLER_URL);
        setNextPageInContext(false);
    }
}
