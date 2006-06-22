package com.topcoder.web.common.security;

import com.topcoder.shared.security.Authentication;
import com.topcoder.shared.security.LoginException;
import com.topcoder.shared.security.User;

/**
 * interface for classes that are doing web related authentication and would like to use cookies.
 * it encapsulates how the necessary authenication information is stored and retrieved from the cookie
 *
 * @author Greg Paul
 */
public interface WebAuthentication extends Authentication {
    public static final String KNOWN_USER = "knu";

    /**
     * this looks at the cookie first, whereas inherited getUser() looks at the session only
     * implementing classes should provide some method of setting a default cookie path
     */
    User getActiveUser();

    /**
     * Attempt to log in with the given user.
     *
     * @param u
     * @param rememberUser whether or not the user
     *                     should be recognized the next time attempt to use the site
     *                     basically we're setting a cookie to remember them (getActiveUser())
     * @throws LoginException
     */
    void login(User u, boolean rememberUser) throws LoginException;

    /**
     * A user is "known" if they've ever logged in.  We do not make
     * the requirement that we have to be sure that the individual currently
     * using the computer has logged in, just that someone has used that machine
     * and logged in.  Generally, we know this by using a cookie.
     *
     * @return true if the user is "known" false otherwise
     */
    boolean isKnownUser();

}
