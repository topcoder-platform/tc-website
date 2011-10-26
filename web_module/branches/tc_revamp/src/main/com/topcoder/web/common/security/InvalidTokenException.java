/*
 * InvalidTokenException
 * 
 * Created Dec 22, 2008
 */
package com.topcoder.web.common.security;

/**
 * @author Diego Belfer (Mural)
 * @version $Id: InvalidTokenException.java 74077 2008-12-22 17:26:18Z dbelfer $
 */
public class InvalidTokenException extends Exception {

    public InvalidTokenException() {
        super();
    }

    public InvalidTokenException(String message, Throwable cause) {
        super(message, cause);
    }

    public InvalidTokenException(String message) {
        super(message);
    }

    public InvalidTokenException(Throwable cause) {
        super(cause);
    }

}
