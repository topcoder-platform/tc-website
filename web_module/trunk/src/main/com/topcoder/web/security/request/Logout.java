package com.topcoder.web.security.request;

import com.topcoder.web.security.Constants;
import com.topcoder.web.common.BaseProcessor;

public class Logout extends BaseProcessor {
    public void businessProcessing() {
        setNextPage(Constants.jsp_root + Constants.login_page);
        setIsNextPageInContext(true);
    }
}
