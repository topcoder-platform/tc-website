package com.topcoder.web.query.request;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.security.LoginException;
import com.topcoder.web.query.common.Constants;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;

/**
 * @author Greg Paul
 * @author bigjake <kitz@mit.edu>
 *
 */

public class Login extends BaseProcessor {

    private static Logger log = Logger.getLogger(Login.class);


    protected void businessProcessing() throws TCWebException {

        /* may be null */
        String username = getRequest().getParameter(Constants.HANDLE_PARAM);
        String password = getRequest().getParameter(Constants.PASSWORD_PARAM);

        /* if not null, we got here via a form submit;
         * otherwise, skip this and just draw the login form */
        if (username != null) {

            password = checkNull(password);
            if (username.equals("") || password.equals("")) {
                getRequest().setAttribute("message", "You must enter a username and a password.");
            } else {
                try {

                    getAuthentication().login(new SimpleUser(0, username, password));

                    /* no need to reset user or sessioninfo, since we immediately proceed to a new page */
                    String dest = checkNull(getRequest().getParameter("nextpage"));
                    setNextPage(dest);
                    setIsNextPageInContext(false);
                    return;

                } catch (LoginException e) {

                    /* the login failed, so tell them what happened */
                    getRequest().setAttribute("message", e.getMessage());
                }
            }

            /* whatever was wrong with the submission, make sure they are logged out */
            getAuthentication().logout();
        }
        getRequest().setAttribute(this.getClass().getName().substring(this.getClass().getName().lastIndexOf(".")+1), this);
        setNextPage(Constants.LOGIN_PAGE);
        setIsNextPageInContext(true);
    }



}


