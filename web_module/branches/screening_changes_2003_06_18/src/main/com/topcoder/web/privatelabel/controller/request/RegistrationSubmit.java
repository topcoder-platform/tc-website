package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;

public class RegistrationSubmit extends RegistrationBase {

    protected void registrationProcessing() {

        checkRegInfo(regInfo);

        if (hasErrors()) {
            setNextPage(Constants.REGISTRATION_PAGE);
            setDefaults(regInfo);
        } else {
            //TODO commit to db
            //TODO should some some kind of thank you page or something
            setNextPage(Constants.DEFAULT_PAGE);
        }
        setIsNextPageInContext(true);
    }


}
