package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.controller.request.screening.BaseSessionProcessor;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.shared.security.ClassResource;

public class CreateCandidate extends BaseSessionProcessor {
    protected void businessProcessing() throws TCWebException {
        if (getAuthentication().getUser().isAnonymous()) {
            throw new PermissionException(getAuthentication().getUser(), new ClassResource(this.getClass()));
        }
        updateSessionInfo();
        setNextPage(((SessionInfo)getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).getServletPath() + "?" +
                    Constants.MODULE_KEY + "=" +
                    Constants.POPULATE_CANDIDATE_PROCESSOR + "&" +
                    Constants.REFERRER + "=" +
                    Constants.POPULATE_SESSION_PROCESSOR);
        setIsNextPageInContext(false);
    }
}
