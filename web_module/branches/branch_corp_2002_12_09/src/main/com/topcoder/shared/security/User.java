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
    
    /**
     * Returns ID of the user.
     * 
     * @return long user ID
     */
    long getId();
    
    /**
     * Returns username (ie login or handle) of the user. 
     * @return String login name  of the user
     */
    String getUserName();
    
    /**
     * Returns password of the user (!)violates sequrity(!). 
     * @return String password of the user.
     */
    String getPassword();
}
