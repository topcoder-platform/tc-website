package com.topcoder.web.screening.request;

import javax.servlet.*;
import com.topcoder.shared.security.*;
import com.topcoder.web.common.security.*;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.screening.common.Constants;

/**
 * Processes a login request.
 * @author  Porgery
 */
public class Login extends BaseProcessor {
    
    private static Logger log = Logger.getLogger(Login.class);

    /** Implements the processing step.
     * @throws Exception
     */
    public void process() throws Exception {
        log.debug("Processing login");
        ServletRequest request = getRequest();
        
        String handle = request.getParameter(Constants.HANDLE);
        String password = request.getParameter(Constants.PASSWORD);
        
        if( handle == null || password == null ||
            handle.equals("") || password.equals("") )
        {
            String firstVisit = request.getParameter(Constants.FIRST_ATTEMPT);
            if( firstVisit!=null && firstVisit.equals("false") ){
                log.debug("No username and/or password");
                request.setAttribute(Constants.MESSAGE_PARAMETER,
                    "Please enter both a username and a password.");
            }
            setNextPage(Constants.LOGIN_PAGE);
            setNextPageInContext(true);
            return;
        }

        try{
            getAuthentication().login(new SimpleUser(-1,handle,password));
        }catch(AuthenticationException ae){
            log.debug("Login failed");
            setNextPage(Constants.LOGIN_PAGE);
            setNextPageInContext(true);
            request.setAttribute(Constants.MESSAGE_PARAMETER,
                "Incorrect username and/or password.");
            return;
        }

        String redirect = request.getParameter(Constants.REDIRECT);
        if(redirect == null || redirect.equals(""))
            redirect = Constants.CONTROLLER_URL;
        log.debug("Login succeeded, redirecting to " + redirect);
        setNextPage(redirect);
        setNextPageInContext(false);
    }
    
}
