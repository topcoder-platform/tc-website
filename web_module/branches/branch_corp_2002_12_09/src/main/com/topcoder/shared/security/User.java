package com.topcoder.shared.security;

/**
 * interface for User objects
 * 
 * @author Greg Paul
 * @author djFD molc@mail.ru
 * @version 1.02
 */
public interface User {
    
    /**
     * 
     * @return long
     */
    long getId();
    
    /**
     * 
     * @return String
     */
    String getUserName();
    
    /**
     * 
     * @return String
     */
    String getPassword();
}
