/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.services;

import com.topcoder.web.common.model.PasswordRecovery;

/**
 * This interface defines a collection of contract methods for password recovery manipulation.
 * <p>
 * <strong>Thread Safety:</strong> Implementation of this class should be thread-safe.
 * </p>
 * 
 * @author leo_lol
 * @version 1.0
 * @since 1.0
 */
public interface PasswordRecoveryService {

    /**
     * This method persist a password recovery request.
     * 
     * @param passwordRecovery
     *            Instance of {@link PasswordRecovery} to persist
     * @throws ServiceException
     *             If there is any error.
     */
    public void create(PasswordRecovery passwordRecovery) throws ServiceException;

    /**
     * This method attempts to find the password recovery record according to the given ID.
     * 
     * @param passwordRecoveryId
     *            The given ID.
     * @return The password recovery entity found.
     * @throws ServiceException
     *             If there is any error.
     */
    public PasswordRecovery find(long passwordRecoveryId) throws ServiceException;

    /**
     * This method would mark the password recovery as used.
     * 
     * @param passwordRecoveryId
     *            ID of the record to mark.
     * @throws PersistenceException
     *             If there is any DB error.
     */
    public void use(long passwordRecoveryId) throws PersistenceException;
}
