/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.security;

import com.topcoder.shared.security.Resource;
import com.topcoder.web.tc.Constants;

/**
 * <p>
 * This is resource that is used in security permission checking for the new processor RealtimeData.
 * </p>
 * @author sokol
 * @version 1.0
 */
public class RealtimeDataResource implements Resource {

    /**
     * Represents name of resource to check security permission on.
     */
    private String name = null;

    /**
     * Creates an instance of RealtimeDataResource.
     * @param name the name of command to perform
     * @param dataSource the data source
     */
    public RealtimeDataResource(String name, int dataSource) {
        this.name =
                new StringBuilder().append("RealtimeDataDump:").append(name).append(" ").append(Constants.DATASOURCE_ID)
                        .append(": ").append(dataSource).toString();
    }

    /**
     * Retrieves name of resource to check security permission on.
     * @return name of resource to check security permission on
     */
    public String getName() {
        return this.name;
    }
}
