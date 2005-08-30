package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.security.User;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.security.LoginException;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.codinginterface.longcontest.controller.request.Base;

/**
 * @author  lbackstrom
 * @version  $Revision$ $Date$
 */
public class Login extends Base{

    private static final Logger log = Logger.getLogger(Login.class);

    public void businessProcessing() throws Exception {

        String handle = getRequest().getParameter(Constants.KEY_USER_HANDLE);
        String passw = getRequest().getParameter(Constants.KEY_USER_PASS);
        if (handle == null || handle.trim().length() == 0) {
            setNextPage(Constants.LOGIN_JSP);
            setIsNextPageInContext(true);
        } else {
            log.debug("login attempt[login/passw]: " + handle + "/" + passw);
            User possibleUser = new SimpleUser(0, handle, passw);
            try {
                getAuthentication().login(possibleUser);
                log.debug("user " + possibleUser.getUserName() + " has logged in");
                setNextPage(request.getAttribute(BaseServlet.NEXT_PAGE_KEY));
                setIsNextPageInContext(false);
            } catch (LoginException e) {
                addError(Constants.KEY_USER_HANDLE, "Login Unsuccessful");
                setNextPage(Constants.LOGIN_JSP);
                setIsNextPageInContext(true);
            } catch (Exception ae) {
                throw new TCWebException(ae);
            }
        }
    }

}
