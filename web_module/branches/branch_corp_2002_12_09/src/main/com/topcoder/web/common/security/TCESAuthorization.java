package com.topcoder.web.common.security;

import com.topcoder.security.TCSubject;
import com.topcoder.shared.security.Authorization;
import com.topcoder.shared.security.Resource;

/**
 * This will be using the TopCoder Software security component to determine if a
 * particular user has access to a particular resource.  This can be done using
 * com.topcoder.security.policy and passing it the TCSubject associated with
 * this object and a TCPermission object that can be created using the Resource
 * object passed in to the hasPermission() method.
 * 
 * @author Greg Paul
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public class TCESAuthorization implements Authorization {

    /**
     * Creates Authorization token for given user.
     * 
     * @param user
     */    
    public TCESAuthorization(TCSubject user) {
    }
    
    /**
     * There will be TCESAuthorization token for every user, so this method will
     * return true if user to which this Authorization belongs to, has
     * permission to given resource.
     * 
     * @see com.topcoder.shared.security.Authorization#hasPermission(com.topcoder.shared.security.Resource)
     */
    public boolean hasPermission(Resource r) {
        return false;
    }
}
