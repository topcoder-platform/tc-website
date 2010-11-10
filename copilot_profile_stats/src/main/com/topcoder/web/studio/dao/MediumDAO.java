/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dao;

import com.topcoder.web.studio.model.ContestType;
import com.topcoder.web.studio.model.Medium;
import com.topcoder.web.common.dao.GenericDAO;

import java.util.List;

/**
 * <p>An interface for the <code>DAO</code> to be used for accessing/managing the data for existing contest submission
 * medium types in persistent data store.</p>
 *
 * <p>Currently the interface defines the method for getting the list of all existing medium types and looking up for
 * a particular medium type referenced by the provided ID.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly v2
 */
public interface MediumDAO extends GenericDAO<Medium, Integer> {
}
