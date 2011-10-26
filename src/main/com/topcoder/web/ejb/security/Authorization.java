package com.topcoder.web.ejb.security;

import com.topcoder.shared.security.Resource;

import java.rmi.RemoteException;

/**
 * Just a simple interface in the spirit of the EJB Business Methods Interface pattern that will contain all the methods
 * we want.  It'll be extended by the Local and Remote interfaces basically just so that we only have to modify
 * this interface in one place rather than both of those interfaces.
 *
 * @author dok
 * @version $Id: Authorization.java 69193 2008-03-14 19:43:35Z gpaul $
 *          Create Date: Feb 28, 2008
 */

public interface Authorization extends java.rmi.Remote {

    /**
     * Check if the user associated with the given userId has access to the given resource.
     * If the userId is invalid, we'll return quietly with false
     *
     * @param userId   the userId for the user
     * @param resource the resource we're checking for entitlment
     * @return true if the user has access, false otherwise
     */
    boolean hasPermission(long userId, Resource resource) throws RemoteException;

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
    boolean hasPermission(long userId, String resource) throws RemoteException;
}
