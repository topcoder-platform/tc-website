package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;

public class GoogleRegConfirm extends FullRegConfirm {
    protected void setNextPage() {
        setNextPage(Constants.GOOGLE_REG_CLOSED_PAGE);
        setIsNextPageInContext(true);
        //reg closed
/*
        if (hasErrors()) {
            setNextPage(Constants.GOOGLE_REG_DEMOG_PAGE);
        } else {
            setNextPage(Constants.GOOGLE_REG_CONFIRM_PAGE);
        }
        setIsNextPageInContext(true);
        */
    }
}
