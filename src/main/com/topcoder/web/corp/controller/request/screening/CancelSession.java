package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.controller.request.screening.BaseSessionProcessor;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.shared.security.ClassResource;

public class CancelSession extends BaseSessionProcessor {
    protected void businessProcessing() throws TCWebException {
        if (getAuthentication().getUser().isAnonymous()) {
            throw new PermissionException(getAuthentication().getUser(), new ClassResource(this.getClass()));
        }
        clearSessionInfo();

        setNextPage(Constants.CONTROLLER_URL);
        setIsNextPageInContext(false);
    }
}
