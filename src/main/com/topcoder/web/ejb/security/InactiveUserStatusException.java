package com.topcoder.web.ejb.security;

import com.topcoder.shared.util.TCException;

/**
 * Thrown in the case that the user's status is not active.
 * Generally this means that they've been kicked out, or it's a duplicate
 * account or that they requested that their account be removed.
 *
 * @author dok
 * @version $Id: InactiveUserStatusException.java 68594 2008-02-21 20:00:24Z gpaul $
 *          Create Date: Feb 21, 2008
 */
public class InactiveUserStatusException extends TCException {
    public InactiveUserStatusException() {
        super();
    }

    public InactiveUserStatusException(String message) {
        super(message);
    }

    public InactiveUserStatusException(Throwable nestedException) {
        super(nestedException);
    }

    public InactiveUserStatusException(String message, Throwable nestedException) {
        super(message, nestedException);
    }
}
