package com.topcoder.web.ejb.security;

import com.topcoder.shared.util.TCException;

/**
 * For wrapping exceptions, generally we don't really know what happened.
 *
 * @author dok
 * @version $Id$
 *          Create Date: Feb 21, 2008
 */
public class GeneralAuthenticationException extends TCException {


    public GeneralAuthenticationException() {
        super();
    }

    public GeneralAuthenticationException(String message) {
        super(message);
    }

    public GeneralAuthenticationException(Throwable nestedException) {
        super(nestedException);
    }

    public GeneralAuthenticationException(String message, Throwable nestedException) {
        super(message, nestedException);
    }
}


