package com.topcoder.web.screening.request;

import javax.servlet.ServletRequest;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.model.ProfileInfo;

public class ConfirmProfile extends PopulateProfileSetup {
    public void process() throws Exception {
        super.process();

        setNextPage(Constants.PROFILE_CONFIRM_PAGE);
        setNextPageInContext(true);
    }
}

