package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.web.privatelabel.model.VerizonRegInfo;

public class VerizonRegConfirm extends FullRegConfirm {
    protected void setNextPage() {
        setNextPage(Constants.VERIZON_REG_PAGE);
        setIsNextPageInContext(true);
        /*
        if (hasErrors()) {
            setNextPage(Constants.VERIZON_REG_DEMOG_PAGE);
        } else {
            setNextPage(Constants.VERIZON_REG_CONFIRM_PAGE);
        }
        setIsNextPageInContext(true);
        */
    }

    protected SimpleRegInfo makeRegInfo() throws Exception {
        SimpleRegInfo ret = super.makeRegInfo();
        if (!(ret instanceof VerizonRegInfo)) {
            ret = new VerizonRegInfo(ret);
        }
        return ret;
    }
}
