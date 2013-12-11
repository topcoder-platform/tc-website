/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.dao.hibernate;

import com.topcoder.web.common.dao.UserApiSpinDAO;
import com.topcoder.web.common.model.UserApiSpin;
import org.hibernate.Query;

import java.util.List;

/**
 * <p>
 * An implementation for the UserApiSpin DAO.
 * </p>
 *
 * <p>
 * <strong>Thread safety:</strong> This class is thread-safe.
 * </p>
 *
 * <p>
 *   Version 1.0 (Release Assembly - Porting CS Mashathon pages to TopCoder website) Change notes:
 *   <ol>
 *      <li>The first version of this DAO.</li>
 *   </ol>
 * </p>
 *
 * @author TCSASSEMBLER
 * @version 1.0
 */
public class UserApiSpinDAOHibernate extends GenericBase<UserApiSpin, UserApiSpin.Identifier>
        implements UserApiSpinDAO {
    /**
     * Find UserApiSpin via user id.
     * @param userId the user id
     * @return retrieved results
     */
    public List<UserApiSpin> findByUserId(long userId) {
        Query q = getSession().createQuery("from UserApiSpin " +
                " where id.userId = " + userId +
                " order by id.apiRanking ").setCacheable(false);

        return q.list();
    }
}
