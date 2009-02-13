package com.topcoder.web.common.security;

import com.topcoder.shared.security.Authentication;
import com.topcoder.shared.security.User;

/**
 * interface for classes that are doing web related authentication and would
 * like to use cookies. it encapsulates how the necessary authenication
 * information is stored and retrieved from the cookie
 * 
 * @author Greg Paul
 * @author djFD molc@mail.ru
 * @version 1.02
 */
public interface WebAuthentication extends Authentication {

    /**
     * Returns <i>active</i> user, ie. user who seems to be known to the system
     * but it is possible that he is not logged in yet. If there is user
     * currently logged in, then this method will return same user as getUser()
     * method of super type. Otherwise, active user is to be determined via
     * cookies, received from user in which case this method will return some
     * valid user, if pre-identification was successfull. If not, then anonymous
     * user object will be returned.
     * 
     * @return User active, but possible still not logged in, user. If user is
     * not logged in, then his password field will be set as null for security
     * reasons.
     */
    public User getActiveUser();
}
