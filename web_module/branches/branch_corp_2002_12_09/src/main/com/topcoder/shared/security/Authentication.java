package com.topcoder.shared.security;

import com.topcoder.security.login.AuthenticationException;

/**
 * interface for classes that implement an authentication scheme, ie, a way to
 * log in. it also holds whether or not they are logged in using the persistance
 * method specified.
 * 
 * @author Greg Paul
 * @author djFD molc@mail.ru
 * @version 1.02
 */
public interface Authentication {
	
    /**
     * Gets provided user logged in.
     * 
     * @param user an user to be logged in
     * @throws AuthenticationException supplied userbane/password combination is
     * invalid.
     * 
     */
    public void login(User user) throws AuthenticationException;
    
    /**
     * Gets current user logged out.
     */
    public void logout();
    
    /**
     * Returns user who is currently logged in. If there is not the
     * user already logged in, then returned user is anonymous one, ie. method
     * isAnonymous() of returned user object will return true.
     * 
     * @return User currently logged in.
     */
    public User getUser();
}
