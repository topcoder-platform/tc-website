package com.topcoder.web.ejb.security;

import javax.ejb.EJBException;

/**
 * For wrapping exceptions, generally we don't really know what happened.  Most likely
 * this is a configuration or run time system failure, so we're extending EJBException.
 *
 * @author dok
 * @version $Id$
 *          Create Date: Feb 21, 2008
 */
public class GeneralSecurityException extends EJBException {


    public GeneralSecurityException() {
        super();
    }

    public GeneralSecurityException(String message) {
        super(message);
    }

    public GeneralSecurityException(Exception nestedException) {
        super(nestedException);
    }

    public GeneralSecurityException(String message, Exception nestedException) {
        super(message, nestedException);
    }
}


