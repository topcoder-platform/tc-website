package com.topcoder.shared.security;

/**
 * A very basic implementation of a User.
 * @author  Porgery
 */
public class SimpleUser implements User {
    
    long id;
    String userName;
    String password;
    
    private SimpleUser() {};
    
    /** Creates a new instance of SimpleUser */
    public SimpleUser(long id, String userName, String password) {
        this.id = id;
        this.userName = userName;
        this.password = password;
    }
    
    /** Gets the user's id.
     * @return The user's id, as a long integer.
     */
    public long getId() {
        return id;
    }
    
    /** Gets the user's password.
     * @return String containing the password.
     */
    public String getPassword() {
        return password;
    }
    
    /** Gets the user's name.
     * @return String containing the username.
     */
    public String getUserName() {
        return userName;
    }
    
}
