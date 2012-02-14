/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc;

import java.util.List;

import com.topcoder.web.tc.dto.BugRaceDTO;

/**
 * <p>
 * This interface defines the contract for getting information of bug race contests. It has a method that supports
 * pagination.
 * </p>
 * <p>
 * Thread Safety: The implementation of this interface must be thread-safe after configuration and assuming that the
 * passed in parameters are not changed by other threads at the same time.
 * </p>
 * @author duxiaoyang
 * @version 1.0
 */
public interface BugRacesManager {

    /**
     * <p>
     * Retrieve bug race contests with pagination support.
     * </p>
     * @return matched bug races contests. It won't be null but could be empty.
     * @throws IllegalArgumentException
     *             if pageNumber is negative, or pageSize is not zero of negative.
     * @throws ActiveContestsManagerException
     *             if any error occurs which retrieving bug race contests.
     */
    public List<BugRaceDTO> retrieveBugRaces() throws BugRacesManagerException;
}
