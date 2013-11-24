/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.dao.hibernate;

import com.topcoder.web.common.dao.UserSocialLoginDAO;
import com.topcoder.web.common.model.UserSocialLogin;
import org.hibernate.Query;

import java.util.List;

/**
 * <p>
 * An implementation for the UserSocialLogin DAO.
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
public class UserSocialLoginDAOHibernate extends GenericBase<UserSocialLogin, UserSocialLogin.Identifier>
        implements UserSocialLoginDAO {

    /**
     * Find UserSocialLogin by user id.
     *
     * @param userId the user id
     * @return retrieved list
     */
    public List<UserSocialLogin> findByUserId(long userId) {
        Query q = getSession().createQuery("from UserSocialLogin " +
                " where id.userId = " + userId ).setCacheable(false);

        return q.list();
    }
}
