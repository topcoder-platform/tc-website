package com.topcoder.web.corp.request;

import com.topcoder.shared.security.User;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.corp.stub.UserStub;

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
    public static final String KEY_USER_HANDLE = "handle";
    public static final String KEY_USER_PASS   = "passw";
    public static final String KEY_DESTINATION_PAGE = "dest";
    // modes either full (form to be filled returned to user)
    // or mini (user fill out miniform at the top of screen)  
    public static final String KEY_LOGINMODE   = "lm";
    public static final String KEY_MESSAGE     = "msg";

    /**
     * @see com.topcoder.web.corp.request.BaseProcessor#businessProcessing()
     */
    void businessProcessing() throws Exception {
        
        String handle = request.getParameter(KEY_USER_HANDLE);
        User possibleUser = new UserStub(handle, null, 0, null);
        BasicAuthentication authToken = getAuthenticityToken();
        authToken.login(possibleUser);
        possibleUser = authToken.getLoggedInUser();
        
        System.err.println("-----"+possibleUser+"------");

        // done. if there is destination page then go there
        String destination = request.getParameter(KEY_DESTINATION_PAGE);
        if( destination != null && destination.length() != 0 ) {
            pageInContext = true;
            nextPage = destination;
            return;
        }
        else { // go to back to recent page
            pageInContext = true;
            nextPage = SessionPersistor.getInstance(request).getLastPage();
            return;
        }
    }
}
