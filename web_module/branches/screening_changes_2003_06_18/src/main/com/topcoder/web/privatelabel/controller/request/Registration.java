package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.privatelabel.Constants;

public class Registration extends BaseProcessor {
    protected void businessProcessing() {
        setNextPage(Constants.REGISTRATION_PAGE);
        setIsNextPageInContext(true);
    }
}
