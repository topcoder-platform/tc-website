package com.topcoder.shared.security;

/**
 *
 * @author Fred Wang (fred@fredwang.com)
 * @version $Revision$ 
 * Jan 7, 2003 11:54:00 PM
 */
public class AuthorizationStub implements Authorization {

    /**
     *
     * @param r
     * @return boolean flag stub set to false
     */
    public boolean hasPermission(Resource r) {
        return false;
    }
}
