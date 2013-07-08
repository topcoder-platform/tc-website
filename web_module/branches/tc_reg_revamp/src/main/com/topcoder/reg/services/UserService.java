/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
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
 * @author leo_lol
 * @version 1.0
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
    public void activate(String activationCode) throws PersistenceException;
}
