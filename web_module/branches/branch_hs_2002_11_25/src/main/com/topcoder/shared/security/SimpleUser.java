package com.topcoder.shared.security;

/**
 * Simple container for a User.
 *
 * @author Ambrose Feinstein
 */
public class SimpleUser implements User {

    private long id = 0;
    private String username = "";
    private String password = "";

    /** Construct an anonymous User. */
    public SimpleUser() {
    }

    /** Construct a User object having the given user id. */
    public SimpleUser(long id) {
        this.id = id;
    }

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
