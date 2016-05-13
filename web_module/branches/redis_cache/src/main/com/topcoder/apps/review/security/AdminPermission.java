/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.security;

import com.topcoder.security.policy.TCPermission;

/**
 * This class implements the admin permission for the security manager.
 *
 * @author adic
 * @version 1.0
 */
public class AdminPermission extends TCPermission {

    /**
     * Constructor.
     */
    public AdminPermission() {
        super(AdminPermission.class.getName());
    }

}

