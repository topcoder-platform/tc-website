package com.topcoder.shared.security;

/**
 * Interface for objects that perform user authentication.
 * @author  Porgery
 */
public interface Authentication {
    
    /** 
     * Attempts to log in the given user.
     * @param u User object to be authenticated.
     * @throws AuthenticationException Thrown if the login does not succeed.
     */    
    public void login(User u) throws AuthenticationException;
    
    /** 
     * Logs out the current user.
     */    
    public void logout();
    
    /** 
     * Determines whether the user is currently logged in.
     * @return True if the user is logged in, false otherwise.
     */    
    public boolean isLoggedIn();
    
    /**
     * Gets the current user's information.
     * @return A User object representing the current user.
     */    
    public User getUser();
    
}
