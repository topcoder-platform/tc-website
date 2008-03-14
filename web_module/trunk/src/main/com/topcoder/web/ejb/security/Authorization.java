package com.topcoder.web.ejb.security;

import com.topcoder.shared.security.Resource;

/**
 * Just a simple interface in the spirit of the EJB Business Methods Interface pattern that will contain all the methods
 * we want.  It'll be extended by the Local and Remote interfaces basically just so that we only have to modify
 * this interface in one place rather than both of those interfaces.
 *
 * @author dok
 * @version $Id$
 *          Create Date: Feb 28, 2008
 */

public interface Authorization {

    /**
     * Check if the user associated with the given userId has access to the given resource.
     * If the userId is invalid, we'll return quietly with false
     *
     * @param userId   the userId for the user
     * @param resource the resource we're checking for entitlment
     * @return true if the user has access, false otherwise
     */
    boolean hasPermission(long userId, Resource resource);

    /**
     * Check if the user associated with the given userId has access to the given resource.
     * If the userId is invalid, we'll return quietly with false
     * <p/>
     * This method is provided so that it can be exposed as a web service.
     * Currently, we don't have an easy way to marshal an interface ({@link Resource}).
     * The string is expected to be the value that would be returned by <code>Resource.getName</code>
     *
     * @param userId   the userId for the user
     * @param resource the resource we're checking for entitlment
     * @return true if the user has access, false otherwise
     */
    boolean hasPermision(long userId, String resource);
}
