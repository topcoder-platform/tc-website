package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.model.ProfileInfo;
import com.topcoder.web.corp.controller.request.screening.BaseProfileProcessor;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.shared.security.ClassResource;

import javax.servlet.ServletRequest;

public class RemoveProfileProblem extends BaseProfileProcessor {
    protected void businessProcessing() throws TCWebException {
        if (getAuthentication().getUser().isAnonymous()) {
            throw new PermissionException(getAuthentication().getUser(), new ClassResource(this.getClass()));
        }
        ServletRequest request = getRequest();
        ProfileInfo info = buildProfileInfo(request);

        info.removeTestSetB(request.getParameter(Constants.TEST_SET_B_REMOVE));

        request.setAttribute(Constants.PROFILE_INFO, info);
        setNextPage("testing/" + "?" +
                Constants.MODULE_KEY + "=" +
                Constants.POPULATE_PROFILE_PROCESSOR);
        setIsNextPageInContext(true);
    }
}

