package com.topcoder.shared.security;

/**
 * My comments/description/notes go here
 * 
 * 
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public class InvalidLogonException extends AuthenticationException {
    public InvalidLogonException(Throwable t) {
        super(t);
    }
    
    public InvalidLogonException() {}
    
    public InvalidLogonException(String msg) {
        super(msg);
    }
}
