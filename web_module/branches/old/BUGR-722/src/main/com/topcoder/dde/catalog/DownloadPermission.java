/*
 * DownloadPermission.java
 * 20 September 2002
 * 1.0
 *
 * Copyright (c) 2002, TopCoder, Inc.
 * All rights reserved.
 */


package com.topcoder.dde.catalog;

import com.topcoder.security.policy.TCPermission;


/**
 * A permission for downloading a component. Used internally by
 * ComponentManagerEJB.
 *
 * @version 1.0, 20 September 2002
 * @author  Albert Mao
 * @see     ComponentManager
 */
public class DownloadPermission extends TCPermission {


    /**
     * Constructs a new <code>DownloadPermission</code> object.
     *
     * @param componentId the primary key of the component
     */
    public DownloadPermission(long componentId) {
        super("com.topcoder.dde.catalog.DownloadPermission " + componentId);
    }


}