/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services;

import com.topcoder.security.groups.model.GroupMember;
import com.topcoder.security.groups.services.dto.GroupMemberAccessHistoricalData;
import com.topcoder.security.groups.services.dto.GroupMemberSearchCriteria;
import com.topcoder.security.groups.services.dto.PagedResult;



/**
 * <p>
 * This interface defines the contract for the update of group members and searching of their access history
 * </p>
 * 
 * <p>
 * Thread Safety:Implementations are expected to be effectively thread-safe
 * </p>
 * 
 * @author backstretlili
 * 
 * @version 1.0
 */
public interface GroupMemberService {
    /**
     * This method updates an existing group member
     * 
     * @param member
     *            the GroupMember to update
     * @throws IllegalArgumentException
     *             If member is null
     * @throws EntityNotFoundException
     *             If the member with the given ID was not found
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     */
    public void update(GroupMember member) throws IllegalArgumentException,EntityNotFoundException,SecurityGroupException;

    /**
     * This method retrieves the list of historical data for the given search criteria and paging requirements. The
     * result will not be null, and the inner list will also never be null.
     * 
     * @param criteria
     *            the filter with the search criteria: if null, assume no filtering
     * @param page
     *            the 1-based number of the page to return. If 0, then all pages are returned
     * @param pageSize
     *            the size of the page to return. Will be a positive number, but ignored if page=0
     * @return A result object with the list of applicable historical data and the page and total data
     * @throws IllegalArgumentException
     *             If page < 0 or If pageSize < 1 unless page = 0
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     * 
     */
    public PagedResult<GroupMemberAccessHistoricalData> searchHistoricalData(GroupMemberSearchCriteria criteria,
                    int pageSize, int page) throws SecurityGroupException;
}
