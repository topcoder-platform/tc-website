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

        auth.login(new SimpleUser(0, username, password));
        /* no need to reset user or sessioninfo, since we immediately proceed to a new page */

        String dest = request.getParameter("nextpage");
        if(dest == null || dest.equals(""))
            dest = "hs?module=Static&d1=home&d2=index_member";  //@@@ need getServletName/Path

        setNextPage(dest);
        setIsNextPageInContext(false);
    }

}
