package com.topcoder.web.screening.request;

import javax.servlet.*;
import com.topcoder.shared.security.*;
import com.topcoder.web.common.security.*;

/**
 * Processes a login request.
 * @author  Porgery
 */
public class Login extends BaseProcessor {
    
    static String HANDLE_PARAM = "handle";
    static String PASSWORD_PARAM = "password";
    static String REDIRECT_PARAM = "redir";
    static String MESSAGE_PARAM = "msg";
    
    /** Creates a new instance of Login */
    public Login() {
    }
    
    /** Implements the processing step.
     * @throws Exception
     */
    public void process() throws Exception {
        ServletRequest request = getRequest();
        
        String handle = (String)request.getAttribute(HANDLE_PARAM);
        String password = (String)request.getAttribute(PASSWORD_PARAM);
        
        if( handle == null || password == null ||
            handle.equals("") || password.equals("") )
        {
            setNextPage("login.jsp");
            setNextPageInContext(true);
            request.setAttribute(MESSAGE_PARAM,
                "Please enter both a username and a password.");
            return;
        }

        try{
            getAuthentication().login(new SimpleUser(-1,handle,password));
        }catch(AuthenticationException ae){
            setNextPage("login.jsp");
            setNextPageInContext(true);
            request.setAttribute(MESSAGE_PARAM,
                "Incorrect username and/or password.");
            return;
        }

        String redirect = (String)request.getAttribute(REDIRECT_PARAM);
        if(redirect == null || redirect.equals(""))
            redirect = "/";
        setNextPage(redirect);
        setNextPageInContext(false);
    }
    
}
