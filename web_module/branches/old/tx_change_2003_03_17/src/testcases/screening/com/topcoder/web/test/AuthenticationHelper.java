package com.topcoder.web.test;

import com.topcoder.shared.security.*;
import com.topcoder.web.common.security.*;

/**
 * Helper class implementing WebAuthentication interface
 * 
 * @author Misha
 */
public class AuthenticationHelper implements WebAuthentication {
	
	public User myUser=null;

    /** 
     * Attempts to log in the given user.
     * for testing purposes tests that password == username + "123"
     * 
     * @param u User object to be authenticated.
     * @throws AuthenticationException Thrown if the login does not succeed.
     */    
    public void login(User u) throws AuthenticationException {
    	if (u.getUserName() == null || u.getPassword()==null ) {
    		throw new AuthenticationException("Illegal null name or password");
    	}
    	String s = u.getUserName() + "123";
    	if (!s.equals(u.getPassword())) {
    		throw new AuthenticationException("Wrong password");
    	}
    	myUser = u;
    }
    
    /** 
     * Logs out the current user.
     */    
    public void logout(){
    	myUser = null;
    }
    
    /**
     * Gets the current user's information.
     * @return A User object representing the current user.
     */    
    public User getUser(){
    	return myUser;
    }    
    /**
     * Gets the current user's information.
     * @return A User object representing the current user.
     */    
    public User getActiveUser(){
    	return myUser;
    }    
}
