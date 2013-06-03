/*
 * SecurityEnabledUser.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.projecttracker;

import com.topcoder.security.TCSubject;
import com.topcoder.security.policy.PermissionCollection;

import java.io.Serializable;

/**
 * This class represents a user who has logged into the system.
 * It has the TCSubject and permissions for the user.
 *
 * @author FatClimber
 * @version 1.0
 */
public class SecurityEnabledUser extends User implements Serializable {
    private PermissionCollection permissionCollection;
    private TCSubject tcSubject;

    /**
     * @param id
     * @param handle
     * @param firstName
     * @param lastName
     * @param email
     */
    public SecurityEnabledUser(long id, String handle, String firstName, String lastName,
                               String email, PermissionCollection perm, TCSubject tcSubject) {
        super(id, handle, firstName, lastName, email);
        this.permissionCollection = perm;
        this.tcSubject = tcSubject;
    }

    /**
     * <p>
     * Return the permissions for this user.
     * </p>
     *
     * @return PermissionCollection - the permissions for this user.
     */
    public PermissionCollection getPermissions() {
        return permissionCollection;
    }

    /**
     * <p>
     * Return the TCSubject for this user.
     * </p>
     *
     * @return The TCSubject for this user.
     */
    public TCSubject getTCSubject() {
        return tcSubject;
    }
} // end SecurityEnabledUser

