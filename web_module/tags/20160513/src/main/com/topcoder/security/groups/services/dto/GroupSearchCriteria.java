/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services.dto;

import java.util.List;

import com.topcoder.security.groups.model.GroupPermissionType;

/**
 * <p>
 * This class represents a filter object for searching for groups. All criteria
 * will be ANDed, except where specified.
 * </p>
 * <p>
 * <strong>Thread Safety:</strong> This class is mutable and not thread safe
 * </p>
 *
 * <p>
 * Version 1.1 (Release Assembly - TopCoder Security Groups Release 8 - Automatically Grant Permissions) changes:
 * <ol>
 *      <li>Added {@link #clientId} field.</li>
 * </ol>
 * </p>
 *
 * @author TCSASSEMBLER, freegod
 * @version 1.1 (Release Assembly - TopCoder Security Groups Release 8 - Automatically Grant Permissions )
 * @since 1.0
 */
public class GroupSearchCriteria {
    
    /**
     * <p>
     * Represents the ID of the user. It is managed with a getter and setter,
     * hence fully mutable. It may have any value.
     * </p>
     */    
    private Long userId;
    
    /**
     * <p>
     * Represents the name of the group. It is managed with a getter and setter,
     * hence fully mutable. It may have any value.
     * </p>
     */
    private String groupName;

    /**
     * <p>
     * Represents the name of the client It is managed with a getter and setter,
     * hence fully mutable. It may have any value.
     * </p>
     */
    private String clientName;

    /**
     * <p>
     * Represents the name of the project It is managed with a getter and
     * setter, hence fully mutable. It may have any value.
     * </p>
     */
    private String projectName;

    /**
     * <p>
     * Represents the permissions to access a group It is managed with a getter
     * and setter, hence fully mutable. It may have any value.
     * </p>
     */
    private List<GroupPermissionType> permissions;

    /**
     * <p>
     * Represents the handle of a group. It is managed with a getter and setter,
     * hence fully mutable. It may have any value.
     * </p>
     */
    private String groupMemberHandle;

    /**
     * <p>
     * Represents the name of the billing account It is managed with a getter
     * and setter, hence fully mutable. It may have any value.
     * </p>
     */
    private String billingAccountName;

    /**
     * <p>
     * Represents the client id of security group.
     * </p>
     *
     * @since 1.1
     */
    private Long clientId;

    /**
     * <p>
     * Default Constructor.
     * </p>
     */
    public GroupSearchCriteria() {
    }

    /**
     * <p>
     * Getter of userId field.
     * </p>
     * @return the userId
     */
    public Long getUserId() {
        return userId;
    }

    /**
     * <p>
     * Setter of userId field.
     * </p>
     * @param userId the userId to set
     */
    public void setUserId(Long userId) {
        this.userId = userId;
    }

    /**
     * <p>
     * Getter of groupName field.
     * </p>
     * @return the groupName
     */
    public String getGroupName() {
        return groupName;
    }

    /**
     * <p>
     * Setter of groupName field.
     * </p>
     * @param groupName the groupName to set
     */
    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    /**
     * <p>
     * Getter of clientName field.
     * </p>
     * @return the clientName
     */
    public String getClientName() {
        return clientName;
    }

    /**
     * <p>
     * Setter of clientName field.
     * </p>
     * @param clientName the clientName to set
     */
    public void setClientName(String clientName) {
        this.clientName = clientName;
    }

    /**
     * <p>
     * Getter of projectName field.
     * </p>
     * @return the projectName
     */
    public String getProjectName() {
        return projectName;
    }

    /**
     * <p>
     * Setter of projectName field.
     * </p>
     * @param projectName the projectName to set
     */
    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    /**
     * <p>
     * Getter of permissions field.
     * </p>
     * @return the permissions
     */
    public List<GroupPermissionType> getPermissions() {
        return permissions;
    }

    /**
     * <p>
     * Setter of permissions field.
     * </p>
     * @param permissions the permissions to set
     */
    public void setPermissions(List<GroupPermissionType> permissions) {
        this.permissions = permissions;
    }

    /**
     * <p>
     * Getter of groupMemberHandle field.
     * </p>
     * @return the groupMemberHandle
     */
    public String getGroupMemberHandle() {
        return groupMemberHandle;
    }

    /**
     * <p>
     * Setter of groupMemberHandle field.
     * </p>
     * @param groupMemberHandle the groupMemberHandle to set
     */
    public void setGroupMemberHandle(String groupMemberHandle) {
        this.groupMemberHandle = groupMemberHandle;
    }

    /**
     * <p>
     * Getter of billingAccountName field.
     * </p>
     * @return the billingAccountName
     */
    public String getBillingAccountName() {
        return billingAccountName;
    }

    /**
     * <p>
     * Setter of billingAccountName field.
     * </p>
     * @param billingAccountName the billingAccountName to set
     */
    public void setBillingAccountName(String billingAccountName) {
        this.billingAccountName = billingAccountName;
    }

    /**
     * Gets client id.
     *
     * @return the client id
     *
     * @since 1.1
     */
    public Long getClientId() {
        return clientId;
    }

    /**
     * Sets client id.
     *
     * @param clientId the client id
     *
     * @since 1.1
     */
    public void setClientId(Long clientId) {
        this.clientId = clientId;
    }
}
