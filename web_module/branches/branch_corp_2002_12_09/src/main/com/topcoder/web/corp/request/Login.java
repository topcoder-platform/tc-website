package com.topcoder.web.corp.request;

//import com.topcoder.shared.security.AuthenticationException;
//import com.topcoder.shared.security.InvalidLogonException;
import com.topcoder.security.login.AuthenticationException;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.security.User;
import com.topcoder.web.common.security.SessionPersistor;

/**
 * class to process a log in request.  it will take at least the following
 * parameters:<br>
 * handle - the handle that the person is attempting to log in as<br>
 * password - the password supplied by the user with his/her login attempt.<br>
 * redirect page - a page to redirect to if it is a successful login.
 * message - a message to be displayed on the login screen if this is going to
 * be a redirect.
 * 
 * 
 * it will instantiate an Authentication object and a user object from the
 * parameters passed in the request. it will then attempt to log the user in.
 * if successfull, a cookie will be added to the response containing an
 * encrypted userid and flag which determines that they are in fact logged in.
 * if the login is successfull and there is a redirect page provided, then
 * redirect to that page.  if the login fails and there is a redirect page
 * provided, the request should be forwarded back to the login page with a
 * message set explaining why the login failed. not that the redirect page
 * should still be in the request.  if the login fails and there is no redirect
 * page, forward back to the login page with an appropriate message.  if the
 * login succeeds and there is no redirect page, redirect to the home page.
 * redirect vs. forward is important here and will be determined by how the
 * nextPageInContext flag is set.<br>
 * 
 * true  the controller should forward<br>
 * 
 * false, the controller should redirect.<br>
 * 
 * @author Greg Paul
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public class Login extends BaseProcessor {
    public static final String KEY_USER_HANDLE      = "handle";
    public static final String KEY_USER_PASS        = "passw";
    public static final String KEY_DESTINATION_PAGE = "dest";
    
    // modes either full (form to be filled returned to user)
    // or mini (user fill out miniform at the top of screen)  
    public static final String KEY_LOGINMODE   = "lm";
    public static final String KEY_MESSAGE     = "msg";

    /**
     * @see com.topcoder.web.corp.request.BaseProcessor#businessProcessing()
     */
    void businessProcessing() throws AuthenticationException {
        if( ! authToken.getUser().isAnonymous() ) {
            throw new AuthenticationException("Already logged in. Try logout at first");
        }
        if( ! "POST".equals(request.getMethod()) ) {
            pageInContext = true;
            nextPage = SessionPersistor.getInstance(request.getSession(true))
                       .popLastPage();
            return;
        }
        
        boolean miniLogin = false;
        try {
            miniLogin = Integer.parseInt(request.getParameter(KEY_LOGINMODE)) == 1;
        }
        catch(Exception e) {}

        String handle = request.getParameter(KEY_USER_HANDLE);
        setFormFieldDefault(KEY_USER_HANDLE, handle == null ? "" : handle);

        String passw = request.getParameter(KEY_USER_PASS);
        setFormFieldDefault(KEY_USER_PASS, "");
        if( handle == null || handle.trim().length() == 0 ) {
            markFormFieldAsInvalid(KEY_USER_HANDLE, "Handle must not be empty");
        }
        log.debug("login attempt[login/passw]: "+handle+"/"+passw);

        User possibleUser = new SimpleUser(handle, passw);

        try {
            authToken.login(possibleUser);
            log.debug("user "+possibleUser.getUserName()+" has logged in");
        }
        catch(AuthenticationException ae) {
            markFormFieldAsInvalid(
                KEY_USER_PASS,
                "Combination of handle/password entered is invalid"
            );
            throw ae;
        }
        
        
        // done. if there is destination page then go there
        String destination = request.getParameter(KEY_DESTINATION_PAGE);

        if( ! miniLogin ) {
            SessionPersistor.getInstance(request.getSession(true)).popLastPage();
        }

        // if destination is null then controller will fetch recently viewed page
        nextPage = destination;
        
        pageInContext = false; // ensures all request parameters are dropped off
        return;
    }
}
