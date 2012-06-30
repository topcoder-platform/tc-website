/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.model;

/**
 * <p>
 * This enum represents the types of group permissions.
 * </p>
 * 
 * @author leo_lol
 * @version 1.0 (Topcoder Security Groups Backend Model and Authorization Assembly v1.0 )
 * @since 1.0
 */
public enum GroupPermissionType {
    /**
     * <p>
     * Represents the group permission to read.
     * </p>
     */
    READ,

    /**
     * <p>
     * Represents the group permission to write.
     * </p>
     */
    WRITE,

    /**
     * <p>
     * Represents the group permission to read and write.
     * </p>
     */
    FULL;
}
