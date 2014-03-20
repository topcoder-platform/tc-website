/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.services;

import com.topcoder.reg.dto.SocialAccount;
import com.topcoder.reg.services.PersistenceException;

/**
 * This class defines the social account related operations.
 * <p>
 * <strong>Thread Safety:</strong> Implementation of this interface should be effectively thread-safe.
 * </p>
 * 
 * @author ecnu_haozi
 * @version 1.0
 * @since 1.0 (Release Assembly - TopCoder Website Social Login)
 */
public interface SocialAccountService {
    /**
     * Find if there is a TC account mapping to the given social account. If true return the TC user account's user
     * id, otherwise return null.
     * 
     * @param socialAccount
     *            the given social account.
     * @return the mapped TC account's userId.
     * @throws PersistenceException
     *             if there is any database related error.
     * @throws SocialAccountException
     *             if other abnormal thing occurs.
     */
    public Long findUserBySocialAccount(SocialAccount socialAccount) throws SocialAccountException, PersistenceException;

    /**
     * Bind the TC account, which is identified by its user id, with the social account.
     * 
     * @param userId
     *            the TC account's identity.
     * @param socialAccount
     *            the social account to persist.
     * @throws PersistenceException
     *             if there is any database related error.
     */
    public void bindUserWithSocialAccount(long userId, SocialAccount socialAccount) throws PersistenceException;

    /**
     * Get the soical account information according to the authorization code given by Auth0.
     * 
     * @param code
     *            the authorization code given by Auth0
     * @return the social account.
     * @throws PersistenceException
     *             if there is any database related error.
     * @throws SocialAccountException
     *             if other abnormal thing occurs.
     */
    public SocialAccount getSocialAccount(String code) throws SocialAccountException, PersistenceException;
}