package com.topcoder.web.common.security;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.security.*;
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
      * Use the security component to log the supplied user in.
      * If login succeeds, set a cookie if rememberUser is true, and record status in the persistor.
      * If login fails, throw a LoginException.
     * @param u
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
