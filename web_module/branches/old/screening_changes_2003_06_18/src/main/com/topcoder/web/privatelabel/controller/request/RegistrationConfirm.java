package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.RegistrationInfo;
import com.topcoder.web.common.TCWebException;

public class RegistrationConfirm extends RegistrationBase {

    protected void registrationProcessing() throws TCWebException {

        checkRegInfo(regInfo);

        if (hasErrors()) {
            setNextPage(Constants.REGISTRATION_PAGE);
            setDefaults(regInfo);
        } else {
            regInfo.setCountryName(findCountry(regInfo.getCountryCode()));
            regInfo.setStateName(findState(regInfo.getStateCode()));
            setNextPage(Constants.REGISTRATION_CONFIRM_PAGE);
        }
        setIsNextPageInContext(true);
    }
}
