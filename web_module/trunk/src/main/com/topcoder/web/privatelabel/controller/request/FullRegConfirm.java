package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.common.TCWebException;

/**
 *
 * @author gpaul 07.07.2003
 */
public class FullRegConfirm extends FullRegBase {

    protected void registrationProcessing() throws TCWebException {

        checkRegInfo(regInfo);

        if (hasErrors()) {
            if (hasDemogPageError()) {
                setNextPage(Constants.VERIZON_REG_DEMOG_PAGE);
                setDefaults(regInfo);
            } else {
                getRequest().setAttribute("countryList", getCountryList());
                getRequest().setAttribute("stateList", getStateList());
                setNextPage(Constants.VERIZON_REG_PAGE);
                setDefaults(regInfo);
            }
        } else {
            regInfo.setCountryName(findCountry(regInfo.getCountryCode()));
            regInfo.setStateName(findState(regInfo.getStateCode()));
            setNextPage(Constants.VERIZON_REG_CONFIRM_PAGE);
        }
        setIsNextPageInContext(true);
    }
}
