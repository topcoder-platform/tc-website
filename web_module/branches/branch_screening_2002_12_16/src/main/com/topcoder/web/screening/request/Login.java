package com.topcoder.web.screening.request;

import javax.servlet.*;
import com.topcoder.shared.security.*;
import com.topcoder.web.common.security.*;
import com.topcoder.shared.util.logging.Logger;

/**
 * Processes a login request.
 * @author  Porgery
 */
public class Login extends BaseProcessor {
    
    private static Logger log = Logger.getLogger(Login.class);

    static String HANDLE_PARAM = "handle";
    static String PASSWORD_PARAM = "password";
    static String REDIRECT_PARAM = "redir";
    static String MESSAGE_PARAM = "msg";
    static String FIRSTVISIT_PARAM = "firstVisit";
    static String LOGIN_DEFAULT_URL = "/screening";
    
    /** Implements the processing step.
     * @throws Exception
     */
    public void process() throws Exception {
        log.debug("Processing login");
        ServletRequest request = getRequest();
        
        String handle = request.getParameter(HANDLE_PARAM);
        String password = request.getParameter(PASSWORD_PARAM);
        
        if( handle == null || password == null ||
            handle.equals("") || password.equals("") )
        {
            String firstVisit = request.getParameter(FIRSTVISIT_PARAM);
            if( firstVisit!=null && firstVisit.equals("false") ){
                log.debug("No username and/or password");
                request.setAttribute(MESSAGE_PARAM,
                    "Please enter both a username and a password.");
            }
            setNextPage("/login.jsp");
            setNextPageInContext(true);
            return;
        }

        try{
            getAuthentication().login(new SimpleUser(-1,handle,password));
        }catch(AuthenticationException ae){
            log.debug("Login failed");
            setNextPage("/login.jsp");
            setNextPageInContext(true);
            request.setAttribute(MESSAGE_PARAM,
                "Incorrect username and/or password.");
            return;
        }

        String redirect = request.getParameter(REDIRECT_PARAM);
        if(redirect == null || redirect.equals(""))
            redirect = LOGIN_DEFAULT_URL;
        log.debug("Login succeeded, redirecting to " + redirect);
        setNextPage(redirect);
        setNextPageInContext(false);
    }
    
}
