package com.topcoder.web.ejb.security;

import com.topcoder.shared.util.TCException;

/**
 * Thrown in the case that the user has not yet activated their account.
 * They should be directed to see their activation email and activate their account.
 *
 * @author dok
 * @version $Id$
 *          Create Date: Feb 21, 2008
 */
public class UnactiveUserStatusException extends TCException {
    public UnactiveUserStatusException() {
        super();
    }

    public UnactiveUserStatusException(String message) {
        super(message);
    }

    public UnactiveUserStatusException(Throwable nestedException) {
        super(nestedException);
    }

    public UnactiveUserStatusException(String message, Throwable nestedException) {
        super(message, nestedException);
    }
}
