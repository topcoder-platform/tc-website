/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;

/**
 * Retrieval class used by the Model classes to return an user.
 *
 * @author adic
 * @version 1.0
 */
public class LoginResult extends SuccessResult {

    /**
     * The user.
     */
    private SecurityEnabledUser user = null;

    /**
     * Constructor.
     *
     * @param user the user
     */
    LoginResult(SecurityEnabledUser user) {
        this.user = user;
    }

    /**
     * Get the contained user.
     *
     * @return the contained user
     */
    public SecurityEnabledUser getUser() {
        return user;
    }

}

