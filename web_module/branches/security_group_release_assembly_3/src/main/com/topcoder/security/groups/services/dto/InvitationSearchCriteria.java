/*
 * Copyright (C) 2011-2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services.dto;

import java.util.Date;
import java.util.List;
import com.topcoder.security.groups.model.GroupPermissionType;
import com.topcoder.security.groups.model.InvitationStatus;


/**
 * <p>
 * This class represents a filter object for searching for group invitations.
 * All criteria will be ANDed, except where specified.
 * </p>
 * <p>
 * <strong>Thread Safety:</strong> This class is mutable and not thread safe
 * </p>
 * 
 * <p>
 * Version 1.1 (Release Assembly - TopCoder Security Groups Frontend - Invitations Approvals) change notes:
 * <ol>
 *   <li>Added field {@link #inviteeHandle} and its getter/setter.</li>
 *   <li>Added field {@link #inviteeEmail} and its getter/setter.</li>
 * </ol>
 * </p>
 *
 * @author TCSASSEMBLER
 * @version 1.1 (Release Assembly - TopCoder Security Groups Frontend - Invitations Approvals)
 * @since 1.0
 */
public class InvitationSearchCriteria {
    
    
    /**
     * <p>
     * Represents the ID of the owned user. It is managed with a getter and setter,
     * hence fully mutable. It may have any value.
     * </p>
     */
    private Long ownedUserId;

    /**
     * <p>
     * Represents the ID of the master user. It is managed with a getter and setter,
     * hence fully mutable. It may have any value.
     * </p>
     */
    private Long masterUserId;
    
    /**
     * <p>
     * Represents the name of the group It is managed with a getter and setter,
     * hence fully mutable. It may have any value.
     * </p>
     */
    private String groupName;

    /**
     * <p>
     * Represents the list of applicable permissions. Within this group, these
     * are ORed It is managed with a getter and setter, hence fully mutable. It
     * may have any value.
     * </p>
     */
    private List<GroupPermissionType> permissions;

    /**
     * <p>
     * Represents the start date when the invitation was sent This is combined
     * with sentDateTo to form a date range It is managed with a getter and
     * setter, hence fully mutable. It may have any value.
     * </p>
     */
    private Date sentDateFrom;

    /**
     * <p>
     * Represents the end date when the invitation was sent This is combined
     * with sentDateFrom to form a date range It is managed with a getter and
     * setter, hence fully mutable. It may have any value.
     * </p>
     */
    private Date sentDateTo;

    /**
     * <p>
     * Represents the start date when the invitation was accepted This is
     * combined with acceptedDateTo to form a date range It is managed with a
     * getter and setter, hence fully mutable. It may have any value.
     * </p>
     */
    private Date acceptedDateFrom;

    /**
     * <p>
     * Represents the end date when the invitation was accepted This is combined
     * with acceptedDateFrom to form a date range It is managed with a getter
     * and setter, hence fully mutable. It may have any value.
     * </p>
     */
    private Date acceptedDateTo;

    /**
     * <p>
     * Represents the status of the invitation It is managed with a getter and
     * setter, hence fully mutable. It may have any value.
     * </p>
     */
    private InvitationStatus status;
    
    /**
     * The invitee handle.
     * 
     * @since 1.1
     */
    private String inviteeHandle;
    
    /**
     * The invitee email.
     * 
     * @since 1.1
     */
    private String inviteeEmail;

    /**
     * <p>
     * Default Constructor.
     * </p>
     */
    public InvitationSearchCriteria() {
    }

    /**
     * <p>
     * Getter of ownedUserId field.
     * </p>
     * @return the ownedUserId
     */
    public Long getOwnedUserId() {
        return ownedUserId;
    }

    /**
     * <p>
     * Setter of ownedUserId field.
     * </p>
     * @param ownedUserId the ownedUserId to set
     */
    public void setOwnedUserId(Long ownedUserId) {
        this.ownedUserId = ownedUserId;
    }
    
    /**
     * <p>
     * Getter of masterUserId field.
     * </p>
     * @return the masterUserId
     */
    public Long getMasterUserId() {
        return masterUserId;
    }

    /**
     * <p>
     * Setter of masterUserId field.
     * </p>
     * @param masterUserId the masterUserId to set
     */
    public void setMasterUserId(Long masterUserId) {
        this.masterUserId = masterUserId;
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
     * Getter of sentDateFrom field.
     * </p>
     * @return the sentDateFrom
     */
    public Date getSentDateFrom() {
        return sentDateFrom;
    }

    /**
     * <p>
     * Setter of sentDateFrom field.
     * </p>
     * @param sentDateFrom the sentDateFrom to set
     */
    public void setSentDateFrom(Date sentDateFrom) {
        this.sentDateFrom = sentDateFrom;
    }

    /**
     * <p>
     * Getter of sentDateTo field.
     * </p>
     * @return the sentDateTo
     */
    public Date getSentDateTo() {
        return sentDateTo;
    }

    /**
     * <p>
     * Setter of sentDateTo field.
     * </p>
     * @param sentDateTo the sentDateTo to set
     */
    public void setSentDateTo(Date sentDateTo) {
        this.sentDateTo = sentDateTo;
    }

    /**
     * <p>
     * Getter of acceptedDateFrom field.
     * </p>
     * @return the acceptedDateFrom
     */
    public Date getAcceptedDateFrom() {
        return acceptedDateFrom;
    }

    /**
     * <p>
     * Setter of acceptedDateFrom field.
     * </p>
     * @param acceptedDateFrom the acceptedDateFrom to set
     */
    public void setAcceptedDateFrom(Date acceptedDateFrom) {
        this.acceptedDateFrom = acceptedDateFrom;
    }

    /**
     * <p>
     * Getter of acceptedDateTo field.
     * </p>
     * @return the acceptedDateTo
     */
    public Date getAcceptedDateTo() {
        return acceptedDateTo;
    }

    /**
     * <p>
     * Setter of acceptedDateTo field.
     * </p>
     * @param acceptedDateTo the acceptedDateTo to set
     */
    public void setAcceptedDateTo(Date acceptedDateTo) {
        this.acceptedDateTo = acceptedDateTo;
    }

    /**
     * <p>
     * Getter of status field.
     * </p>
     * @return the status
     */
    public InvitationStatus getStatus() {
        return status;
    }

    /**
     * <p>
     * Setter of status field.
     * </p>
     * @param status the status to set
     */
    public void setStatus(InvitationStatus status) {
        this.status = status;
    }

    /**
     * Sets the invitee handle.
     * 
     * @param inviteeHandle the invitee handle to set
     * @since 1.1
     */
    public void setInviteeHandle(String inviteeHandle) {
        this.inviteeHandle = inviteeHandle;
    }

    /**
     * Gets the invitee handle.
     * 
     * @return the invitee handle
     * @since 1.1
     */
    public String getInviteeHandle() {
        return inviteeHandle;
    }

    /**
     * Sets the invitee email.
     * 
     * @param inviteeEmail the invitee email to set
     * @since 1.1
     */
    public void setInviteeEmail(String inviteeEmail) {
        this.inviteeEmail = inviteeEmail;
    }

    /**
     * Gets the invitee email.
     * 
     * @return the invitee email
     * @since 1.1
     */
    public String getInviteeEmail() {
        return inviteeEmail;
    }
}
