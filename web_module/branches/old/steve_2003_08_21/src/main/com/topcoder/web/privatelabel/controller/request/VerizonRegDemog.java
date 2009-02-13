package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;

public class VerizonRegDemog extends FullRegDemog {
    protected void setNextPage() {
        if (hasErrors()) {
            setNextPage(Constants.VERIZON_REG_PAGE);
        } else {
            setNextPage(Constants.VERIZON_REG_DEMOG_PAGE);
        }
        setIsNextPageInContext(true);
    }
}
