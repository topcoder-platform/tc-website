package com.topcoder.web.hs.controller.requests;

import com.topcoder.shared.security.*;
import com.topcoder.web.hs.common.*;

/**
 * A RequestProcessor used to handle logins.  If the login fails or the necessary parameters are not
 * present, it displays the login form; otherwise it redirects to the path in the "nextpage" parameter.
 *
 * @author Ambrose Feinstein
 */
public class Login extends Base {

    protected void businessProcessing() throws Exception {

        String username = Constants.checkNull(request.getParameter("username"));
        String password = Constants.checkNull(request.getParameter("password"));
        if(!username.equals("") && !password.equals("")) {

            try {
                auth.login(new SimpleUser(0, username, password));
                /* no need to reset user or sessioninfo, since we immediately proceed to a new page */
                String dest = Constants.checkNull(request.getParameter("nextpage"));
                setNextPage(dest);
                setIsNextPageInContext(false);
                return;
            } catch(LoginException e) {
                /* if the login failed, tell them why */
                request.setAttribute("message", e.getMessage());
            }
        }

        /* we may have been forwarded here and failed, so make sure we reflect the page contents in the menus */
        nav.setFolder("login");

        setNextPage(Constants.login_form);
        setIsNextPageInContext(true);
    }
}
