package com.topcoder.web.hs.controller.requests;

/**
 * A RequestProcessor used to log out the user from the current session.
 *
 * @author Ambrose Feinstein
 */
public class Logout extends Base {

    protected void businessProcessing() throws Exception {
        auth.logout();

        /* back to the front page */
        setNextPage("");
        setIsNextPageInContext(false);
    }
}
