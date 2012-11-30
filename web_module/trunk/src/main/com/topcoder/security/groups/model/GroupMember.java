/*
 * Copyright (C) 2011-2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.model;

import java.util.Date;

/**
 * <p>
 * This class represents a user that is a member of a specific group
 * </p>
 * <p>
 * <strong>Thread Safety:</strong> This class is mutable and not thread safe.
 * </p>
 * 
 * <p>
 * Version 1.1 (Release Assembly - TopCoder Security Groups Frontend - View Group Details) Change notes:
 * <ol>
 * <li>Added the field handle.</li>
 * </ol>
 * </p>
 * 
 * @author leo_lol, backstreetlili
 * @version 1.1 (Topcoder Security Groups Backend Model and Authorization Assembly v1.0 )
 * @since 1.0
 */
public class GroupMember extends IdentifiableEntity {
    /**
     * <p>
     * Represents the ID of the user. It is managed with a getter and setter,
     * hence fully mutable. It may have any value.
     * </p>
     */
    private long userId;

    /**
     * <p>
     * Represents the flag whether to use default group info It is managed with
     * a getter and setter, hence fully mutable. It may have any value.
     * </p>
     */
    private boolean useGroupDefault;

    /**
     * <p>
     * Represents the actual permission given to the user for access to the
     * group resources It is managed with a getter and setter, hence fully
     * mutable. It may have any value.
     * </p>
     */
    private GroupPermissionType specificPermission;

    /**
     * <p>
     * Represents the flag whether the user is active It is managed with a
     * getter and setter, hence fully mutable. It may have any value.
     * </p>
     */
    private boolean active;

    /**
     * <p>
     * Represents the date this user was activated It is managed with a getter
     * and setter, hence fully mutable. It may have any value.
     * </p>
     */
    private Date activatedOn;

    /**
     * <p>
     * Represents the date this user was unassigned from the group It is managed
     * with a getter and setter, hence fully mutable. It may have any value.
     * </p>
     */
    private Date unassignedOn;

    /**
     * <p>
     * Represents the group this user belongs to It is managed with a getter and
     * setter, hence fully mutable. It may have any value.
     * </p>
     */
    private Group group;

    /**
     * <p>
     * Represents the handle of the member. It is managed with a getter and setter, hence fully mutable. It may have any
     * value.
     * </p>
     */
    private String handle;

    /**
     * <p>
     * Default constructor.
     * </p>
     */
    public GroupMember() {
    }

    /**
     * <p>
     * Getter of the userId field.
     * </p>
     * @return the userId
     */
    public long getUserId() {
        return userId;
    }

    /**
     * <p>
     * Setter of the userId field.
     * </p>
     * @param userId the userId to set
     */
    public void setUserId(long userId) {
        this.userId = userId;
    }

    /**
     * <p>
     * Getter of the useGroupDefault field.
     * </p>
     * @return the useGroupDefault
     */
    public boolean isUseGroupDefault() {
        return useGroupDefault;
    }

    /**
     * <p>
     * Setter of the useGroupDefault field.
     * </p>
     * @param useGroupDefault the useGroupDefault to set
     */
    public void setUseGroupDefault(boolean useGroupDefault) {
        this.useGroupDefault = useGroupDefault;
    }

    /**
     * <p>
     * Getter of the specificPermission field.
     * </p>
     * @return the specificPermission
     */
    public GroupPermissionType getSpecificPermission() {
        return specificPermission;
    }

    /**
     * <p>
     * Setter of the specificPermission field.
     * </p>
     * @param specificPermission the specificPermission to set
     */
    public void setSpecificPermission(GroupPermissionType specificPermission) {
        this.specificPermission = specificPermission;
    }

    /**
     * <p>
     * Getter of the active field.
     * </p>
     * @return the active
     */
    public boolean getActive() {
        return active;
    }

    /**
     * <p>
     * Setter of the active field.
     * </p>
     * @param active the active to set
     */
    public void setActive(boolean active) {
        this.active = active;
    }

    /**
     * <p>
     * Getter of the activatedOn field.
     * </p>
     * @return the activatedOn
     */
    public Date getActivatedOn() {
        return activatedOn;
    }

    /**
     * <p>
     * Setter of the activatedOn field.
     * </p>
     * @param activatedOn the activatedOn to set
     */
    public void setActivatedOn(Date activatedOn) {
        this.activatedOn = activatedOn;
    }

    /**
     * <p>
     * Getter of the unassignedOn field.
     * </p>
     * @return the unassignedOn
     */
    public Date getUnassignedOn() {
        return unassignedOn;
    }

    /**
     * <p>
     * Setter of the unassignedOn field.
     * </p>
     * @param unassignedOn the unassignedOn to set
     */
    public void setUnassignedOn(Date unassignedOn) {
        this.unassignedOn = unassignedOn;
    }

    /**
     * <p>
     * Getter of the group field.
     * </p>
     * @return the group
     */
    public Group getGroup() {
        return group;
    }

    /**
     * <p>
     * Setter of the group field.
     * </p>
     * @param group the group to set
     */
    public void setGroup(Group group) {
        this.group = group;
    }

    /**
     * <p>
     * Getter of the handle field.
     * </p>
     * 
     * @return the handle
     */
    public String getHandle() {
        return handle;
    }

    /**
     * <p>
     * Setter of the handle field.
     * </p>
     * 
     * @param handle
     *            the handle to set
     */
    public void setHandle(String handle) {
        this.handle = handle;
    }
}
