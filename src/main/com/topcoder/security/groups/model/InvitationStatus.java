/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.model;

/**
 * <p>
 * This enum represents the status of an invitation
 * </p>
 * 
 * @author leo_lol
 * @version 1.0 (Topcoder Security Groups Backend Model and Authorization Assembly v1.0 )
 * @since 1.0
 */
public enum InvitationStatus {
    /**
     * <p>
     * Represents the pending invitation status
     * </p>
     */
    PENDING,

    /**
     * <p>
     * Represents the status of an invitation being rejected.
     * </p>
     */
    REJECTED,

    /**
     * <p>
     * Represents the status of an invitation pending approval.
     * </p>
     */
    APPROVAL_PENDING,

    /**
     * <p>
     * Represents the status of an invitation approval being granted
     * </p>
     */
    APPROVAL_ACCEPTED,

    /**
     * <p>
     * Represents the status of an invitation approval being rejected
     * </p>
     */
    APPROVAL_REJECTED;
}
