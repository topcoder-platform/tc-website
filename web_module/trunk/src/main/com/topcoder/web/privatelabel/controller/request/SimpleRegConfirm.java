package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.common.TCWebException;

/**
 *
 * @author gpaul 06.26.2003
 */
public class SimpleRegConfirm extends SimpleRegBase {

    protected void registrationProcessing() throws TCWebException {

        checkRegInfo(regInfo);

        if (hasErrors()) {
            setNextPage(Constants.SIMPLE_REG_PAGE);
            setDefaults(regInfo);
        } else {
            regInfo.setCountryName(findCountry(regInfo.getCountryCode()));
            regInfo.setStateName(findState(regInfo.getStateCode()));
            setNextPage(Constants.SIMPLE_REG_CONFIRM_PAGE);
        }
        setIsNextPageInContext(true);
    }
}
