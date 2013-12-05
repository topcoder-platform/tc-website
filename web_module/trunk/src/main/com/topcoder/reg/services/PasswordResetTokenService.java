/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.services;

import com.topcoder.reg.dto.PasswordResetTokenDTO;

/**
 * This class defines a collection contracting methods for Password reset code operation.
 * <p>
 * <strong>Thread Safety:</strong> Implementation of this interface should be effectively thread-safe.
 * </p>
 *
 * @author Urmass, TCSASSEMBLER
 * @version 1.0
 * @since 1.0
 */
public interface PasswordResetTokenService {
    /**
     * This method saves the given token DTO. 
     *
     * @param token - The given PasswordResetTokenDTO
     * 
     * @throws PersistenceException
     *             If there is any DB error.
     */
    public void save(PasswordResetTokenDTO token) throws PersistenceException;

    /**
     * This searches for the token DTO with given user id and email type id.
     *
     * @param userId - The given user id.
     * @param emailTypeId - The given email type id
     * @return - the entity.

     * @throws PersistenceException
     *             If there is any DB error.
     */
    public PasswordResetTokenDTO find(long userId, long emailTypeId) throws PersistenceException;

    /**
     * This method expires the token DTO with given user id and email type id.
     *
     * @param userId - The given user id.
     * @param emailTypeId - The given email type id.
     * @throws PersistenceException If there is any DB error.
     *
     */
    public void expire(long userId, long emailTypeId) throws PersistenceException;

}
