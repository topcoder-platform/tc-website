package com.topcoder.web.admin.task;

import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.common.security.BasicAuthentication;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Login {
    private  static final Logger log = Logger.getLogger(Login.class);

    public static final String KEY_USER_HANDLE = "handle";
    public static final String KEY_USER_PASS = "pass";
    private static final String LOGIN_PAGE = "/login.jsp";

    private String nextPage = "";
    private boolean pageInContext = true;

    public void process(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String handle = request.getParameter(KEY_USER_HANDLE);
        String passw = request.getParameter(KEY_USER_PASS);
        if (handle == null || handle.trim().length() == 0) {
            nextPage = LOGIN_PAGE;
        } else {
            log.debug("login attempt[login/passw]: " + handle + "/" + passw);
            User possibleUser = new SimpleUser(0, handle, passw);
            try {
                WebAuthentication authToken = new BasicAuthentication(new SessionPersistor(request.getSession()), request, response, BasicAuthentication.MAIN_SITE);
                authToken.login(possibleUser);
                log.debug("user " + possibleUser.getUserName() + " has logged in");
                nextPage = request.getContextPath();
                pageInContext = false;
                return;
            } catch (Exception ae) {
                nextPage = LOGIN_PAGE;
                pageInContext = true;
                return;
            }
        }
    }

    public String getNextPage() {
        return nextPage;
    }

    public boolean isPageInContext() {
        return pageInContext;
    }

}
