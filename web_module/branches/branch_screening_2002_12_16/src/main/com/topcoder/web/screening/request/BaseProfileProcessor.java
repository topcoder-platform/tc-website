package com.topcoder.web.screening.request;

import javax.servlet.ServletRequest;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.model.ProfileInfo;

public abstract class BaseProfileProcessor extends BaseProcessor {
    protected ProfileInfo buildProfileInfo(ServletRequest request) {
        ProfileInfo info = new ProfileInfo();

        String id = request.getParameter(Constants.PROFILE_ID);
        if(id != null) {
            info.setProfileId(new Long(id));
            info.setIsNew(false);
        }

        String name = request.getParameter(Constants.PROFILE_NAME);
        if(name != null) {
            info.setProfileName(name);
        }

        String testSetA = request.getParameter(Constants.TEST_SET_A);
        if(testSetA != null) {
            info.setTestSetA(testSetA);
        }

        //these methods should return if it is null
        info.addTestSetB(request.getParameterValues(Constants.TEST_SET_B));
        info.addLanguage(request.getParameterValues(Constants.LANGUAGE));

        return info;
    }
}
