package com.topcoder.web.tc.controller.request.authentication;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.request.Base;

public class Logout extends Base{

    protected void businessProcessing() throws TCWebException {

        getAuthentication().logout();

        setNextPage("/");
        setIsNextPageInContext(false);
    }

}
