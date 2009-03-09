/*
 * SSOServiceException
 * 
 * Created Dec 22, 2008
 */
package com.topcoder.web.ejb.security;

/**
 * @author Diego Belfer (Mural)
 * @version $Id$
 */
public class SSOServiceException extends Exception {

    public SSOServiceException() {
    }

    public SSOServiceException(String message) {
        super(message);
    }

    public SSOServiceException(Throwable cause) {
        super(cause);
    }

    public SSOServiceException(String message, Throwable cause) {
        super(message, cause);
    }

}
