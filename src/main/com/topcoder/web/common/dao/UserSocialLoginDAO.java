/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.UserSocialLogin;

import java.util.List;

/**
 * <p>
 * An interface for the UserSocialLogin DAO.
 * </p>
 *
 * <p>
 * <strong>Thread safety:</strong> This class is thread-safe.
 * </p>
 *
 * <p>
 *   Version 1.0 (Release Assembly - Social Login Linking for Existing User) Change notes:
 *   <ol>
 *      <li>The first version of this DAO.</li>
 *   </ol>
 * </p>
 *
 * @author tangzx
 * @version 1.0
 */
public interface UserSocialLoginDAO extends GenericDAO<UserSocialLogin, UserSocialLogin.Identifier> {
    /**
     * Find UserSocialLogin by user id.
     *
     * @param userId the user id
     * @return retrieved list
     */
    List<UserSocialLogin> findByUserId(long userId);
    UserSocialLogin findByProviderIdAndName(long providerId, String name);
    UserSocialLogin findByProviderIdAndVerifiedEmail(long providerId, String email);
}
