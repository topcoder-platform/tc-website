/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services;

import com.topcoder.security.groups.model.GroupAuditRecord;
import com.topcoder.security.groups.services.dto.PagedResult;

/**
 * <p>
 * This interface defines the contract for the creation and searching of audits
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
public interface GroupAuditService {
    /**
     * This method creates a new group audit record, and returns its ID.
     * 
     * @param record
     *            the group audit record to create
     * @return the ID of the created Group
     * @throws IllegalArgumentException
     *             If group is null
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     * 
     */
    public long add(GroupAuditRecord record) throws IllegalArgumentException, SecurityGroupException;

    /**
     * This method retrieves the list of audit records for the given paging requirements. The result will not be null,
     * and the inner list will also never be null.
     * 
     * @param page
     *            the 1-based number of the page to return. If 0, then all pages are returned
     * @param pageSize
     *            the size of the page to return. Will be a positive number, but ignored if page=0
     * @return A result object with the list of applicable audit records and the page and total data
     * @throws IllegalArgumentException
     *             If page < 0 or If pageSize < 1 unless page = 0
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     * 
     */
    public PagedResult<GroupAuditRecord> searchAuditRecords(int pageSize, int page) throws IllegalArgumentException,
                    SecurityGroupException;
}
