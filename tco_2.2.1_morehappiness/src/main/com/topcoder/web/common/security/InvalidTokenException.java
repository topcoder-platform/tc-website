/*
 * InvalidTokenException
 * 
 * Created Dec 22, 2008
 */
package com.topcoder.web.common.security;

/**
 * @author Diego Belfer (Mural)
 * @version $Id$
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
