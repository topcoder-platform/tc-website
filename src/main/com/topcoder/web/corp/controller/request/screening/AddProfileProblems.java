package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.model.ProfileInfo;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.security.User;

import javax.servlet.ServletRequest;

public class AddProfileProblems extends BaseProfileProcessor {
    protected void businessProcessing() throws TCWebException {
        if (getAuthentication().getUser().isAnonymous()) {
            throw new PermissionException(getAuthentication().getUser(), new ClassResource(this.getClass()));
        }
        ServletRequest request = getRequest();
        ProfileInfo info = buildProfileInfo(request);

        info.addTestSetB(request.getParameterValues(Constants.TEST_SET_B_ADD));

        request.setAttribute(Constants.PROFILE_INFO, info);
        setNextPage("testing/" + "?" +
                Constants.MODULE_KEY + "=" +
                Constants.POPULATE_PROFILE_PROCESSOR);
        setIsNextPageInContext(true);
    }
}

