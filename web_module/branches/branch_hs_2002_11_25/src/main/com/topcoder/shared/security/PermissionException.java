package com.topcoder.shared.security;

/**
 * Indicates a permission test was failed.
 *
 * @author Ambrose Feinstein
 */ 
public class PermissionException extends AuthenticationException {

    public PermissionException(String s) {
        super(s);
    }

    public PermissionException(Exception e) {
        super(e.getMessage());
    }
}
