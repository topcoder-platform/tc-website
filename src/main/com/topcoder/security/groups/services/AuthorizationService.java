/*
 * Copyright (C) 2011-2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services;

import java.util.List;

import com.topcoder.security.groups.model.GroupPermissionType;
import com.topcoder.security.groups.model.ResourceType;

/**
 * <p>
 * This interface defines the contract for the authorization of users to have
 * access to resources, and to check if a user is an administrator of the
 * client.
 * </p>
 * <p>
 * <strong>Thread Safety:</strong> Implementations are expected to be
 * effectively thread-safe
 * </p>
 * 
 * <p>
 * Version 1.1 (Release Assembly - TopCoder Security Groups Frontend - Invitations Approvals) change notes:
 * <ol>
 *   <li>Added method {@link #checkApprovalPermission(long)} to check if user has approval permission.</li>
 * </ol>
 * </p>
 *
 * @author leo_lol, TCSASSEMBLER
 * @version 1.1
 */
public interface AuthorizationService {
    /**
     * <p>
     * This method checks what kind of permission the given user has to access
     * the given resource, and returns the type of permission associated with
     * the user and resource. If there is no permission, null is returned.
     * </p>
     * 
     * @param resourceId
     *            the ID of the resource
     * @param userId
     *            the ID of the user
     * @param resourceType
     *            the type of the resource
     * @return the permission level for this user for the given resource
     * @throws IllegalArgumentException
     *             If resourceType is null
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     */
    public GroupPermissionType checkAuthorization(long userId, long resourceId,
            ResourceType resourceType) throws IllegalArgumentException,
            SecurityGroupException;

    /**
     * <p>
     * This method checks if the given user is an administrator of the given
     * client.
     * </p>
     * 
     * @param userId
     *            the ID of the user
     * @param clientId
     *            the ID of the client
     * @return true if the users is an administrator of the client, and false
     *         otherwise.
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     */
    public boolean isCustomerAdministrator(long userId, long clientId)
            throws SecurityGroupException;    
    
    /**
     * <p>
     * Test if user is TC administrator.
     * </p>
     * @param userId
     * @return true if the corresponding user is TC Staff; false otherwise.
     */
    public boolean isAdministrator(long userId) throws SecurityGroupException;
    
    /**
     * <p>
     * This method returns a collection is group id, for which this user
     * has full permission.
     * </p>
     * @param userId
     * @return an List of Group IDs of whom the specified user has full permission.
     * @throws SecurityGroupException If anything wrong happens.
     */
    public List<Long> getGroupIdsOfFullPermissionsUser(long userId) throws SecurityGroupException;
        
    /**
     * <p>
     * Test if user has approval permission: either TC administrator, customer administrator,
     * or has full permission.
     * </p>
     * @param userId the user id
     * @return true if the user has approval permission; false otherwise.
     * @since 1.1
     */
    public boolean checkApprovalPermission(long userId) throws SecurityGroupException;
}
