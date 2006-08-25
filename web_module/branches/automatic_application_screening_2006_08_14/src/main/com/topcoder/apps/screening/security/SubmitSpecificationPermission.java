/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.screening.security;

import com.topcoder.security.policy.TCPermission;

/**
 * This class implements the submit permission for the security manager.
 *
 * @author pulky
 * @version 1.0
 */
public class SubmitSpecificationPermission extends TCPermission {
    /**
     * Constructor.
     *
     * @param projectId the ID of the project
     */
    public SubmitSpecificationPermission() {
        super(SubmitSpecificationPermission.class.getName());
    }
}

