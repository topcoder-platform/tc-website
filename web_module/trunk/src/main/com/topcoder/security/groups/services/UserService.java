/*
 * Copyright (C) 2011-2014 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services;

import java.util.List;

import com.topcoder.security.groups.services.dto.InvitationSearchCriteria;
import com.topcoder.security.groups.services.dto.UserDTO;

/**
 * <p>
 * This interface defines the contract for the retrieval of users
 * </p>
 * <p>
 * Thread Safety:Implementations are expected to be effectively thread-safe
 * </p>
 * 
 * <p>
 * Version 1.1 (Release Assembly - TopCoder Security Groups Frontend - Invitations Approvals) change notes:
 * <ol>
 *   <li>Added method {@link #search(String, String)} to support search by handle and email.</li>
 * </ol>
 * </p>
 * 
 * <p>
 * Version 1.2 (48hr Cockpit Group Management Improvement Release Assembly) change notes:
 * <ol>
 *   <li>Added method {@link #getUsersByHandles(String[])} to support search by handles.</li>
 * </ol>
 * </p>
 *
 * @author suno1234, TCSASSEMBLER
 * @version 1.2
 */
public interface UserService {

    /**
     * Get a user by id,if not found return null
     * 
     * @param id
     *            the id of the user
     * @return the requested UserDTO
     * @throws SecurityGroupException
     *             if there are any errors during the execution of this method
     */
    public UserDTO get(long id) throws SecurityGroupException;

    /**
     * Retrieves the list of users with the given handle. If not found, returns
     * an empty list.
     * 
     * @param handle
     *            the handle of the desired user
     * @return the users with the given handle
     * @throws IllegalArgumentException
     *             If both handle and email is null/empty
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     */
    public List<UserDTO> search(String handle) throws IllegalArgumentException, SecurityGroupException;

    /**
     * Retrieves the list of users with the given handle and email. If not found, returns
     * an empty list.
     * 
     * @param handle
     *            the handle of the desired user
     * @param email
     *            the email of the desired user
     * @return the users with the given handle and email
     * @throws IllegalArgumentException
     *             If handle is null/empty
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     * @since 1.1
     */
    public List<UserDTO> search(String handle, String email) throws IllegalArgumentException, SecurityGroupException;
    
    /**
     * Retrieves the list of users with the given handles. If not found, returns
     * an empty list. Input handles shouldn't be empty
     * 
     * @param handles
     *            the handles of the desired users     
     * @return the users with the given handle
     * @throws IllegalArgumentException
     *             If handle is null/empty
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     * @since 1.2
     */
    public List<UserDTO> getUsersByHandles(String[] handles) throws IllegalArgumentException, SecurityGroupException;
}
