package com.topcoder.shared.security;

/**
 * Interface for User objects. As for me, storing passwords in plain text is not
 * very good idea, taking into account that some users will perform online money
 * transactions. So it would be better to replace getPassword() method with
 * something like boolean isValidPassword(String password). Sipmlest approach is
 * to store some hashes from passwords (MD5, etc.)
 * 
 * @author Greg Paul
 * @author djFD molc@mail.ru
 * @version 1.02
 */
public interface User {
    public static final int USER_ANONYMOUS_ID = -1;
    public static final String USER_ANONYMOUS_HANDLE = "anonymous";
    
    /**
     * Returns ID of the user.
     * 
     * @return long user ID
     */
    public long getId();
    
    /**
     * Returns username (ie login or handle) of the user. 
     * @return String login name  of the user
     */
    public String getUserName();
    
    /**
     * Returns password of the user (!)violates sequrity(!). 
     * @return String password of the user.
     */
    public String getPassword();
    
    
//    /**
//     * Returns 
//     * @return String
//     */
//    public String getGroup();
    
    /**
     * Shows is user anonymous or not.
     * @return boolean true if this user is anonymous one
     */
    public boolean isAnonymous();
        
}
