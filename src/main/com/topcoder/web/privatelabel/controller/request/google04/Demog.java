package com.topcoder.web.privatelabel.controller.request.google04;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.*;

public class Demog extends FullRegDemog {
    protected void setNextPage() {
        //reg closed
/*
        setNextPage(Constants.GOOGLE_REG_CLOSED_PAGE);
        setIsNextPageInContext(true);
*/

        if (hasErrors()) {
            setNextPage(Constants.GOOGLE04_REG_PAGE);
        } else {
            setNextPage(Constants.GOOGLE04_REG_DEMOG_PAGE);
        }
        setIsNextPageInContext(true);
    }
}
