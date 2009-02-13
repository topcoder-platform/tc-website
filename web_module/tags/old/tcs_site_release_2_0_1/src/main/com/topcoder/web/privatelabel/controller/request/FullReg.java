package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.common.TCWebException;

/**
 *
 * @author gpaul 06.27.2003
 */
public abstract class FullReg extends FullRegBase {
    protected void registrationProcessing() throws TCWebException {
        try {
            if (!hasErrors()) {
                getRequest().setAttribute("countryList", getCountryList());
                getRequest().setAttribute("stateList", getStateList());
                setDefaults(regInfo);
            }
            setNextPage();
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    //probably don't need to implement this, the parents is probably sufficient
//    protected SimpleRegInfo makeRegInfo() throws Exception {
//        SimpleRegInfo ret = super.makeRegInfo();
//        return ret;
//    }


}
