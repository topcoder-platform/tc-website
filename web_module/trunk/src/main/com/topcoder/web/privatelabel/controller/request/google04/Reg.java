package com.topcoder.web.privatelabel.controller.request.google04;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.*;

public class Reg extends FullReg {
    protected void setNextPage() {
/*
        //reg closed
        setNextPage(Constants.GOOGLE_REG_CLOSED_PAGE);
        setIsNextPageInContext(true);
*/
        setNextPage(Constants.GOOGLE04_REG_PAGE);
        setIsNextPageInContext(true);
    }
}
