package com.topcoder.web.admin.controller.request;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.security.User;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.security.LoginException;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: May 2, 2005
 */
public class Login extends BaseProcessor {

    private static final Logger log = Logger.getLogger(Login.class);

    public static final String KEY_USER_HANDLE = "handle";
    public static final String KEY_USER_PASS = "pass";
    private static final String LOGIN_PAGE = "/login.jsp";

    public void businessProcessing() throws Exception {

        String handle = getRequest().getParameter(KEY_USER_HANDLE);
        String passw = getRequest().getParameter(KEY_USER_PASS);
        if (handle == null || handle.trim().length() == 0) {
            setNextPage(LOGIN_PAGE);
        } else {
            log.debug("login attempt[login/passw]: " + handle + "/" + passw);
            User possibleUser = new SimpleUser(0, handle, passw);
            try {
                getAuthentication().login(possibleUser);
                log.debug("user " + possibleUser.getUserName() + " has logged in");
                setNextPage(getRequest().getContextPath());
                setIsNextPageInContext(false);
            } catch (LoginException e) {
                addError(KEY_USER_HANDLE, "Login Unsuccessful");
                setNextPage(LOGIN_PAGE);
                setIsNextPageInContext(true);
            } catch (Exception ae) {
                throw new TCWebException(ae);
            }
        }
    }

}
