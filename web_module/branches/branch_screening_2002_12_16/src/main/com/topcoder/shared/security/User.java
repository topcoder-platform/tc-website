package com.topcoder.shared.security;

/**
 * Interface for objects that represent users.
 * @author  Porgery
 */
public interface User {
    
    /** Gets the user's id.
     * @return The user's id, as a long integer.
     */
    public long getId();
    
    /** Gets the user's name.
     * @return String containing the username.
     */
    public String getUserName();
    
    /** Gets the user's password.
     * @return String containing the password.
     */
    public String getPassword();
    
}
