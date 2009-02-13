package com.topcoder.web.hs.controller.requests;

import com.topcoder.web.common.TCWebException;

/**
 * A RequestProcessor used to log out the user from the current session.
 *
 * @author Ambrose Feinstein
 */
public class Logout extends Base {

    protected void businessProcessing() throws TCWebException {
        getAuthentication().logout();

        /* back to the front page */
        setNextPage("");
        setIsNextPageInContext(false);
    }
}
