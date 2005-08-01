package com.topcoder.web.forums.model;

import com.jivesoftware.base.AuthFactory;
import com.jivesoftware.base.AuthToken;
import com.jivesoftware.base.Log;
import com.jivesoftware.base.UnauthorizedException;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.HttpObjectFactory;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.WebAuthentication;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * User: dok
 * Date: Nov 23, 2004
 * Time: 12:04:03 PM
 */
public class TCAuthFactory extends AuthFactory {

    protected static Logger log = Logger.getLogger(BaseProcessor.class);
    
    /**
     * The same token can be used for all anonymous users, so cache it.
     */
    private static final AuthToken anonymousAuth = new TCAuthToken(SimpleUser.createGuest().getId());

    /**
     *
     * @param httpServletRequest
     * @param httpServletResponse
     * @return
     * @throws UnauthorizedException
     */
    public static AuthToken getAuthToken(HttpServletRequest httpServletRequest,
                                         HttpServletResponse httpServletResponse) throws UnauthorizedException {
        
        log.debug("***IN CUSTOM AUTH");
        WebAuthentication auth = null;
        try {
            auth = new BasicAuthentication(new SessionPersistor(httpServletRequest.getSession()),
                    HttpObjectFactory.createRequest(httpServletRequest), HttpObjectFactory.createResponse(httpServletResponse));
        } catch (Exception e) {
            log.error(e);
        }
        log.debug("@@@ACTIVE USER: "+auth.getActiveUser().getUserName());
        log.debug("@@@USERNAME: "+httpServletRequest.getParameter("username"));
        log.debug("@@@PASSWORD: "+httpServletRequest.getParameter("password"));
        if (auth.getActiveUser().isAnonymous() && 
                httpServletRequest.getParameter("username") != null && 
                httpServletRequest.getParameter("password") != null) {
            try {
                auth.login(new SimpleUser(0, httpServletRequest.getParameter("username"), 
                    httpServletRequest.getParameter("password")), false);
            } catch (Exception e) {
                log.error(e);
            }
        }
        log.debug("***ACTIVE USER: "+auth.getActiveUser().getUserName());
        log.debug("***USERNAME: "+httpServletRequest.getParameter("username"));
        log.debug("***PASSWORD: "+httpServletRequest.getParameter("password"));
        return new TCAuthToken(auth.getActiveUser().getId());
    }


    /**
     * We don't allow users to login through the forums, they'll have to login
     * through the regular site.
     * @param username
     * @param password
     * @return
     * @throws UnauthorizedException
     */
    public AuthToken createAuthToken(String username, String password)
            throws UnauthorizedException {
        return null;
    }

    public AuthToken createAnonymousAuthToken() {
        return anonymousAuth;
    }

}
