package com.topcoder.web.hs.controller.requests;

import com.topcoder.web.hs.common.*;

/**
 * A RequestProcessor which selects a front page depending on whether the session is logged in.
 *
 * @author Ambrose Feinstein
 */
public class Home extends Base {

    protected void businessProcessing() throws Exception {

        String path;
        if(isGuest())
            path = Constants.public_home;
        else
            path = Constants.member_home;

        setNextPage(path);
        setIsNextPageInContext(true);
    }
}
