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
     * 
     * @param u
     * @throws AuthenticationException
     */
    void login(User u) throws AuthenticationException;
    
    /**
     * 
     * @param u
     */
    void logout(User u);
    
    /**
     * 
     * @return boolean
     */
    boolean isLoggedIn();
    
    /**
     * 
     * @return User
     */
    User getLoggedInUser();
}
