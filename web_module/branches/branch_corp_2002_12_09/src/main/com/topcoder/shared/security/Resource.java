package com.topcoder.shared.security;

/**
 * interface for resources, they could be web pages, web applications etc.
 * anything that one might require authentication for access to.
 * 
 * @author Greg Paul
 * @author djFD molc@mail.ru
 * @version 1.02
 */
public interface Resource {
    
    /**
     * Action resource describing new user creation in same group as action
     * issuer.
     */
    public static final String RC_CREATE_NEW_USER_IN_GROUP = "create new user";
    
    /**
     * Action resource describing modification of users in same group as
     * issuer has.
     */
    public static final String RC_MODIFY_USER_IN_GROUP = "modify user";

    /**
     * 
     * @return String
     */
    String getName();
}
