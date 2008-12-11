package com.topcoder.web.ejb.security;

import com.topcoder.shared.util.TCException;

/**
 * Thrown in the case that the user email address is not active.  In a case like that, the user
 * should be directed to reactivate their email address at
 * http://www.topcoder.com/tc?module=Static&d1=authentication&d2=emailActivate
 *
 * @author dok
 * @version $Id: InactiveEmailStatusException.java 68594 2008-02-21 20:00:24Z gpaul $
 *          Create Date: Feb 21, 2008
 */
public class InactiveEmailStatusException extends TCException {
    public InactiveEmailStatusException() {
        super();
    }

    public InactiveEmailStatusException(String message) {
        super(message);
    }

    public InactiveEmailStatusException(Throwable nestedException) {
        super(nestedException);
    }

    public InactiveEmailStatusException(String message, Throwable nestedException) {
        super(message, nestedException);
    }
}
