package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.common.TCWebException;

/**
 *
 * @author gpaul 06.27.2003
 */
public class FullReg extends FullRegBase {
    protected void registrationProcessing() throws TCWebException {
        try {
            getRequest().setAttribute("countryList", getCountryList());
            getRequest().setAttribute("stateList", getStateList());
            setNextPage(Constants.VERIZON_REG_PAGE);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }


}
