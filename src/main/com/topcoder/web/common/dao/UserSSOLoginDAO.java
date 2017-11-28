/*
 * Copyright (C) 2017 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.UserSSOLogin;

import java.util.List;

/**
 * <p>
 * An interface for the UserSSOLogin DAO.
 * </p>
 *
 * <p>
 * <strong>Thread safety:</strong> This class is thread-safe.
 * </p>
 *
 * @author kht.tc
 * @version 1.0
 */
public interface UserSSOLoginDAO extends GenericDAO<UserSSOLogin, UserSSOLogin.Identifier> {
    /**
     * Find UserSSOLogin by user id.
     *
     * @param userId the user id
     * @return retrieved list
     */
    List<UserSSOLogin> findByUserId(long userId);
    UserSSOLogin findByProviderIdAndSSOUserId(long providerId, String ssoUserId);
}
