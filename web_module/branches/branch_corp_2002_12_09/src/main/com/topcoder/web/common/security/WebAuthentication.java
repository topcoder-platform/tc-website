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
     * Because user can be connected while not logged in yet, this method will
     * return user, who is currenly connected. Eg. user who provided logon name
     * but omitted password supposed to be connected but he does not logged in.
     * So returned user must be supposed as untrusted user because
     * authentification process supposes that user must trust his identity by
     * providing valid password.
     * 
     * @param checkCookie when true, then cookies will be checked.
     * @return User currently connected user
     */
    public User getUser(boolean checkCookie);
    
    /**
     * Get current user logged out. If parameter is true, then cookies will be
     * reset too (so user becomes disconnected). 
     * 
     * @param clearCookies specifies, if connection cookies must be cleared too
     */
    public void logout(boolean clearCookies); 
}
