package com.topcoder.shared.security;


/**
 * classes that implement Authorization will determine if a particular user has
 * access to a particular resource this could range from simple if "logged in
 * then yes otherwise no" systems to full security systems with
 * permissions, roles groups etc.
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Jan 7, 2003 11:40:10 PM
 *
 */

public interface Authorization {

    /**
     *
     * @param r
     * @return boolean flag indication if permission is set
     */
    public boolean hasPermission(Resource r) throws AuthorizationException;
}
