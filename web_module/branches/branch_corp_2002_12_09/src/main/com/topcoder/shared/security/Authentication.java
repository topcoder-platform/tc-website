package com.topcoder.shared.security;

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
    void login(User user) throws AuthenticationException;
    
    /**
     * Gets current user logged out.
     */
    void logout();
    
    /**
     * Returns true if connected user is also logged in.
     * 
     * @return boolean true if user returned by getUser() method is logged in
     * and false otherwise.
     */
    boolean isLoggedIn();
    
    /**
     * Returns currently connected user. User maybe either logged in or not yet.
     * If there is not user connected, then returned user will be anonymous one.
     * 
     * @return User currently connected User.
     */
    User getUser();
}
