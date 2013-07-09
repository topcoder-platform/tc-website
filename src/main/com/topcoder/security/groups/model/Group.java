/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.model;

import java.util.Date;
import java.util.List;

/**
 * <p>
 * This class represents a group.
 * </p>
 * <p>
 * <strong>Thread Safety:</strong> This class is mutable and not thread safe .
 * </p>
 *
 * <p>
 * Version 1.1 (TopCoder Security Groups Release 8 - Automatically Grant Permissions) change notes:
 * <ol>
 *     <li>Remove {@link #restrictions} field.</li>
 *     <li>Added {@link #autoGrant} field and its getter/setter.</li>
 * </ol>
 * </p>
 *
 * @author leo_lol, freegod
 * @version 1.1 (TopCoder Security Groups Release 8 - Automatically Grant Permissions)
 * @since 1.0
 */
public class Group extends IdentifiableEntity {

    /**
     * <p>
     * Represents the name of the group. It is managed with a getter and setter,
     * thus fully mutable. It may have any value.
     * </p>
     */
    private String name;

    /**
     * <p>
     * Represents the client of the group. It is managed with a getter and
     * setter, thus fully mutable. It may have any value.
     * </p>
     */
    private Client client;

    /**
     * <p>
     * Represents the default permission assigned to new members. It is managed
     * with a getter and setter, thus fully mutable. It may have any value.
     * </p>
     */
    private GroupPermissionType defaultPermission;

    /**
     * <p>
     * Represents the billing accounts assigned to this group It is managed with
     * a getter and setter, thus fully mutable. It may have any value.
     * </p>
     */
    private List<BillingAccount> billingAccounts;

    /**
     * <p>
     * Represents the direct projects that this group has access to. It is
     * managed with a getter and setter, thus fully mutable. It may have any
     * value.
     * </p>
     */
    private List<DirectProject> directProjects;

    /**
     * <p>
     * Represents the users that are members of this group It is managed with a
     * getter and setter, thus fully mutable. It may have any value.
     * </p>
     */
    private List<GroupMember> groupMembers;

    /**
     * This field represents whether this group should be granted permissions automatically.
     *
     * @since 1.1
     */
    private boolean autoGrant;

    /**
     * <p>
     * Represents the flag whether this group instance has been archived It is
     * managed with a getter and setter, thus fully mutable. It may have any
     * value.
     * </p>
     */
    private boolean archived;

    /**
     * <p>
     * Represents the date this group version has been archived It is managed
     * with a getter and setter, thus fully mutable. It may have any value.
     * </p>
     */
    private Date archivedOn;

    /**
     * <p>
     * Represents the group version that has superseded this group version. It
     * is managed with a getter and setter, thus fully mutable. It may have any
     * value.
     * </p>
     */
    private Group effectiveGroup;

    /**
     * <p>
     * Default constructor.
     * </p>
     */
    public Group() {
    }

    /**
     * <p>
     * Getter of the name field.
     * </p>
     * 
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * <p>
     * Setter of the name field.
     * </p>
     * 
     * @param name
     *            the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * <p>
     * Getter of the client field.
     * </p>
     * 
     * @return the client
     */
    public Client getClient() {
        return client;
    }

    /**
     * <p>
     * Setter of the client field.
     * </p>
     * 
     * @param client
     *            the client to set
     */
    public void setClient(Client client) {
        this.client = client;
    }

    /**
     * <p>
     * Getter of the defaultPermission field.
     * </p>
     * 
     * @return the defaultPermission
     */
    public GroupPermissionType getDefaultPermission() {
        return defaultPermission;
    }

    /**
     * <p>
     * Setter of the defaultPermission field.
     * </p>
     * 
     * @param defaultPermission
     *            the defaultPermission to set
     */
    public void setDefaultPermission(GroupPermissionType defaultPermission) {
        this.defaultPermission = defaultPermission;
    }

    /**
     * <p>
     * Getter of the billingAccounts field.
     * </p>
     * 
     * @return the billingAccounts
     */
    public List<BillingAccount> getBillingAccounts() {
        return billingAccounts;
    }

    /**
     * <p>
     * Setter of the billingAccounts field.
     * </p>
     * 
     * @param billingAccounts
     *            the billingAccounts to set
     */
    public void setBillingAccounts(List<BillingAccount> billingAccounts) {
        this.billingAccounts = billingAccounts;
    }

    /**
     * <p>
     * Getter of the directProjects field.
     * </p>
     * 
     * @return the directProjects
     */
    public List<DirectProject> getDirectProjects() {
        return directProjects;
    }

    /**
     * <p>
     * Setter of the directProjects field.
     * </p>
     * 
     * @param directProjects
     *            the directProjects to set
     */
    public void setDirectProjects(List<DirectProject> directProjects) {
        this.directProjects = directProjects;
    }

    /**
     * <p>
     * Getter of the groupMembers field.
     * </p>
     * 
     * @return the groupMembers
     */
    public List<GroupMember> getGroupMembers() {
        return groupMembers;
    }

    /**
     * <p>
     * Setter of the groupMembers field.
     * </p>
     * 
     * @param groupMembers
     *            the groupMembers to set
     */
    public void setGroupMembers(List<GroupMember> groupMembers) {
        this.groupMembers = groupMembers;
    }

    /**
     * <p>
     * Getter of the archived field.
     * </p>
     * 
     * @return the archived
     */
    public boolean getArchived() {
        return archived;
    }

    /**
     * <p>
     * Setter of the archived field.
     * </p>
     * 
     * @param archived
     *            the archived to set
     */
    public void setArchived(boolean archived) {
        this.archived = archived;
    }

    /**
     * <p>
     * Getter of the archivedOn field.
     * </p>
     * 
     * @return the archivedOn
     */
    public Date getArchivedOn() {
        return archivedOn;
    }

    /**
     * <p>
     * Setter of the archivedOn field.
     * </p>
     * 
     * @param archivedOn
     *            the archivedOn to set
     */
    public void setArchivedOn(Date archivedOn) {
        this.archivedOn = archivedOn;
    }

    /**
     * <p>
     * Getter of the effectiveGroup field.
     * </p>
     * 
     * @return the effectiveGroup
     */
    public Group getEffectiveGroup() {
        return effectiveGroup;
    }

    /**
     * <p>
     * Setter of the effectiveGroup field.
     * </p>
     * 
     * @param effectiveGroup
     *            the effectiveGroup to set
     */
    public void setEffectiveGroup(Group effectiveGroup) {
        this.effectiveGroup = effectiveGroup;
    }

    /**
     * Is auto grant.
     *
     * @return the boolean
     *
     * @since 1.1
     */
    public boolean getAutoGrant() {
        return autoGrant;
    }

    /**
     * Sets auto grant.
     *
     * @param autoGrant the auto grant
     *
     * @since 1.1
     */
    public void setAutoGrant(boolean autoGrant) {
        this.autoGrant = autoGrant;
    }
}
