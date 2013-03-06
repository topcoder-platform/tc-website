/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services;

import com.topcoder.security.groups.model.GroupInvitation;
import com.topcoder.security.groups.services.dto.InvitationSearchCriteria;
import com.topcoder.security.groups.services.dto.PagedResult;



/**
 * <p>
 * This interface defines the contract for the creation and management of invitations
 * </p>
 * 
 * <p>
 * Thread Safety:Implementations are expected to be effectively thread-safe
 * </p>
 * 
 * <p>
 * Version 1.1 (TopCoder Security Groups Release 6) change notes:
 * <ol>
 * 	<li>Updated {@link #sendInvitation(GroupInvitation, String, String, String, String, String)} method 
 * 		to add inviter name and edit notification url.</li>
 * </ol>
 * </p>
 * 
 * @author backstretlili, freegod
 * 
 * @version 1.1 (TopCoder Security Groups Release 6)
 * @since 1.0
 */
public interface GroupInvitationService {
    /**
     * This method creates a new invitation record, and returns its ID.
     * 
     * @param invitation
     *            the Invitation to create
     * @return the ID of the created Invitation
     * @throws IllegalArgumentException
     *             If invitation is null
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     * 
     */
    public long addInvitation(GroupInvitation invitation) throws IllegalArgumentException, SecurityGroupException;

    /**
     * This method updates an existing group invitation
     * 
     * @param invitation
     *            the GroupInvitation to update
     * 
     * @throws IllegalArgumentException
     *             If invitation is null
     * @throws EntityNotFoundException
     *             If the invitation with the given ID was not found
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     * 
     */
    public void updateInvitation(GroupInvitation invitation) throws IllegalArgumentException, EntityNotFoundException,
                    SecurityGroupException;

    /**
     * This method gets an existing group invitation
     * 
     * @param invitationId
     *            the GroupInvitation id
     * @return the GroupInvitation,null if not found
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     * 
     */
    public GroupInvitation getInvitation(long invitationId) throws SecurityGroupException;

    /**
     * This method retrieves the list of GroupInvitations for the given search criteria and paging requirements. The
     * result will not be null, and the inner list will also never be null.
     * 
     * @param criteria
     *            the filter with the search criteria: if null, assume no filtering
     * @param clientId
     *            the id of the group's client
     * @param page
     *            the 1-based number of the page to return. If 0, then all pages are returned
     * @param pageSize
     *            the size of the page to return. Will be a positive number, but ignored if page=0
     * @return A result object with the list of applicable invitations and the page and total data
     * @throws IllegalArgumentException
     *             If page < 0 or If pageSize < 1 unless page = 0
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     * 
     */
    public PagedResult<GroupInvitation> search(InvitationSearchCriteria criteria, long clientId, int pageSize, int page)
                    throws IllegalArgumentException, SecurityGroupException;

    /**
     * This method sends the given invitation, and provides the URLS to use for registering, accepting, or rejecting the
     * invitation.
     * 
     * @param invitation
     *            the GroupInvitation with the invitation data
     * @param registrationUrl
     *            the URL for the invitee to use to register before deciding on the invitation (if they are not a member
     *            yet)
     * @param acceptanceUrl
     *            the URL for the invitee to use to accept the invitation
     * @param rejectionUrl
     *            the URL for the invitee to use to reject the invitation
     * @param inviterName
     *            the inviter's name
     * @throws IllegalArgumentException
     *             If invitation is null, and any of the URL parameters is null/empty
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     * 
     */
    public void sendInvitation(GroupInvitation invitation, String registrationUrl, String acceptanceUrl,
                    String rejectionUrl, String inviterName) 
                    		throws IllegalArgumentException, SecurityGroupException;
    
    /**
     * This method will get the invitation by the user id and group id.
     * 
     * @param groupId the group id
     * @param userId the user id
     * @return the retrieved group invitation
     * @throws SecurityGroupException if any error occrus
     */
    public GroupInvitation getInvitation(long groupId, long userId) throws SecurityGroupException;
}
