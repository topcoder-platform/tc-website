package com.topcoder.web.corp.common;

import com.topcoder.shared.security.User;
import com.topcoder.shared.security.Resource;

/**
 *
 * @author Porgery
 * @author Grimicus
 */
public class PermissionDeniedException extends ScreeningException {

    /**
     * Default Constructor
     */
    public PermissionDeniedException() {
        super();
    }

    public PermissionDeniedException(User u) {
        super(u.getUserName() + " does not have permission to access resource.");
    }

    public PermissionDeniedException(User u, String message) {
        super(u.getUserName() + ":" + message);
    }

    public PermissionDeniedException(User u, Resource r) {
        super(u.getUserName() + " does not have permission to access " + r.getName());
    }

    public PermissionDeniedException(User u, Resource r, Throwable nestedException) {
        super(u.getUserName() + " does not have permission to access " + r.getName(), nestedException);
   }

    /**
     * <p>
     * Constructor taking a string message
     * </p>
     *
     * @param message - the message of the exception
     */
    public PermissionDeniedException(String message) {
        super(message);
    }

    /**
     * <p>
     * Constructor taking a nested exception
     * </p>
     *
     * @param nestedException the nested exception
     */
    public PermissionDeniedException(Throwable nestedException) {
        super(nestedException);
    }

    /**
     * <p>
     * Constructor taking a nested exception and a string
     * </p>
     *
     * @param message the message of this exception
     * @param nestedException the nested exception
     */
    public PermissionDeniedException(String message, Throwable nestedException) {
        super(message, nestedException);
    }


}
