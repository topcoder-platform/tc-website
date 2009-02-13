/*
 * DownloadPermission.java
 * 20 September 2002
 * 1.0
 *
 * Copyright (c) 2002, TopCoder, Inc.
 * All rights reserved.
 */


package com.topcoder.dde.catalog;

import com.topcoder.apps.review.security.AdminPermission;
import com.topcoder.security.policy.TCPermission;


/**
 * A permission for downloading a component. Used internally by
 * ComponentManagerEJB.
 *
 * @version 1.0, 20 September 2002
 * @author  Pulky
 * @see     ComponentManager
 */
public class UnlimitedDownloadPermission extends TCPermission {

    /**
     * Constructs a new <code>UnlimitedDownloadPermission</code> object.
     */
    public UnlimitedDownloadPermission() {
        super(UnlimitedDownloadPermission.class.getName());
    }

    /**
     * Constructs a new <code>UnlimitedDownloadPermission</code> object.
     *
     * @param componentId the primary key of the component
     */
    public UnlimitedDownloadPermission(long componentId) {
        super(UnlimitedDownloadPermission.class.getName() + " " + componentId);
    }

}