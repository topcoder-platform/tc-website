package com.topcoder.web.screening.request;

import javax.servlet.ServletRequest;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.model.ProfileInfo;

public class ConfirmProfile extends BaseProfileProcessor {
    public void process() throws Exception {
        ServletRequest request = getRequest();
        ProfileInfo info = buildProfileInfo(request);

        //do something here...
        
        request.setAttribute(Constants.PROFILE_INFO, info);
        setNextPage(Constants.PROFILE_CONFIRM_PAGE);
        setNextPageInContext(true);
    }
}

