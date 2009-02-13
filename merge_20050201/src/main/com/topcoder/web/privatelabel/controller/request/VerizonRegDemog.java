package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.web.privatelabel.model.VerizonRegInfo;
import com.topcoder.web.common.TCWebException;

public class VerizonRegDemog extends FullRegDemog {
    protected void setNextPage() {
        setNextPage(Constants.VERIZON_REG_PAGE);
        setIsNextPageInContext(true);
/*        if (hasErrors()) {
            setNextPage(Constants.VERIZON_REG_PAGE);
        } else {
            setNextPage(Constants.VERIZON_REG_DEMOG_PAGE);
        }
        setIsNextPageInContext(true);*/
    }

    protected SimpleRegInfo makeRegInfo() throws Exception {
        SimpleRegInfo ret = super.makeRegInfo();
        if (!(ret instanceof VerizonRegInfo)) {
            ret = new VerizonRegInfo(ret);
        }
        return ret;
    }

    protected void checkRegInfo(SimpleRegInfo info) throws TCWebException {
        super.checkRegInfo(info);
        //in case the person chose the US, the basic registration
        //requires them to choose a state, but we don't have
        //state input for the verizon reg process.
        removeError(Constants.STATE_CODE);
    }

}
