package com.topcoder.web.screening.request;

import java.util.HashMap;

import javax.servlet.ServletRequest;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.model.ProfileInfo;

public class ConfirmProfile extends PopulateProfileSetup {
    public void process() throws Exception {
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

    private boolean validateProfileInfo() {
        boolean success = true;
        ServletRequest request = getRequest();
        ProfileInfo info = (ProfileInfo)
            request.getAttribute(Constants.PROFILE_INFO);
        HashMap errorMap = new HashMap(5);

        if(info != null) {
            if(info.getProfileName() == null || 
               info.getProfileName().trim().equals("")) {
                success = false;
                errorMap.put(Constants.PROFILE_NAME, 
                        "Profile Name must be set");
            }

            if(info.getTestSetB().length == 0) {
                success = false;
                errorMap.put(Constants.TEST_SET_B, 
                        "Test Set B must have at least one problem");
            }

            if(info.getLanguage().length == 0) {
                success = false;
                errorMap.put(Constants.LANGUAGE, 
                        "At least one language must be selected");
            }
        }

        if(!success) {
            request.setAttribute(Constants.ERRORS, errorMap);
        }

        return success;
    }
}

