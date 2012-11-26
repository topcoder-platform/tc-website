/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.GovernmentID;

/**
 * <p>An interface for the DAO to be used for managing <code>Government ID</code> entities.</p>
 * 
 * @author isv
 * @version 1.0
 */
public interface GovernmentIDDAO extends GenericDAO<GovernmentID, Long> {

    /**
     * <p>Looks up for the government issued ID document for specified user.</p>
     * 
     * @param userId a <code>long</code> providing the user ID.
     * @return a <code>GovernmentID</code> for specified user or <code>null</code> if such a document is not found. 
     */
    GovernmentID findByUserId(long userId);
}
