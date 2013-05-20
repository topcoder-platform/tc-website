/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import com.topcoder.web.common.TCWebException;

/**
 * <p>A checked exception to be raised to indicate that no <code>Studio</code> member profile matching the specified
 * handle could be found.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Member Profile Assembly
 */
public class MemberNotFoundException extends TCWebException {

    /**
     * <p>A <code>String</code> providing the handle which have been requested to find the matching profile for.</p>
     */
    private String handle = null;

    /**
     * <p>Constructs new <code>MemberNotFoundException</code> instance to be raised when no profile matching the
     * specified handle is found.</p>
     *
     * @param handle a <code>String</code> providing the handle which have been requested to find the matching profile
     *               for.
     */
    public MemberNotFoundException(String handle) {
        this.handle = handle;
    }

    /**
     * <p>Gets the handle requested to find matching profile for and which happened not to have such a matching profile.
     * </p>
     *
     * @return a <code>String</code> providing the handle which have been requested to find the matching profile for.
     */
    public String getHandle() {
        return this.handle;
    }
}
