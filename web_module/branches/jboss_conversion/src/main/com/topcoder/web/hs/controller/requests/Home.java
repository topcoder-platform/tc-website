package com.topcoder.web.hs.controller.requests;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.hs.common.Constants;

/**
 * A RequestProcessor which selects a front page depending on whether the session is logged in.
 *
 * @author Ambrose Feinstein
 */
public class Home extends Base {

    protected void businessProcessing() throws TCWebException {

        String path;
        if (info.isGuest())  // in case we have a named user who is only in the guest group
            path = Constants.public_home;
        else
            path = Constants.member_home;

        /* no permission check on the path, unlike Static */

        nav.setAll("home");

        setNextPage(path);
        setIsNextPageInContext(true);
    }
}
