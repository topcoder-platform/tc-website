package com.topcoder.web.query.request;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.security.LoginException;
import com.topcoder.web.query.common.Constants;
import com.topcoder.web.common.BaseProcessor;

/**
 * @author Greg Paul
 * @author bigjake <kitz@mit.edu>
 *
 */

public class Login extends BaseProcessor {

    private static Logger log = Logger.getLogger(Login.class);


    protected void businessProcessing() throws Exception {

        /* may be null */
        String username = request.getParameter(Constants.HANDLE_PARAM);
        String password = request.getParameter(Constants.PASSWORD_PARAM);

        /* if not null, we got here via a form submit;
         * otherwise, skip this and just draw the login form */
        if (username != null) {

            password = checkNull(password);
            if (username.equals("") || password.equals("")) {
                request.setAttribute("message", "You must enter a username and a password.");
            } else {
                try {

                    auth.login(new SimpleUser(0, username, password));

                    /* no need to reset user or sessioninfo, since we immediately proceed to a new page */
                    String dest = checkNull(request.getParameter("nextpage"));
                    setNextPage(dest);
                    setIsNextPageInContext(false);
                    return;

                } catch (LoginException e) {

                    /* the login failed, so tell them what happened */
                    request.setAttribute("message", e.getMessage());
                }
            }

            /* whatever was wrong with the submission, make sure they are logged out */
            auth.logout();
        }

        setNextPage(Constants.LOGIN_PAGE);
        setIsNextPageInContext(true);
    }



}


