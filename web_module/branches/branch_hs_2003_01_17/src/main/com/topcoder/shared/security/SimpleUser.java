package com.topcoder.shared.security;

import java.io.*;

/**
 * Simple immutable container for a User.
 *
 * @author Ambrose Feinstein
 */
public class SimpleUser implements User, Serializable {

    private static int GUEST_ID = -1;
    private static String GUEST_NAME = "anonymous";

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

    public boolean isGuest() {
        return id == GUEST_ID;
    }

    public static User createGuest() {
        return new SimpleUser(GUEST_ID, GUEST_NAME, "");
    }
}
