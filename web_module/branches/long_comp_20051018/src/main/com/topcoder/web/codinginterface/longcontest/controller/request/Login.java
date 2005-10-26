package com.topcoder.web.codinginterface.longcontest.controller.request;

import java.util.Arrays;

import com.topcoder.security.TCSubject;
import com.topcoder.security.login.LoginRemote;
import com.topcoder.shared.security.LoginException;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.codinginterface.CodingInterfaceConstants;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.ejb.user.User;

/**
 * @author lbackstrom
 * @version $Revision$ $Date$
 */
public class Login extends Base {

    public static final String USER_ID = "userid";
    public static final String STATUS = "status";

    public static final String STATUS_START = "start";
    public static final char[] ACTIVE_STATI = {'1', 'A'};
    public static final int ACTIVE_STATUS = 1;
    public static final char[] INACTIVE_STATI = {'I', '0', '9', '6', '5', '4'};
    public static final char[] UNACTIVE_STATI = {'U', '2'};
    
    protected void businessProcessing() throws TCWebException {
    	System.out.println("Login Processor Called!");
    	//System.out.println("Nextpage: " + getRequest().getAttribute(BaseServlet.NEXT_PAGE_KEY));
        /* may be null */
        String username = getRequest().getParameter(Constants.KEY_USER_HANDLE);
        String password = getRequest().getParameter(Constants.KEY_USER_PASS);
        String loginStatus = StringUtils.checkNull(getRequest().getParameter(STATUS));
        //SessionInfo info = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);

        // if not null, we got here via a form submit;
        // otherwise, skip this and just draw the login form
        //
        if (username != null) {

            password = StringUtils.checkNull(password);
            if (username.equals("") || password.equals("")) {
                getRequest().setAttribute(BaseServlet.MESSAGE_KEY, "You must enter a handle and a password.");

            } else {
                try {
                    try {
                        TCSubject sub;
                        //we need to check if they got the right user name and password before we check anything else
                        try {
                            LoginRemote login = (LoginRemote) com.topcoder.web.common.security.Constants.createEJB(LoginRemote.class);
                            sub = login.login(username, password);
                            log.debug("correct user name and password");
                        } catch (Exception e) {
                            throw new LoginException("Handle or password incorrect.");
                        }
                        char status = getStatus(sub.getUserId());
                        log.debug("status: " + status);
                        if (Arrays.binarySearch(ACTIVE_STATI, status) > 0) {
                            //check if they have an active email address
                            if (getEmailStatus(sub.getUserId()) != ACTIVE_STATUS) {
                                getAuthentication().logout();
                                log.debug("inactive email");
                                setNextPage(com.topcoder.web.tc.Constants.EMAIL_ACTIVATE);
                                setIsNextPageInContext(true);
                                return;
                            } else {
                                log.debug("user active");
                                String nextPage = getRequest().getParameter(BaseServlet.NEXT_PAGE_KEY);
                                if(nextPage != null && !nextPage.equals("")) {
                                	setNextPage(nextPage);
                                	setIsNextPageInContext(false);
                                } else { // go to active contest page
                                	getRequest().setAttribute(CodingInterfaceConstants.MODULE, Constants.RP_ACTIVE_CONTESTS);                                	
                            		setNextPage(Constants.MAIN_SERVLET);                            		
                            		setIsNextPageInContext(true);		
                                }
                                log.debug("on successful login, going to " + getNextPage());
                                getAuthentication().login(new SimpleUser(0, username, password), false);
                                return;
                            }
                        } else {
                            getAuthentication().logout();
                            if (Arrays.binarySearch(INACTIVE_STATI, status) > 0) {
                                log.debug("user inactive");
                                throw new LoginException("Sorry, your account is not active.  " +
                                        "If you believe this is an error, please contact TopCoder.");
                            } else if (Arrays.binarySearch(UNACTIVE_STATI, status) > 0) {
                                log.debug("user unactive");
                                getRequest().setAttribute(BaseServlet.MESSAGE_KEY, "Your account is not active.  " +
                                        "Please review the activation email that was sent to you after registration.");
                            } else {
                                throw new NavigationException("Invalid account status");
                            }
                        }

                    } catch (LoginException e) {
                        /* the login failed, so tell them what happened */
                        getRequest().setAttribute(BaseServlet.MESSAGE_KEY, e.getMessage());
                    }
                } catch (TCWebException e) {
                    throw e;
                } catch (Exception e) {
                    throw(new TCWebException(e));
                }
            }

            /* whatever was wrong with the submission, make sure they are logged out */
            getAuthentication().logout();
        }

        if (loginStatus.equals(STATUS_START)) {
            getRequest().setAttribute(BaseServlet.MESSAGE_KEY, "In order to continue, you must provide your user name and password.");
        }
//        getRequest().setAttribute(BaseServlet.NEXT_PAGE_KEY,
//                StringUtils.checkNull(getRequest().getParameter(BaseServlet.NEXT_PAGE_KEY)));
        setNextPage(Constants.LOGIN_JSP);
        setIsNextPageInContext(true);
    }


    /**
     * shouldn't use ejb slooooooooow
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

    private int getEmailStatus(long userId) throws Exception {
        int result;
        Email email = (Email) createEJB(getInitialContext(), Email.class);
        result = email.getStatusId(email.getPrimaryEmailId(userId, DBMS.COMMON_OLTP_DATASOURCE_NAME),
                DBMS.COMMON_OLTP_DATASOURCE_NAME);
        return result;
    }

}







