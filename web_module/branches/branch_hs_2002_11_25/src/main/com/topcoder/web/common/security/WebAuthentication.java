package com.topcoder.web.common.security;

import com.topcoder.shared.security.*;

/**
 * interface for classes that are doing web related authentication and would like to use cookies.
 * it encapsulates how the necessary authenication information is stored and retrieved from the cookie
 *
 * @author Greg Paul
 */ 
public interface WebAuthentication extends Authentication {
    /**
     * for sensitive sections, one should not simply go to the cookie, it should require
     * a login.  therefore we provide this method to skip the cookie check.
     */
    public User getActiveUser();
}
