package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.privatelabel.Constants;


/**
 *
 * @author gpaul 06.26.2003
 */
public class SimpleReg extends SimpleRegBase {
    protected void registrationProcessing() throws TCWebException {
        getRequest().setAttribute("countryList", getCountryList());
        getRequest().setAttribute("stateList", getStateList());
        setNextPage();
    }

    protected void setNextPage() {
        setNextPage(Constants.SIMPLE_REG_PAGE);
        setIsNextPageInContext(true);
    }

}
