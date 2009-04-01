/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.GenericBase;
import com.topcoder.web.studio.dao.ContestTypeDAO;
import com.topcoder.web.studio.model.ContestType;

import java.util.List;

/**
 * <p>A default implementation of {@link ContestTypeDAO} interface built on top of <code>Hibernate ORM</code> framework.
 * </p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly (Req# 5.1)
 */
public class ContestTypeDAOHibernate extends GenericBase<ContestType, Integer> implements ContestTypeDAO {

    /**
     * <p>Constructs new <code>ContestTypeDAOHibernate</code> instance. This implementation does nothing.</p>
     */
    public ContestTypeDAOHibernate() {
    }

    /**
     * <p>Looks up for the studio contest type matching the specified ID.</p>
     *
     * @param id an <code>Integer</code> providing the ID of a studio contest type to find.
     * @return a <code>ContestType</code> representing the studio contest type matching the specified ID or
     *         <code>null</code> if there is no such contest type found.
     */
    public ContestType find(Integer id) {
        return super.find(id);
    }

    /**
     * <p>Gets the list of all existing studio contest types.</p>
     *
     * @return a <code>List</code> listing all existing studio contest types.
     */
    public List<ContestType> getContestTypes() {
        return findAll();
    }
}
