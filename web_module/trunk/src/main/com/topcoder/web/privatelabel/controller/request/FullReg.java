package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;

/**
 *
 * @author gpaul 06.27.2003
 */
public class FullReg extends FullRegBase {
    protected void registrationProcessing() throws TCWebException {
        try {
            getRequest().setAttribute("countryList", getCountryList());
            getRequest().setAttribute("stateList", getStateList());
            setDefaults(regInfo);
            setNextPage(Constants.VERIZON_REG_PAGE);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    protected SimpleRegInfo makeRegInfo() throws Exception {
        SimpleRegInfo ret = super.makeRegInfo();
        //set a couple of additional defaults for this verizon deal
        ret.setCity("Chennai");
        ret.setCountryCode("356");
        return ret;
    }


}
