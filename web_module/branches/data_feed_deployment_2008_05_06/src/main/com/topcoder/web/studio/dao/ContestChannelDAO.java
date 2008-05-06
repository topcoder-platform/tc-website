/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dao;

import com.topcoder.web.studio.model.ContestChannel;
import com.topcoder.web.common.dao.GenericDAO;

import java.util.List;

/**
 * <p>An interface for the <code>DAO</code> to be used for accessing/managing the data for existing studio contest
 * channels in persistent data store.</p>
 *
 * <p>Currently the interface defines the method for getting the list of all existing contest channels and looking up
 * for a particular contest channel referenced by the provided ID.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly (Req# 5.2)
 */
public interface ContestChannelDAO extends GenericDAO<ContestChannel, Integer> {

    /**
     * <p>Looks up for the studio contest channel matching the specified ID.</p>
     *
     * @param id an <code>Integer</code> providing the ID of a studio contest channel to find.
     * @return a <code>ContestChannel</code> representing the studio contest channel matching the specified ID or
     *         <code>null</code> if there is no such contest channel found.
     */
    ContestChannel find(Integer id);

    /**
     * <p>Gets the list of all existing studio contest channels.</p>
     *
     * @return a <code>List</code> listing all existing studio contest channels.
     */
    List<ContestChannel> getContestChannels();
}
