package com.topcoder.web.test;

import com.topcoder.shared.security.*;

/**
 * @author Misha
 *
 * To change this generated comment edit the template variable "typecomment":
 * Window>Preferences>Java>Templates.
 * To enable and disable the creation of type comments go to
 * Window>Preferences>Java>Code Generation.
 */
public class AuthenticationHelper implements Authentication {
	
	public User myUser=null;

    /** 
     * Attempts to log in the given user.
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
}
