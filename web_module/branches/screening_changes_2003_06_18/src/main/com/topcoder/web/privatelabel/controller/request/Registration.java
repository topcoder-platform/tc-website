package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;

public class Registration extends RegistrationBase {
    protected void registrationProcessing() {
        setNextPage(Constants.REGISTRATION_PAGE);
        setIsNextPageInContext(true);
    }
}
