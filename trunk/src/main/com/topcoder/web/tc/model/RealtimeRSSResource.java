/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.model;

import com.topcoder.shared.security.Resource;
import com.topcoder.web.tc.Constants;

/**
 * <p>
 * This is resource that is used in security permission checking for the new processor BasicRSSWrapper.
 * </p>
 * @author sokol
 * @version 1.0
 */
public class RealtimeRSSResource implements Resource {

    /**
     * Represents name of resource to check security permission on.
     */
    private String name = null;

    /**
     * Creates an instance of RealtimeRSSResource.
     * @param name the name of command to perform
     * @param dataSource the data source
     */
    public RealtimeRSSResource(String name, int dataSource) {
        this.name =
                new StringBuilder().append("RealtimeRSS:").append(name).append(" ").append(Constants.DATASOURCE_ID)
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
