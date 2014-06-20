/*
 * Copyright (C) 2013-2014 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.services;

import com.topcoder.reg.dto.UserDTO;
import com.topcoder.web.common.model.User;

/**
 * This class defines a collection contracting methods for user operation.
 * <p>
 * <strong>Thread Safety:</strong> Implementation of this interface should be effectively thread-safe.
 * </p>
 * 
 * <p>
 * Change in v1.1 (Release Assembly - TopCoder Website Social Login)
 * <ol>
 * <li>Add a method to obtain password.</li>
 * <ol>
 * </p>
 *
 * <p>
 *     Version 1.2 (F2F Record User Last Login in Reg2 Callback) changes:
 *     <ul>
 *         <li>Add {@link #updateLastLogin(long)} to support update user login timestamp</li>
 *     </ul>
 * </p>
 *
 * @author leo_lol, ecnu_haozi, TCSASSEMBLER
 * @version 1.2
 * @since 1.0
 */
public interface UserService {

    /**
     * This method saves user to database.
     * 
     * @param user
     *            User to persist.
     * @return User ID after persisting.
     * @throws PersistenceException
     *             If there is any DB error.
     */
    public long registerUser(UserDTO user) throws PersistenceException;

    /**
     * This method find User by given handle.
     * 
     * @param handle
     *            The given handle.
     * @return Instance of User if found; null otherwise.
     * @throws PersistenceException
     *             If there is any DB error.
     */
    public UserDTO getUserByHandle(String handle) throws PersistenceException;

    /**
	 * This method check the handle exists or not.
	 *
	 * @param handle the given handle.
	 * @return true if the handle already exists, return false otherwise.
	 * @throws PersistenceException If there is any DB error.
	 *
	 */
	public boolean handleExists(String handle) throws PersistenceException;
    

    /**
	 * This method check if there is multiple users for the given email.
	 *
	 * @param email the given email.
	 * @return true if the there is multiple users for the given email, otherwise false
	 * @throws PersistenceException If there is any DB error.
	 *
	 */
	public boolean multipleUsers(String email) throws PersistenceException;

    /**
     * This method find User by given email address.
     * 
     * @param email
     *            Email address.
     * @return Instance of the {@link User} if found; null otherwise.
     * @throws PersistenceException
     *             If there is any DB error.
     */
    public UserDTO getUserByEmail(String email) throws PersistenceException;
    
    /**
     * This method find User by given user id.
     * 
     * @param userId
     *            User ID.
     * @return Instance of the {@link User} if found; null otherwise.
     * @throws PersistenceException
     *             If there is any DB error.
     */
    public UserDTO getUserByUserId(long userId) throws PersistenceException;

    /**
     * This method adds user to groups.
     * 
     * @param userId
     *            User ID.
     * @param groupIds
     *            Group IDs.
     * @throws PersistenceException
     *             If there is any error.
     */
    public void addUserToGroups(long userId, long[] groupIds) throws PersistenceException;

    /**
     * This method activates the account according to the given code.
     * 
     * @param activationCode
     *            Activation code.
     * @throws PersistenceException
     *             If there Any error. Say activation code wrong.
     */
    public void activate(String activationCode) throws PersistenceException, AlreadyActivatedException;
    
    /**
     * Get password according to user id.
     * 
     * @param userId
     *            the user id.
     * @return the password.
     * @throws PersistenceException
     *             If there is any error.
     * @since 1.1
     */
    public String getPasswordByUserId(long userId) throws PersistenceException;

    /**
     * Update user's <code>last_login</code> information of given user id
     *
     * @param userId User Id of user
     * @throws PersistenceException
     *              if there is any database related error.
     *
     * @since 1.2
     */
    public void updateLastLogin(long userId) throws PersistenceException;

}
