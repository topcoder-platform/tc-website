/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.dao.hibernate;

import com.topcoder.web.common.dao.UserSocialLoginDAO;
import com.topcoder.web.common.model.UserSocialLogin;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;

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
    public UserSocialLogin findByProviderIdAndName(long providerId, String name) {
        Criteria c = getSession().createCriteria(UserSocialLogin.class)
                .add(Restrictions.eq("id.socialLoginProviderId", providerId))
                .add(Restrictions.eq("socialUserName", name));
        List ret = c.list();
        return ret.isEmpty() ? null : (UserSocialLogin) ret.get(0);
    }
    public UserSocialLogin findByProviderIdAndVerifiedEmail(long providerId, String email) {
        Criteria c = getSession().createCriteria(UserSocialLogin.class)
                .add(Restrictions.eq("id.socialLoginProviderId", providerId))
                .add(Restrictions.eq("socialEmail", email))
                .add(Restrictions.eq("socialEmailVerified", true));
        List ret = c.list();
        return ret.isEmpty() ? null : (UserSocialLogin) ret.get(0);
    }
}
