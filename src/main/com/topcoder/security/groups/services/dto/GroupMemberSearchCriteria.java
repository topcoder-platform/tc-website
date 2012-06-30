/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services.dto;

import java.util.Date;
import java.util.List;

import com.topcoder.security.groups.model.GroupPermissionType;

/**
 * <p>
 * This class represents a filter object for searching for group members. All
 * criteria will be ANDed, except where specified.
 * </p>
 * <p>
 * <strong>Thread Safety:</strong> This class is mutable and not thread safe
 * </p>
 * 
 * @author TCSASSEMBLER
 * @version 1.0 (Topcoder Security Groups Backend Model and Authorization
 *          Assembly v1.0 )
 * @since 1.0
 */
public class GroupMemberSearchCriteria {
    
    /**
     * <p>
     * Represents the ID of the user. It is managed with a getter and setter,
     * hence fully mutable. It may have any value.
     * </p>
     */
    private Long userId;
    
    /**
     * <p>
     * Represents the name of the group It is managed with a getter and setter,
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
     * Represents the name of the billing account It is managed with a getter
     * and setter, hence fully mutable. It may have any value.
     * </p>
     */
    private String billingAccountName;

    /**
     * <p>
     * Represents the handle of the member It is managed with a getter and
     * setter, hence fully mutable. It may have any value.
     * </p>
     */
    private String memberHandle;

    /**
     * <p>
     * Represents the list of permissions that are available. Within this group,
     * these are ORed It is managed with a getter and setter, hence fully
     * mutable. It may have any value.
     * </p>
     */
    private List<GroupPermissionType> permissions;

    /**
     * <p>
     * Represents the start date when the member was active. This is combined
     * with hadAccessTill to form a date range It is managed with a getter and
     * setter, hence fully mutable. It may have any value.
     * </p>
     */
    private Date hadAccessFrom;

    /**
     * <p>
     * Represents the end date when the member was active. This is combined with
     * hadAccessFroml to form a date range It is managed with a getter and
     * setter, hence fully mutable. It may have any value.
     * </p>
     */
    private Date hadAccessTill;

    /**
     * <p>
     * Default Constructor.
     * </p>
     */
    public GroupMemberSearchCriteria() {
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
     * <p>
     * Getter of memberHandle field.
     * </p>
     * @return the memberHandle
     */
    public String getMemberHandle() {
        return memberHandle;
    }

    /**
     * <p>
     * Setter of memberHandle field.
     * </p>
     * @param memberHandle the memberHandle to set
     */
    public void setMemberHandle(String memberHandle) {
        this.memberHandle = memberHandle;
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
     * Getter of hadAccessFrom field.
     * </p>
     * @return the hadAccessFrom
     */
    public Date getHadAccessFrom() {
        return hadAccessFrom;
    }

    /**
     * <p>
     * Setter of hadAccessFrom field.
     * </p>
     * @param hadAccessFrom the hadAccessFrom to set
     */
    public void setHadAccessFrom(Date hadAccessFrom) {
        this.hadAccessFrom = hadAccessFrom;
    }

    /**
     * <p>
     * Getter of hadAccessTill field.
     * </p>
     * @return the hadAccessTill
     */
    public Date getHadAccessTill() {
        return hadAccessTill;
    }

    /**
     * <p>
     * Setter of hadAccessTill field.
     * </p>
     * @param hadAccessTill the hadAccessTill to set
     */
    public void setHadAccessTill(Date hadAccessTill) {
        this.hadAccessTill = hadAccessTill;
    }
}
