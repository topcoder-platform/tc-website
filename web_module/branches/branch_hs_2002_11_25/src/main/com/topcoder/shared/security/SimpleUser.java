package com.topcoder.shared.security;

/**
 * Simple container for a User.
 *
 * @author Ambrose Feinstein
 */
public class SimpleUser implements User {

    private long id;
    private String username;
    private String password;

    /** Construct a User object having the given values. */
    public SimpleUser(long id, String username, String password) {
        this.id = id;
        this.username = username;
        this.password = password;
    }

    public long getId() {
        return id;
    }

    public String getUserName() {
        return username;
    }

    public String getPassword() {
        return password;
    }
}
