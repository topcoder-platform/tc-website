package com.topcoder.web.screening.request;


import javax.servlet.ServletRequest;

import com.topcoder.web.screening.common.Constants;

public class ConfirmProfile extends PopulateProfileSetup {
    public void process() throws Exception {
        requireLogin();
        super.process();
        
        //validate the info
        if(!validateProfileInfo()) {
            setNextPage(Constants.PROFILE_SETUP_PAGE);
            setNextPageInContext(true);
            return;
        }

        setNextPage(Constants.PROFILE_CONFIRM_PAGE);
        setNextPageInContext(true);
    }
}
