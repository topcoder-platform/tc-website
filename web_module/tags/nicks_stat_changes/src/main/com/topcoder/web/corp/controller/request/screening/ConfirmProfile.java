package com.topcoder.web.corp.controller.request.screening;


import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.shared.security.ClassResource;

public class ConfirmProfile extends PopulateProfileSetup {
    protected void businessProcessing() throws TCWebException {
        if (getAuthentication().getUser().isAnonymous()) {
            throw new PermissionException(getAuthentication().getUser(), new ClassResource(this.getClass()));
        }
        super.businessProcessing();

        //validate the info
        try {
            if (!validateProfileInfo()) {
                setNextPage(Constants.PROFILE_SETUP_PAGE);
                setIsNextPageInContext(true);
                return;
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new TCWebException(e));
        }

        setNextPage(Constants.PROFILE_CONFIRM_PAGE);
        setIsNextPageInContext(true);
    }
}
