package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.common.TCWebException;

public class RegistrationSubmit extends RegistrationBase {

    protected void registrationProcessing() throws TCWebException {

        checkRegInfo(regInfo);

        if (hasErrors()) {
            setNextPage(Constants.REGISTRATION_PAGE);
            setDefaults(regInfo);
        } else {
            //TODO commit to db
            setNextPage(Constants.REGISTRATION_SUCCESS_PAGE);
        }
        setIsNextPageInContext(true);
    }


}
