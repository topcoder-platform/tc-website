package com.topcoder.web.corp.controller.request.screening;


import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.corp.common.Constants;

public class ConfirmProfile extends PopulateProfileSetup {
    protected void screeningProcessing() throws TCWebException {
        if (getAuthentication().getUser().isAnonymous()) {
            throw new PermissionException(getAuthentication().getUser(), new ClassResource(this.getClass()));
        }
        super.screeningProcessing();

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
