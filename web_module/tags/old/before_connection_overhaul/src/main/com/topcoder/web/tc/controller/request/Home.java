package com.topcoder.web.tc.controller.request;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;

public class Home extends Base {

    protected void businessProcessing() throws TCWebException {
        if (getUser().isAnonymous()) {
            setNextPage(Constants.PUBLIC_HOME_PAGE);
        } else {
            setNextPage(Constants.MEMBER_HOME_PAGE);
        }
        setIsNextPageInContext(true);
    }

}
