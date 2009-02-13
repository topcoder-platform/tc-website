package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;

public class GoogleReg extends FullReg {
    protected void setNextPage() {
        setNextPage(Constants.GOOGLE_REG_CLOSED_PAGE);
        setIsNextPageInContext(true);
        //reg closed
/*
        setNextPage(Constants.GOOGLE_REG_PAGE);
        setIsNextPageInContext(true);
        */
    }
}
