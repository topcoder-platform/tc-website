package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;

public class VerizonActivate extends Activate {
    protected void setNextPage() {
        setNextPage(Constants.VERIZON_ACTIVATION_PAGE);
        setIsNextPageInContext(true);
    }
}
