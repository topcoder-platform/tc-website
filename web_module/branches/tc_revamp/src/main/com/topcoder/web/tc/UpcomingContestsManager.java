/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc;

import java.util.List;

import com.topcoder.web.tc.dto.UpcomingContestDTO;
import com.topcoder.web.tc.dto.UpcomingContestsFilter;

/**
 * <p>
 * This interface defines the contract for getting information of upcoming contests by various filtering conditions. It
 * has an overloaded method that supports pagination.
 * </p>
 * <p>
 * Implementations of this interface are required to be thread-safe after configuration, assuming that the parameters
 * passed in do not change by other threads at the same time.
 * </p>
 * @author flytoj2ee, duxiaoyang
 * @version 1.0
 */
public interface UpcomingContestsManager {

    /**
     * <p>
     * Searches upcoming contests by given filtering condition with pagination support.
     * </p>
     * @param columnName
     *            the name of the column to sort on. If it is null or empty, the sorting will based on registration
     *            start time.
     * @param sortingOrder
     *            the order of sorting. If it is null, descending order will be used.
     * @param pageNumber
     *            the number of page to retrieve. -1 means all page will be retrieved.
     * @param pageSize
     *            the number of records in each page. -1 means all records should be retrieved.
     * @param filter
     *            the filter used to make constraints on searching criteria.
     * @return a list of UpcomingContestDTO that matches given filter. It will be null if no such contest can be found.
     * @throws IllegalArgumentException
     *             if filter is null, or either pageNumber or pageSize is zero or negative (-1 is acceptable).
     * @throws ContestsServiceManagerException
     *             is any error occurs while performing the search.
     */
    public List<UpcomingContestDTO> retrieveUpcomingContests(String columnName, SortingOrder sortingOrder,
            int pageNumber, int pageSize, UpcomingContestsFilter filter) throws ContestsServiceManagerException;

    /**
     * <p>
     * Searches upcoming contests by given filtering condition.
     * </p>
     * @param filter
     *            the filter used to make constraints on searching criteria.
     * @return a list of UpcomingContestDTO that matches given filter. It will be null if no such contest can be found.
     * @throws IllegalArgumentException
     *             if filter is null.
     * @throws ContestsServiceManagerException
     *             is any error occurs while performing the search.
     */
    public List<UpcomingContestDTO> retrieveUpcomingContests(UpcomingContestsFilter filter)
            throws ContestsServiceManagerException;
}
