package com.topcoder.web.screening.request;


import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.common.PermissionException;
import com.topcoder.shared.security.ClassResource;

public class ConfirmProfile extends PopulateProfileSetup {
    protected void businessProcessing() throws Exception {
        if (getAuthentication().getUser().isAnonymous()) {
            throw new PermissionException(getAuthentication().getUser(), new ClassResource(this.getClass()));
        }
        super.process();
        
        //validate the info
        if(!validateProfileInfo()) {
            setNextPage(Constants.PROFILE_SETUP_PAGE);
            setIsNextPageInContext(true);
            return;
        }

        setNextPage(Constants.PROFILE_CONFIRM_PAGE);
        setIsNextPageInContext(true);
    }
}
