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
     * Return name of the restricted rights resource 
     * @return String
     */
    public String getName();
}
