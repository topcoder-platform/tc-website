package com.topcoder.web.common.security;

import com.topcoder.shared.security.Authentication;

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
     * 
     * @param checkCookie
     * @return boolean
     */
    boolean isLoggedIn(boolean checkCookie);
}
