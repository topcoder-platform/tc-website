package com.topcoder.web.ejb.security;

import com.topcoder.shared.util.TCException;

/**
 * @author dok
 * @version $Id$
 *          Create Date: Feb 28, 2008
 */
public class UnknownUserException extends TCException {
    public UnknownUserException() {
        super();
    }

    public UnknownUserException(String message) {
        super(message);
    }

    public UnknownUserException(Throwable nestedException) {
        super(nestedException);
    }

    public UnknownUserException(String message, Throwable nestedException) {
        super(message, nestedException);
    }
}
