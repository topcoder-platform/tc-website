package com.topcoder.shared.security;

/**
 * interface for User objects.
 *
 * @author Greg Paul, Ambrose Feinstein
 */
public interface User {
    /** Constants for anonymous users */
    public long getId();

    public String getUserName();

    public String getPassword();

    public boolean isAnonymous();
}
