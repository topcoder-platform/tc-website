package com.topcoder.web.common.security;

import com.topcoder.shared.security.Authentication;
import com.topcoder.shared.security.User;
import com.topcoder.shared.security.LoginException;

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
     * should be recognized the next time they log in (getActiveUser())
     * @throws LoginException
     */
    void login(User u, boolean rememberUser) throws LoginException;


}
