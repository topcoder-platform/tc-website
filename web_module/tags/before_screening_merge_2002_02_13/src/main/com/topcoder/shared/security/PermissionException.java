package com.topcoder.shared.security;

/**
 * Indicates a permission test was failed.
 *
 * @author Ambrose Feinstein
 */
public class PermissionException extends AuthenticationException {

    private User user;

    public PermissionException(String s) {
        super(s);
    }

    public PermissionException(Exception e) {
        super(e.getMessage());
    }

    public PermissionException(String s, User u) {
        super(s);
        user = u;
    }

    public User getUser() {
        return user;
    }
}
