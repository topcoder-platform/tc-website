package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import com.topcoder.security.TCSubject;
import com.topcoder.security.login.LoginRemote;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.security.LoginException;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.security.TCSAuthorization;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.servlet.PactsInternalServlet;

/**
 * Add or update a payment.
 *
 * @author  cucu
 */
public class Login extends PactsBaseProcessor implements PactsConstants {

    public static final String USER_NAME = "username";
    public static final String PASSWORD = "password";
    public static final String STATUS = "status";

    public static final String STATUS_START = "start";

    protected void businessProcessing() throws TCWebException {
    	
    	
        String username = getRequest().getParameter(USER_NAME);
        String password = getRequest().getParameter(PASSWORD);
        SessionInfo info = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
        String loginStatus = StringUtils.checkNull(getRequest().getParameter(STATUS));

        /* if not null, we got here via a form submit;
         * otherwise, skip this and just draw the login form */
        if (username != null) {
            try {
            	password = StringUtils.checkNull(password);
            	if (username.equals("") || password.equals("")) {
            		throw new LoginException("You must enter a username and a password.");
            	}
            	
                TCSubject sub = null;
                
                //we need to check if they got the right user name and password before we check anything else
                try {
                    LoginRemote login = (LoginRemote) com.topcoder.web.common.security.Constants.createEJB(LoginRemote.class);
                    sub = login.login(username, password);
                    if (log.isDebugEnabled()) {
                        log.debug("correct user name and password");
                    }
                } catch (Exception e) {
                    if (log.isDebugEnabled()) {
                        e.printStackTrace();
                    }
                    throw new LoginException("Username or password incorrect.");
                }
                
                TCSAuthorization auth = new TCSAuthorization(sub);
                if (auth.hasPermission(new ClassResource(PactsInternalServlet.class))) {
                	
                }
                getAuthentication().login(new SimpleUser(0, username, password), false);
                setNextPage("/PactsInternalServlet");
                setIsNextPageInContext(false);
                return;
            } catch (LoginException e) {
                addError("error", e.getMessage());            
            } catch (TCWebException e) {
                throw e;
            } catch (Exception e) {
                throw(new TCWebException(e));
            }
            

            /* whatever was wrong with the submission, make sure they are logged out */
            getAuthentication().logout();
        }
/*
        if (loginStatus.equals(STATUS_START)) {
            getRequest().setAttribute(BaseServlet.MESSAGE_KEY, "In order to continue, you must provide your user name and password.");
        }
        int nextPageIdx = info.getRequestString().indexOf("nextpage=");
        if (nextPageIdx != -1) {
            String nextPage = info.getRequestString().substring(nextPageIdx + "nextpage=".length());
            getRequest().setAttribute(BaseServlet.NEXT_PAGE_KEY, nextPage);
        }*/
        
        setNextPage("/pacts/internal/login.jsp");
        setIsNextPageInContext(true);
    }
}

