package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;

public class VerizonRegConfirm extends FullRegConfirm {
    protected void setNextPage() {
        if (hasErrors()) {
            setNextPage(Constants.VERIZON_REG_DEMOG_PAGE);
        } else {
            setNextPage(Constants.VERIZON_REG_CONFIRM_PAGE);
        }
        setIsNextPageInContext(true);
    }
}
