/*
 * Copyright (C) 2017 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.dao.hibernate;

import com.topcoder.web.common.dao.UserSSOLoginDAO;
import com.topcoder.web.common.model.UserSSOLogin;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;

import java.util.List;

/**
 * <p>
 * An implementation for the UserSSOLogin DAO.
 * </p>
 *
 * <p>
 * <strong>Thread safety:</strong> This class is thread-safe.
 * </p>
 *
 * @author kht.tc
 * @version 1.0
 */
public class UserSSOLoginDAOHibernate extends GenericBase<UserSSOLogin, UserSSOLogin.Identifier>
        implements UserSSOLoginDAO {

    /**
     * Find UserSSOLogin by user id.
     *
     * @param userId the user id
     * @return retrieved list
     */
    public List<UserSSOLogin> findByUserId(long userId) {
        Query q = getSession().createQuery("from UserSSOLogin " +
                " where id.userId = " + userId ).setCacheable(false);

        return q.list();
    }

    public UserSSOLogin findByProviderIdAndSSOUserId(long providerId, String ssoUserId) {
        Criteria c = getSession().createCriteria(UserSSOLogin.class)
                .add(Restrictions.eq("ssoUserId", ssoUserId))
                .add(Restrictions.eq("id.providerId", providerId));
        List ret = c.list();
        return ret.isEmpty() ? null : (UserSSOLogin) ret.get(0);

    }
}
