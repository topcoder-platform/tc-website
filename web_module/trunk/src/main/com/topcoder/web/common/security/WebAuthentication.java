package com.topcoder.web.common.security;

import com.topcoder.shared.security.Authentication;
import com.topcoder.shared.security.User;
import com.topcoder.shared.security.Resource;
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

    /** this looks at the cookie first, whereas inherited getUser() looks at the session only
     * use the specified resource to determine the path for the cookie
     */
    User getActiveUser(Resource r);

    /**
     * log in with the specified resource for a path in the cookie
     * @param r
     * @param u
     * @throws LoginException
     */
    void login(Resource r, User u) throws LoginException;

    /** log out with the specified resource for a path in the cookie
     *
     * @param r
     */
    void logout(Resource r);

}
