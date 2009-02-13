package com.topcoder.web.screening.request;

import javax.servlet.ServletRequest;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.model.ProfileInfo;

public class AddProfileProblems extends BaseProfileProcessor {
    public void process() throws Exception {
        requireLogin();
        ServletRequest request = getRequest();
        ProfileInfo info = buildProfileInfo(request);

        info.addTestSetB(request.getParameterValues(Constants.TEST_SET_B_ADD));

        request.setAttribute(Constants.PROFILE_INFO, info);
        setNextPage(Constants.CONTROLLER_URL + "?" + 
                Constants.REQUEST_PROCESSOR + "=" + 
                Constants.POPULATE_PROFILE_PROCESSOR);
        setNextPageInContext(true);
    }
}

