package com.topcoder.web.hs.controller.requests;

import javax.servlet.http.*;
import com.topcoder.shared.security.*;
import com.topcoder.web.common.security.*;

/**
 * A RequestProcessor used to log out the user from the current session.
 *
 * @author Ambrose Feinstein
 */
public class Logout extends Base {

    protected void businessProcessing() throws Exception {
        auth.logout();

        /* back to the front page */
        setNextPage((HttpServletRequest)request.getContextPath().getContextPath()+(HttpServletRequest)request.getContextPath().getServletPath());
        setIsNextPageInContext(false);
    }
}
