package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;

public class GoogleActivate extends Activate {
    protected void setNextPage() {
        setNextPage(Constants.GOOGLE_ACTIVATION_PAGE);
        setIsNextPageInContext(true);
    }
}
