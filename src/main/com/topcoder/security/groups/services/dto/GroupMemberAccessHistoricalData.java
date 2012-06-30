/*
 * Copyright (C) 2011-2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services.dto;

import java.util.Date;
import java.util.List;

import com.topcoder.security.groups.model.BillingAccount;
import com.topcoder.security.groups.model.GroupPermissionType;
import com.topcoder.security.groups.model.ResourceType;


/**
 * <p>
 * This class represents a record of access by a single group member.
 * </p>
 * <p>
 * <strong>Thread Safety:</strong> This class is mutable and not thread safe
 * </p>
 * 
 * <p>
 * Version 1.1 (Release Assembly - TopCoder Security Groups Frontend - Miscellaneous) change notes:
 * <ol>
 *   <li>Added {@link #memberUserId} and its getter/setter.</li>
 * </ol>
 * </p>
 * 
 * @author TCSASSEMBLER
 * @version 1.1
 * @since 1.0
 */
public class GroupMemberAccessHistoricalData {
    /**
     * <p>
     * Represents the ID of the group It is managed with a getter and setter,
     * hence fully mutable. It may have any value.
     * </p>
     */
    private long groupId;

    /**
     * <p>
     * Represents the specific permission of the group It is managed with a
     * getter and setter, hence fully mutable. It may have any value.
     * </p>
     */
    private GroupPermissionType permission;

    /**
     * <p>
     * Represents the billing accounts accessible to the group It is managed
     * with a getter and setter, hence fully mutable. It may have any value.
     * </p>
     */
    private List<BillingAccount> billingAccounts;

    /**
     * <p>
     * Represents the direct projects accessible to the group It is managed with
     * a getter and setter, hence fully mutable. It may have any value.
     * </p>
     */
    private List<Long> directProjectIds;

    /**
     * <p>
     * Represents the restrictions on the group It is managed with a getter and
     * setter, hence fully mutable. It may have any value.
     * </p>
     */
    private List<ResourceType> restrictions;

    /**
     * <p>
     * Represents the date the member became active It is managed with a getter
     * and setter, hence fully mutable. It may have any value.
     * </p>
     */
    private Date from;

    /**
     * <p>
     * Represents the date the member became inactive It is managed with a
     * getter and setter, hence fully mutable. It may have any value.
     * </p>
     */
    private Date to;
    
    /**
     * <p>
     * Represents the group member user id. It is managed with a
     * getter and setter, hence fully mutable. It may have any value.
     * </p>
     * 
     * @since 1.1
     */
    private long memberUserId;

    /**
     * <p>
     * Default constructor.
     * </p>
     */
    public GroupMemberAccessHistoricalData() {
    }

    /**
     * <p>
     * Getter of groupId field.
     * </p>
     * @return the groupId
     */
    public long getGroupId() {
        return groupId;
    }

    /**
     * <p>
     * Setter of groupId field.
     * </p>
     * @param groupId the groupId to set
     */
    public void setGroupId(long groupId) {
        this.groupId = groupId;
    }

    /**
     * <p>
     * Getter of permissions field.
     * </p>
     * @return the permissions
     */
    public GroupPermissionType getPermission() {
        return permission;
    }

    /**
     * <p>
     * Setter of permissions field.
     * </p>
     * @param permissions the permissions to set
     */
    public void setPermission(GroupPermissionType permission) {
        this.permission = permission;
    }

    /**
     * <p>
     * Getter of billingAccounts field.
     * </p>
     * @return the billingAccounts
     */
    public List<BillingAccount> getBillingAccounts() {
        return billingAccounts;
    }

    /**
     * <p>
     * Setter of billingAccounts field.
     * </p>
     * @param billingAccounts the billingAccounts to set
     */
    public void setBillingAccounts(List<BillingAccount> billingAccounts) {
        this.billingAccounts = billingAccounts;
    }

    /**
     * <p>
     * Getter of directProjectIds field.
     * </p>
     * @return the directProjectIds
     */
    public List<Long> getDirectProjectIds() {
        return directProjectIds;
    }

    /**
     * <p>
     * Setter of directProjectIds field.
     * </p>
     * @param directProjectIds the directProjectIds to set
     */
    public void setDirectProjectIds(List<Long> directProjectIds) {
        this.directProjectIds = directProjectIds;
    }

    /**
     * <p>
     * Getter of restrictions field.
     * </p>
     * @return the restrictions
     */
    public List<ResourceType> getRestrictions() {
        return restrictions;
    }

    /**
     * <p>
     * Setter of restrictions field.
     * </p>
     * @param restrictions the restrictions to set
     */
    public void setRestrictions(List<ResourceType> restrictions) {
        this.restrictions = restrictions;
    }

    /**
     * <p>
     * Getter of from field.
     * </p>
     * @return the from
     */
    public Date getFrom() {
        return from;
    }

    /**
     * <p>
     * Setter of from field.
     * </p>
     * @param from the from to set
     */
    public void setFrom(Date from) {
        this.from = from;
    }

    /**
     * <p>
     * Getter of to field.
     * </p>
     * @return the to
     */
    public Date getTo() {
        return to;
    }

    /**
     * <p>
     * Setter of to field.
     * </p>
     * @param to the to to set
     */
    public void setTo(Date to) {
        this.to = to;
    }

    /**
     * Gets the group member user id.
     * 
     * @return the member user id
     * @since 1.1
     */
    public long getMemberUserId() {
        return memberUserId;
    }

    /**
     * Sets the group member user id.
     * 
     * @param memberUserId the member user id to set
     * @since 1.1
     */
    public void setMemberUserId(long memberUserId) {
        this.memberUserId = memberUserId;
    }
}
