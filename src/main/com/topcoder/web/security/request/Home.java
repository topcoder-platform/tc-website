package com.topcoder.web.security.request;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.security.Constants;

public class Home extends BaseProcessor {
    public void businessProcessing() {
        setNextPage(Constants.jsp_root + Constants.menu_page);
    }

}
