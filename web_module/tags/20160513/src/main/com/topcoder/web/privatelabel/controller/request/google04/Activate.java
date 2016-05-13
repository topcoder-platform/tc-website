package com.topcoder.web.privatelabel.controller.request.google04;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.BaseActivate;

public class Activate extends BaseActivate {
    protected void setNextPage() {
        setNextPage(Constants.GOOGLE04_ACTIVATION_PAGE);
        setIsNextPageInContext(true);
    }
}
