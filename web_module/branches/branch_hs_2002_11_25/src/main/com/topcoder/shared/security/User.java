package com.topcoder.shared.security;

/**
 * interface for User objects.
 *
 * @author Greg Paul
 */
public interface User {
    public long getId();
    public String getUserName();
    public String getPassword(); 
}
