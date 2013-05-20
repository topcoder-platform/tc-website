/*
 * Copyright (C) 2011-2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.model;

import java.util.Date;

/**
 * <p>
 * This class represents a invitation to a group
 * </p>
 * <p>
 * <strong>Thread Safety:</strong> This class is mutable and not thread safe.
 * </p>
 * 
 * <p>
 * Version 1.1 (Release Assembly - TopCoder Security Groups Frontend - Invitations Approvals) change notes:
 * <ol>
 *   <li>Added field {@link #rejectReason} and its getter/setter.</li>
 * </ol>
 * </p>
 *
 * @author leo_lol, TCSASSEMBLER
 * @version 1.1 (Release Assembly - TopCoder Security Groups Frontend - Invitations Approvals)
 * @since 1.0
 */
public class GroupInvitation extends IdentifiableEntity {

    /**
     * <p>
     * Represents the group member to whom the invitation is sent. It is managed
     * with a getter and setter, hence fully mutable. It may have any value.
     * </p>
     */
    private GroupMember groupMember;

    /**
     * <p>
     * Represents the status of the invitation It is managed with a getter and
     * setter, hence fully mutable. It may have any value.
     * </p>
     */
    private InvitationStatus status;

    /**
     * <p>
     * Represents the date the invitation was sent It is managed with a getter
     * and setter, hence fully mutable. It may have any value.
     * </p>
     */
    private Date sentOn;

    /**
     * <p>
     * Represents the date the invitation was answered (accepted or rejected) It
     * is managed with a getter and setter, hence fully mutable. It may have any
     * value.
     * </p>
     */
    private Date acceptedOrRejectedOn;

    /**
     * <p>
     * Represents the date the approval of the invitation was decided on It is
     * managed with a getter and setter, hence fully mutable. It may have any
     * value.
     * </p>
     */
    private Date approvalProcessedOn;


    /**
     * <p>
     * The reject reason.
     * </p>
     * 
     * @since 1.1
     */
    private String rejectReason;

    /**
     * <p>
     * Default constructor.
     * </p>
     */
    public GroupInvitation() {
    }

    /**
     * <p>
     * Getter of the groupMember field.
     * </p>
     * 
     * @return the groupMember
     */
    public GroupMember getGroupMember() {
        return groupMember;
    }

    /**
     * <p>
     * Setter of the groupMember field.
     * </p>
     * 
     * @param groupMember
     *            the groupMember to set
     */
    public void setGroupMember(GroupMember groupMember) {
        this.groupMember = groupMember;
    }

    /**
     * <p>
     * Getter of the status field.
     * </p>
     * 
     * @return the status
     */
    public InvitationStatus getStatus() {
        return status;
    }

    /**
     * <p>
     * Setter of the status field.
     * </p>
     * 
     * @param status
     *            the status to set
     */
    public void setStatus(InvitationStatus status) {
        this.status = status;
    }

    /**
     * <p>
     * Getter of the sentOn field.
     * </p>
     * 
     * @return the sentOn
     */
    public Date getSentOn() {
        return sentOn;
    }

    /**
     * <p>
     * Setter of the sentOn field.
     * </p>
     * 
     * @param sentOn
     *            the sentOn to set
     */
    public void setSentOn(Date sentOn) {
        this.sentOn = sentOn;
    }

    /**
     * <p>
     * Getter of the acceptedOrRejectedOn field.
     * </p>
     * 
     * @return the acceptedOrRejectedOn
     */
    public Date getAcceptedOrRejectedOn() {
        return acceptedOrRejectedOn;
    }

    /**
     * <p>
     * Setter of the acceptedOrRejectedOn field.
     * </p>
     * 
     * @param acceptedOrRejectedOn
     *            the acceptedOrRejectedOn to set
     */
    public void setAcceptedOrRejectedOn(Date acceptedOrRejectedOn) {
        this.acceptedOrRejectedOn = acceptedOrRejectedOn;
    }

    /**
     * <p>
     * Getter of the approvalProcessedOn field.
     * </p>
     * 
     * @return the approvalProcessedOn
     */
    public Date getApprovalProcessedOn() {
        return approvalProcessedOn;
    }

    /**
     * <p>
     * Setter of the approvalProcessedOn field.
     * </p>
     * 
     * @param approvalProcessedOn
     *            the approvalProcessedOn to set
     */
    public void setApprovalProcessedOn(Date approvalProcessedOn) {
        this.approvalProcessedOn = approvalProcessedOn;
    }

    /**
     * Sets the reject reason.
     *
     * @param rejectReason the reject reason to set
     * @since 1.1
     */
    public void setRejectReason(String rejectReason) {
        this.rejectReason = rejectReason;
    }

    /**
     * Gets the reject reason.
     *
     * @return the reject reason
     * @since 1.1
     */
    public String getRejectReason() {
        return rejectReason;
    }

}
