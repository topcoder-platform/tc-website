/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dao;

import com.topcoder.web.studio.model.ContestType;
import com.topcoder.web.common.dao.GenericDAO;

import java.util.List;

/**
 * <p>An interface for the <code>DAO</code> to be used for accessing/managing the data for existing studio contest types
 * in persistent data store.</p>
 *
 * <p>Currently the interface defines the method for getting the list of all existing contest types and looking up for
 * a particular contest type referenced by the provided ID.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly (Req# 5.1)
 */
public interface ContestTypeDAO extends GenericDAO<ContestType, Integer> {

    /**
     * <p>Looks up for the studio contest type matching the specified ID.</p>
     *
     * @param id an <code>Integer</code> providing the ID of a studio contest type to find.
     * @return a <code>ContestType</code> representing the studio contest type matching the specified ID or
     *         <code>null</code> if there is no such contest type found.
     */
    ContestType find(Integer id);

    /**
     * <p>Gets the list of all existing studio contest types.</p>
     *
     * @return a <code>List</code> listing all existing studio contest types.
     */
    List<ContestType> getContestTypes();
}
