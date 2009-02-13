package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.model.ProfileInfo;

public class AddProfileProblems extends BaseProfileProcessor {
    protected void screeningProcessing() throws TCWebException {
        if (getAuthentication().getUser().isAnonymous()) {
            throw new PermissionException(getAuthentication().getUser(), new ClassResource(this.getClass()));
        }
        ProfileInfo info = buildProfileInfo(getRequest());

        info.addTestSetB(getRequest().getParameterValues(Constants.TEST_SET_B_ADD));

        getRequest().setAttribute(Constants.PROFILE_INFO, info);
        setNextPage("testing/" + "?" +
                Constants.MODULE_KEY + "=" +
                Constants.POPULATE_PROFILE_PROCESSOR);
        setIsNextPageInContext(true);
    }
}

