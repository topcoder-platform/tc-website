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
     * @throws GeneralSecurityException we're forced to throw this checked exception right now.  See
     *                                  {@link GeneralSecurityException} docs for more information.
     */
    boolean hasPermission(long userId, Resource resource) throws GeneralSecurityException;
}
