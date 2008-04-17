/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.GenericBase;
import com.topcoder.web.studio.dao.ContestChannelDAO;
import com.topcoder.web.studio.model.ContestChannel;

import java.util.List;

/**
 * <p>A default implementation of {@link ContestChannelDAO} interface built on top of <code>Hibernate ORM</code>
 * framework.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly (Req# 5.2)
 */
public class ContestChannelDAOHibernate extends GenericBase<ContestChannel, Integer> implements ContestChannelDAO {

    /**
     * <p>Constructs new <code>ContestChannelDAOHibernate</code> instance. This implementation does nothing.</p>
     */
    public ContestChannelDAOHibernate() {
    }

    /**
     * <p>Looks up for the studio contest channel matching the specified ID.</p>
     *
     * @param id an <code>Integer</code> providing the ID of a studio contest channel to find.
     * @return a <code>ContestChannel</code> representing the studio contest channel matching the specified ID or
     *         <code>null</code> if there is no such contest channel found.
     */
    public ContestChannel find(Integer id) {
        return super.find(id);
    }

    /**
     * <p>Gets the list of all existing studio contest channels.</p>
     *
     * @return a <code>List</code> listing all existing studio contest channels.
     */
    public List<ContestChannel> getContestChannels() {
        return findAll();
    }
}
