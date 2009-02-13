package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.common.TCWebException;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.common.web.error.TCException;

import java.util.Map;

public class Registration extends RegistrationBase {
    protected void registrationProcessing() throws TCWebException {
        //TODO get country and state lists and put them in request
        getRequest().setAttribute("countryList", getCountryList());
        getRequest().setAttribute("stateList", getStateList());
        setNextPage(Constants.REGISTRATION_PAGE);
        setIsNextPageInContext(true);
    }


}
