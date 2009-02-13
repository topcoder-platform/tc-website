package com.topcoder.web.common;

import com.topcoder.shared.security.User;
import com.topcoder.shared.security.Resource;

/**
 * Indicates a permission test was failed.
 *
 * @author Ambrose Feinstein
 */
public class PermissionException extends TCWebException {

    private User user;
    private Resource resource;

    public PermissionException(User u, Resource r) {
        super(u.getUserName() + " does not have permission to access " + r.getName());
        user = u;
        resource = r;
    }

    public PermissionException(User u, Resource r, Exception e) {
        super(u.getUserName() + " does not have permission to access " + r.getName(), e);
        user = u;
        resource = r;
    }

    public User getUser() {
        return user;
    }

    public Resource getResource() {
        return resource;
    }
}
