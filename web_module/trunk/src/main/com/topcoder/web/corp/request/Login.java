package com.topcoder.web.corp.request;

import com.topcoder.shared.security.*;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.corp.Constants;

/**
 * A RequestProcessor used to handle logins.  If the login fails or the necessary parameters are not
 * present, it displays the login form; otherwise it redirects to the path in the "nextpage" parameter.
 *
 * @author Ambrose Feinstein
 */
public class Login extends BaseProcessor {
    public static final String KEY_DESTINATION_PAGE = "nextpage";
    public static final String KEY_USER_HANDLE = "handle";
    public static final String KEY_USER_PASS = "passw";

    private final static Logger log = Logger.getLogger(Login.class);

    protected void businessProcessing() throws Exception {

        /* may be null */
        String username = request.getParameter(KEY_USER_HANDLE);
        String password = request.getParameter(KEY_USER_PASS);

        /* if not null, we got here via a form submit;
         * otherwise, skip this and just draw the login form */
        if(username != null) {

            password = StringUtils.checkNull(password);
            if(username.equals("") || password.equals("")) {
                request.setAttribute("message", "You must enter a username and a password.");

            } else {
                try {

                    authToken.login(new SimpleUser(0, username, password));

                    /* no need to reset user or sessioninfo, since we immediately proceed to a new page */
                    String dest = StringUtils.checkNull(request.getParameter(KEY_DESTINATION_PAGE));
                    if (dest==null) dest = StringUtils.checkNull((String)request.getAttribute(Login.KEY_DESTINATION_PAGE));
                    log.debug("on successfull login, going to " + dest);
                    setNextPage(dest);
                    setIsNextPageInContext(false);
                    return;

                } catch(LoginException e) {

                    /* the login failed, so tell them what happened */
                    request.setAttribute("message", e.getMessage());
                }
            }

            /* whatever was wrong with the submission, make sure they are logged out */
            authToken.logout();
        }

        setNextPage(Constants.LOGIN_PAGE);
        setIsNextPageInContext(true);
    }
}
