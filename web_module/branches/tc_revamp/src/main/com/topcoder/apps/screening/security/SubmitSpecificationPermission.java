/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.apps.screening.security;

import com.topcoder.security.policy.TCPermission;

/**
 * This class implements the Application specification submit permission for the security manager.
 *
 * @author pulky
 * @version 1.0.0
 */
public class SubmitSpecificationPermission extends TCPermission {
    /**
     * Constructor.
     */
    public SubmitSpecificationPermission() {
        super(SubmitSpecificationPermission.class.getName());
    }
}

