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
    /** this looks at the cookie first, whereas inherited getUser() looks at the session only
     * implementing classes should provide some method of setting a default cookie path
     */
    User getActiveUser();

    /**
     * Attempt to log in with the given user.
     * @param u
     * @param rememberUser whether or not the user
     * should be recognized the next time attempt to use the site
     * basically we're setting a cookie to remember them (getActiveUser())
     * @throws LoginException
     */
    void login(User u, boolean rememberUser) throws LoginException;

    /**
     * Attempt to login with the given user.
     * @param u
     * @param rememberUser whether or not the user
     * should be recognized the next time attempt to use the site
     * basically we're setting a cookie to remember them (getActiveUser())
     * @param dataSource this is the dataSource name that will be used
     * to validate the given credentials
     * @throws LoginException
     */
    void login(User u, boolean rememberUser, String dataSource) throws LoginException;


}
