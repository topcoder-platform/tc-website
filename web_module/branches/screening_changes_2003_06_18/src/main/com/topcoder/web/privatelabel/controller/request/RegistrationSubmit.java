package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.RegistrationInfo;

public class RegistrationSubmit extends RegistrationBase {

    protected void businessProcessing() {

        RegistrationInfo regInfo = new RegistrationInfo(getRequest());
        checkRegInfo(regInfo);

        if (hasErrors()) {
            setNextPage(Constants.REGISTRATION_PAGE);
            setDefaults(regInfo);
        } else {
            //TODO commit to db
            //TODO should some some kind of thank you page or something
            setNextPage(Constants.REGISTRATION_CONFIRM_PAGE);
        }
        setIsNextPageInContext(true);
    }


}
