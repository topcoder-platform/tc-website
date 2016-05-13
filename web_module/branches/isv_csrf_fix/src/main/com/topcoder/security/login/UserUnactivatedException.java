/*
 * Copyright (C) 2014 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.login;

    
/**
 * This exception will be thrown if the user to login is not activated yet.
 * <p>
 * <strong>Thread Safety:</strong> This class is not thread-safe as its parent is not thread-safe.
 * </p>
 * 
 * @author tangzx
 * @version 1.0
 */
public class UserUnactivatedException extends AuthenticationException {
    /**
     * Default constructor.
     */
    public UserUnactivatedException() {
        super();
    }
	
    /**
     * Constructor with exception message.
     */
    public UserUnactivatedException(String message) {
        super(message);
    }
}
