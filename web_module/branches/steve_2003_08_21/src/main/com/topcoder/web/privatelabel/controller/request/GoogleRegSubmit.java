package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;

public class GoogleRegSubmit extends FullRegSubmit {
    protected void setNextPage() {
        if (isEligible()) {
            setNextPage(Constants.GOOGLE_REG_SUCCESS_PAGE);
        } else {
            throw new RuntimeException("impossible, isEligible returned false, fix the code");
        }
        setIsNextPageInContext(true);
    }

    protected boolean isEligible() {
        //we don't have any eligibility criteria at this point
        return true;
    }
}
