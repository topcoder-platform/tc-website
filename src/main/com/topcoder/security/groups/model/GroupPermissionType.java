/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.model;

/**
 * <p>
 * This enum represents the types of group permissions.
 * </p>
 *
 * <p>
 * Version 1.0 (Topcoder Security Groups Backend Model and Authorization Assembly v1.0 ) change notes:
 * <ol>
 *   <li>Added this enum<li>
 * </ol>
 * </p>
 *
 * <p>
 * Version 1.1 (https://apps.topcoder.com/bugs/browse/TCCC-4704) change notes:
 * <ol>
 *   <li>Added the REPORT permission<li>
 * </ol>
 * </p>
 * 
 * @author leo_lol, xjtufreeman
 * @version 1.1
 * @since 1.1
 */
public enum GroupPermissionType {
    /**
     * <p>
     * Represents the group permission to report.
     * </p>
     */
    REPORT,
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
