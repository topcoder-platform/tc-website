package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.RegistrationInfo;

public class RegistrationConfirm extends RegistrationBase {

    protected void registrationProcessing() {

        RegistrationInfo regInfo = new RegistrationInfo(getRequest());
        checkRegInfo(regInfo);

        if (hasErrors()) {
            setNextPage(Constants.REGISTRATION_PAGE);
            setDefaults(regInfo);
        } else {
            setNextPage(Constants.REGISTRATION_CONFIRM_PAGE);
        }
        setIsNextPageInContext(true);
    }
}
