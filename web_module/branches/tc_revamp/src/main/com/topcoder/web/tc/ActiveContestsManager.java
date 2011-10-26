/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc;

import java.util.List;

import com.topcoder.web.tc.dto.ActiveContestDTO;
import com.topcoder.web.tc.dto.ActiveContestFilter;

/**
 * <p>
 * This interface defines the contract for getting information of active contests by various filtering
 * conditions. It has an overloaded method that supports pagination.
 * </p>
 * <p>
 * Thread Safety: The implementation of this interface must be thread-safe after configuration and assuming
 * that the passed in parameters are not changed by other threads at the same time.
 * </p>
 *
 * @author mekanizumu, TCSDEVELOPER
 * @version 1.0
 */
public interface ActiveContestsManager {
    /**
     * <p>
     * Retrieve active contests by given filtering conditions with pagination support.
     * </p>
     *
     * @param sortingOrder
     *            the sorting order. If it's null, natural order will be used.
     * @param pageSize
     *            the page size.
     * @param pageNumber
     *            the page number.
     * @param columnName
     *            the name of the ActiveContestDTO column to sort on. If it's null or empty, natural order
     *            will be used.
     * @param filter
     *            the filtering condition. If all its properties are null or empty, all results will be
     *            returned.
     * @return matched active contests. It won't be null but could be empty
     * @throws IllegalArgumentException
     *             if pageNumber is not positive, or not value -1 that used as the flag for returning all
     *             values, or not have the values of the constants of Filterable, or pageSize is not positive,
     *             or not have the values of the constants of Filterable, or filter is null
     * @throws ActiveContestsManagerException
     *             if any error occurs
     */
    public List<ActiveContestDTO> retrieveActiveContests(String columnName, SortingOrder sortingOrder,
                    int pageNumber, int pageSize, ActiveContestFilter filter)
        throws ActiveContestsManagerException;

    /**
     * <p>
     * Retrieve active contests by given filtering conditions.
     * </p>
     *
     * @param filter
     *            the filtering condition. If all its properties are null or empty, all results will be
     *            returned.
     * @return matched active contests. It won't be null but could be empty.
     * @throws IllegalArgumentException
     *             if filter is null;
     * @throws ActiveContestsManagerException
     *             if any error occurs
     */
    public List<ActiveContestDTO> retrieveActiveContests(ActiveContestFilter filter)
        throws ActiveContestsManagerException;
}
