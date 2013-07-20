/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.dao;

import java.util.Date;

import org.hibernate.HibernateException;
import com.topcoder.web.common.model.SecondEmailRequest;

/**
 * <p>
 * The second mail request DAO used in password recovery process.
 * </p>
 * 
 * @author vangavroche, TCSASSEMBLER
 * @version 1.0
 */
public interface SecondEmailRequestDAO {
    /**
     * <p>
     * Save the SecondEmailRequest to persistence.
     * </p>
     * 
     * @param userId
     *            the user id.
     * @param email
     *            the email.
     * @param randomKey
     *            the random key.
     * @param expiredAt
     *            the expired date.
     * @throws IllegalArgumentException
     *             if the argument is invalid.
     * @throws HibernateException
     *             if any SQL errors occurs.
     */
    public void save(long userId, String email, int randomKey, Date expiredAt);

    /**
     * <p>
     * Check the email is taken by the others or not.
     * </p>
     * 
     * @param email
     *            the second email.
     * @param requestingUserId
     *            the current user.
     * @throws IllegalArgumentException
     *             if the argument is invalid.
     * @throws HibernateException
     *             if any SQL errors occurs.
     * @return true if the email does not belong to the current user, but belongs to the others.
     */
    public boolean isEmailOccupied(String email, long requestingUserId);

    /**
     * <p>
     * Find the SecondEmailRequest object by its id.
     * </p>
     * 
     * @param userId
     *            the id.
     * @throws IllegalArgumentException
     *             if the argument is invalid.
     * @throws HibernateException
     *             if any SQL errors occurs.
     * @return the SecondEmailRequest object
     */
    public SecondEmailRequest find(long userId);
}
