package com.topcoder.web.common.security;

import com.topcoder.shared.security.LoginException;
import com.topcoder.shared.security.Persistor;
import com.topcoder.shared.security.Resource;
import com.topcoder.shared.security.User;
import com.topcoder.shared.security.SimpleUser;
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

    private final User guest = SimpleUser.createGuest();

    private User currentUser = SimpleUser.createGuest();

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
        log.info("attempting login as " + u.getId() + " path: " + defaultCookiePath.getName() + " remember " + rememberUser);
        try {
            currentUser = u;
            log.info("login succeeded");

        } catch (Exception e) {
            log.info("login failed", e);
            //not necessarily accurate, but gotta say something...
            throw new LoginException("Handle or password incorrect.");
        }
    }

    public void login(User u, boolean rememberUser, String dataSource) throws LoginException {
        throw new RuntimeException("Not implemented");
    }

    /**
     * Get the user currently logged user.
     */
    public User getActiveUser() {
        if (currentUser != null && currentUser.getId() != guest.getId()) {
            return currentUser;
        } else {
            return super.getActiveUser();
        }
    }

    /**
     * Get the user currently logged user.
     */
    public User getUser() {
        if (currentUser != null && currentUser.getId() != guest.getId()) {
            return currentUser;
        } else {
            return super.getUser();
        }
    }

    /**
     * Returns true if the user is not guest/anonymous.
     */
    public boolean isKnownUser() {
        if (currentUser != null && currentUser.getId() != guest.getId()) {
            return true;
        } else {
            return super.isKnownUser();
        }
    }

    /**
     * Logs user out.
     */
    public void logout() {
        super.logout();
        currentUser = guest;
    }


}
