package com.topcoder.web.screening.request;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.model.ProfileInfo;
import com.topcoder.web.common.PermissionException;
import com.topcoder.shared.security.ClassResource;

import javax.servlet.ServletRequest;

public class AddProfileProblems extends BaseProfileProcessor {
    protected void businessProcessing() throws Exception {
        if (getAuthentication().getUser().isAnonymous()) {
            throw new PermissionException(getAuthentication().getUser(), new ClassResource(this.getClass()));
        }
        ServletRequest request = getRequest();
        ProfileInfo info = buildProfileInfo(request);

        info.addTestSetB(request.getParameterValues(Constants.TEST_SET_B_ADD));

        request.setAttribute(Constants.PROFILE_INFO, info);
        setNextPage(Constants.CONTROLLER_URL + "?" + 
                Constants.MODULE_KEY + "=" +
                Constants.POPULATE_PROFILE_PROCESSOR);
        setIsNextPageInContext(true);
    }
}

