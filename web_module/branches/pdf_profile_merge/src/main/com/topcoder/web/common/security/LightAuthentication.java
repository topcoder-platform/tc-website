package com.topcoder.web.common.security;

import com.topcoder.shared.security.LoginException;
import com.topcoder.shared.security.Persistor;
import com.topcoder.shared.security.Resource;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;

/**
 * This authentication doesn't really authenticate, really its to track
 * a user as being logged in.  It expects that true authentication has
 * already taken place whenthe login method is called.  It will, however,
 * require that the user exist in our system.
 * @author Greg Paul
 */
public class LightAuthentication extends BasicAuthentication {

    private static Logger log = Logger.getLogger(LightAuthentication.class);


    /**
     * Construct an authentication instance backed by the given persistor
     * and HTTP request and response.
     */
    public LightAuthentication(Persistor userPersistor, TCRequest request, TCResponse response) throws Exception {
        super(userPersistor, request, response);
    }

    /**
     * Construct an authentication instance backed by the given persistor
     * and HTTP request, response and cookie path resource.
     */
    public LightAuthentication(Persistor userPersistor, TCRequest request, TCResponse response, Resource r) throws Exception {
        super(userPersistor, request, response, r);
    }


    /**
     * Just set their cookie and whatnot to indicate they're logged in.
     * The server takes care of the actual login, we're just setting the cookie here
     * @param u
     * @param rememberUser
     * @throws LoginException
     */
    public void login(User u, boolean rememberUser) throws LoginException {
        log.info("attempting login as " + u.getUserName() + " path: " + defaultCookiePath.getName());
        try {
            long uid = u.getId();
            setCookie(uid, rememberUser);
            setUserInPersistor(makeUser(uid));
            log.info("login succeeded");

        } catch (Exception e) {
            log.info("login failed", e);
            //not necessarily accurate, but gotta say something...
            throw new LoginException("Handle or password incorrect.");
        }
    }

}
