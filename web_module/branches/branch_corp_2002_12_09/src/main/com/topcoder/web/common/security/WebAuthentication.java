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
     * Tests if user is looged in.
     *  
     * @param checkCookie when true any of two allowed authentification methods
     * is allowed: either direct (i.e. when used MUST enter login/password via
     * form) or indirect (when user is allowed to save his autjentity
     * information in cookies). If false, user supposed to be logged in if he
     * had entered login/password within current session. Authentification by
     * means of cookie will treated as illegal (but still remains valid for
     * tasks with weaker authentification requirements). 
     *  
     * @return boolean
     */
    boolean isLoggedIn(boolean checkCookie);
}
