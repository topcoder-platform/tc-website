/*
 * Copyright (C) 2011 - 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services;

import com.topcoder.security.groups.model.Group;
import com.topcoder.security.groups.services.dto.GroupSearchCriteria;
import com.topcoder.security.groups.services.dto.PagedResult;

/**
 * <p>
 * This interface defines the contract for the management of groups
 * </p>
 * <p>
 * Thread Safety:Implementations are expected to be effectively thread-safe
 * </p>
 * 
 * <p>
 * Version 1.1 (TopCoder Security Groups Frontend - Create Update Group) change notes:
 * <ol>
 *   <li>Updated <code>update</code> method to return the updated <code>Group</code> instance.</li>
 * </ol>
 * </p>
 *
 * @author TCSASSEMBLER, flexme
 * 
 * @version 1.1
 * 
 */
public interface GroupService {

    /**
     * This method creates a new group, and returns its ID.
     * 
     * @param group
     *            the Group to create
     * @return the ID of the created Group
     * @throws IllegalArgumentException
     *             If group is null
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     */
    public long add(Group group) throws IllegalArgumentException, SecurityGroupException;

    /**
     * This method updates an existing group
     * 
     * @param group
     *            the Group to update
     * @return the updated group
     * @throws IllegalArgumentException
     *             If group is null
     * @throws EntityNotFoundException
     *             If the group with the given ID was not found
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     */
    public Group update(Group group) throws IllegalArgumentException, EntityNotFoundException, SecurityGroupException;

    /**
     * This method gets a group. If not found, returns null.
     * 
     * @param id
     *            the ID for the group to be retrieved
     * @return the requested Group
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     */
    public Group get(long id) throws SecurityGroupException;

    /**
     * This method deletes an existing group
     * 
     * @param id
     *            the ID for the group to be retrieved
     * @throws EntityNotFoundException
     *             If a group with the given ID was not found
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     */
    public void delete(long id) throws EntityNotFoundException, SecurityGroupException;

    /**
     * This method retrieves the list of Groups for the given search criteria
     * and paging requirements. The result will not be null, and the inner list
     * will also never be null.
     * 
     * @param criteria
     *            the filter with the search criteria: if null, assume no
     *            filtering
     * @param pageSize
     *            the size of the page to return. Will be a positive number, but
     *            ignored if page=0
     * @param page
     *            the 1-based number of the page to return. If 0, then all pages
     *            are returned
     * @return A result object with the list of applicable groups and the page
     *         and total data
     * @throws IllegalArgumentException
     *             If page < 0,or If pageSize < 1 unless page = 0
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     */
    public PagedResult<Group> search(GroupSearchCriteria criteria, int pageSize, int page)
            throws IllegalArgumentException, SecurityGroupException;
}
