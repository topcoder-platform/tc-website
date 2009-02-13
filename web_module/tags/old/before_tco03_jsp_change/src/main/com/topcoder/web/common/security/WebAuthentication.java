package com.topcoder.web.common.security;

import com.topcoder.shared.security.Authentication;
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

}
