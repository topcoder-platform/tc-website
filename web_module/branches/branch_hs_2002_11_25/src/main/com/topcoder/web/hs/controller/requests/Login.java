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

        String username = (String)request.getAttribute("username");
        String password = (String)request.getAttribute("password");

        auth.login(new SimpleUser(0, username, password));

        setNextPage("/home/index_member.jsp");  //@@@ name this... or perhaps redirect through Static?
        setIsNextPageInContext(true);
    }

}
