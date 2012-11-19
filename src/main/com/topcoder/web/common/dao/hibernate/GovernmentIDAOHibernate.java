/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.dao.hibernate;

import com.topcoder.web.common.dao.GovernmentIDDAO;
import com.topcoder.web.common.model.GovernmentID;
import org.hibernate.Query;

import java.util.List;

/**
 * <p>An implementation for {@link GovernmentIDDAO} interface backed up by <code>Hibernate</code> framework.</p>
 * 
 * @author isv
 * @version 1.0
 */
public class GovernmentIDAOHibernate extends GenericBase<GovernmentID, Long> implements GovernmentIDDAO {

    /**
     * <p>Looks up for the government issued ID document for specified user.</p>
     *
     * @param userId a <code>long</code> providing the user ID.
     * @return a <code>GovernmentID</code> for specified user or <code>null</code> if such a document is not found.
     */
    public GovernmentID findByUserId(long userId) {
        Query q = getSession().createQuery("from com.topcoder.web.common.model.GovernmentID g " +
                                           "where g.userId = ?");
        q.setLong(0, userId);
        List list = q.list();
        if (list == null || list.isEmpty()) {
            return null;
        } else {
            return (GovernmentID) list.get(0);
        }
    }
}
