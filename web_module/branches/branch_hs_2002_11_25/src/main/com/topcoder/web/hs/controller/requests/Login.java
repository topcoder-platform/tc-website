package com.topcoder.web.hs.controller.requests;

import javax.servlet.http.*;
import com.topcoder.shared.security.*;
import com.topcoder.web.common.security.*;

/**
 * A RequestProcessor used to log out the user from the current session.
 *
 * @author Ambrose Feinstein
 */
public class Login extends Base {

    protected void businessProcessing() throws Exception {

        String username = (String)request.getParameter("username");
        String password = (String)request.getParameter("password");

        try {
            auth.login(new SimpleUser(0, username, password));
        } catch(LoginException e) {
            /* if the login failed, give them another try */
            request.setAttribute("message", e.getMessage());
            setNextPage("/login/login.jsp");
            setIsNextPageInContext(true);
        }

        /* no need to reset user or sessioninfo, since we immediately proceed to a new page */

        String dest = request.getParameter("nextpage");
        if(dest == null || dest.equals(""))
            dest = ((HttpServletRequest)request).getContextPath()+((HttpServletRequest)request).getServletPath()+"?module=Static&d1=home&d2=index_member";

        setNextPage(dest);
        setIsNextPageInContext(false);
    }

}
