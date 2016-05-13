/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.dao;

import java.util.Date;

import org.hibernate.HibernateException;
import com.topcoder.web.common.model.PasswordResetToken;

/**
 * <p>
 * The password reset token DAO used in Password Recovery Process.
 * </p>
 * 
 * @author vangavroche, TCSASSEMBLER
 * @version 1.0
 */
public interface PasswordResetTokenDAO {
    /**
     * <p>
     * Find the PasswordResetToken object by id.
     * </p>
     * 
     * @param userId
     *            the unique id.
     * @return the matched PasswordResetToken object;
     * @throws IllegalArgumentException
     *             if the argument is invalid.
     * @throws HibernateException
     *             if any SQL errors occurs.
     */
    public PasswordResetToken find(long userId);

    /**
     * <p>
     * Expire the token.
     * </p>
     * 
     * @param userId
     *            the user id to find the PasswordResetToken object.
     * @param token
     *            the token to expire.
     * @throws IllegalArgumentException
     *             if the argument is invalid.
     * @throws HibernateException
     *             if any SQL errors occurs.
     */
    public void expireToken(long userId, String token);

    /**
     * <p>
     * Save the token to persistence.
     * </p>
     * 
     * 
     * @param userId
     *            the user id to find the PasswordResetToken object.
     * @param token
     *            the token to expire.
     * @param expiredAt
     *            the expired date.
     * @throws IllegalArgumentException
     *             if the argument is invalid.
     * @throws HibernateException
     *             if any SQL errors occurs.
     */
    public void saveToken(long userId, String token, Date expiredAt);
}
