package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;

public class VerizonReg extends FullReg {
    protected void setNextPage() {
        setNextPage(Constants.VERIZON_REG_PAGE);
        setIsNextPageInContext(true);
    }

    protected SimpleRegInfo makeRegInfo() throws Exception {
        SimpleRegInfo ret = super.makeRegInfo();
        //set a couple of additional defaults for this verizon deal
        if (ret.getCity()==null || ret.getCity().length()==0) ret.setCity("Chennai");
        if (ret.getCountryCode()==null || ret.getCountryCode().length()==0) ret.setCountryCode("356");
        return ret;
    }
}
