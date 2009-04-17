package com.topcoder.web.ejb.security;

/**
 * Just a simple interface in the spirit of the EJB Business Methods Interface pattern that will contain all the methods
 * we want.  It'll be extended by the Local and Remote interfaces basically just so that we only have to modify
 * this interface in one place rather than both of those interfaces.
 *
 * @author dok
 * @version $Id$
 *          Create Date: Feb 21, 2008
 */
public interface Authentication {
    long login(String userName, String password) throws InvalidCredentialsException,
            InactiveEmailStatusException, UnactiveUserStatusException, InactiveUserStatusException;
}
