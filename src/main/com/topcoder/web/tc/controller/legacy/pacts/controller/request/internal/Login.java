package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.util.Arrays;

import com.topcoder.security.TCSubject;
import com.topcoder.security.login.LoginRemote;
import com.topcoder.shared.security.LoginException;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.request.authentication.EmailActivate;

/**
 * Add or update a payment.
 *
 * @author  cucu
 */
public class Login extends PactsBaseProcessor implements PactsConstants {

    public static final String USER_NAME = "username";
    public static final String PASSWORD = "password";

    protected void businessProcessing() throws TCWebException {
    	
    	
        String username = getRequest().getParameter(USER_NAME);
        String password = getRequest().getParameter(PASSWORD);
        SessionInfo info = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
        String loginStatus = StringUtils.checkNull(getRequest().getParameter(Constants.STATUS));

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
                
                char status = getStatus(sub.getUserId());
                
                if (Arrays.binarySearch(Constants.ACTIVE_STATI, status) < 0) {
                	getAuthentication().logout();
                	throw new LoginException("Your account is not active.");
                }
                	
                if (getEmailStatus(sub.getUserId()) != EmailActivate.ACTIVE_STATUS) {
                	getAuthentication().logout();
                	throw new LoginException("Your email is not active.");                	
                }
                	
                getAuthentication().login(new SimpleUser(0, username, password), false);
                
                
                String dest = StringUtils.checkNull(getRequest().getParameter(BaseServlet.NEXT_PAGE_KEY));
                setNextPage(dest.length() > 0? dest : "/PactsInternalServlet");
                setIsNextPageInContext(false);
                return;
            } catch (LoginException e) {
                addError("error", e.getMessage());            
            } catch (Exception e) {
                throw(new TCWebException(e));
            }
            

            /* whatever was wrong with the submission, make sure they are logged out */
            getAuthentication().logout();
        }

        if (loginStatus.equals(Constants.STATUS_START)) {
            getRequest().setAttribute(BaseServlet.MESSAGE_KEY, "In order to continue, you must provide your user name and password.");
        }
        int nextPageIdx = info.getRequestString().indexOf("nextpage=");
        if (nextPageIdx != -1) {
            String nextPage = info.getRequestString().substring(nextPageIdx + "nextpage=".length());
            getRequest().setAttribute(BaseServlet.NEXT_PAGE_KEY, nextPage);
        }
        
        setNextPage("/pacts/internal/login.jsp");
        setIsNextPageInContext(true);
    }
    
    /**
     * Gets the status for the user
     *
     * @param userId
     * @return
     * @throws Exception if user doesn't exist or some other ejb problem
     */
    private char getStatus(long userId) throws Exception {
        char result;
        User user = (User) createEJB(getInitialContext(), User.class);
        result = user.getStatus(userId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
        return result;

    }
    
    /**
     * Gets the e-mail status for the user
     *
     * @param userId
     * @return
     * @throws Exception if user doesn't exist or some other ejb problem
     */
    private int getEmailStatus(long userId) throws Exception {
        int result;
        Email email = (Email) createEJB(getInitialContext(), Email.class);
        result = email.getStatusId(email.getPrimaryEmailId(userId, DBMS.COMMON_OLTP_DATASOURCE_NAME),
                DBMS.COMMON_OLTP_DATASOURCE_NAME);
        return result;

    }
}

