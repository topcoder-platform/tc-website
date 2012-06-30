/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services;

import java.util.List;

import com.topcoder.security.groups.model.Client;
import com.topcoder.security.groups.services.dto.ClientSearchCriteria;

import com.topcoder.security.groups.services.dto.PagedResult;

/**
 * <p>
 * This interface defines the contract for the retrieval of clients
 * </p>
 * <p>
 * Thread Safety:Implementations are expected to be effectively thread-safe
 * </p>
 * 
 * @author TCSASSEMBLER
 * 
 * @version 1.0
 * 
 */
public interface ClientService {

    /**
     * This method gets all clients. If not found, returns an empty list.
     * 
     * @return the Clients
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     */
    public List<Client> getAllClients() throws SecurityGroupException;

    /**
     * This method gets a client. If not found, returns null.
     * 
     * @param id
     *            the ID fo the client to be retrieved
     * @return the requested Client
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     */
    public Client get(long id) throws SecurityGroupException;

    /**
     * This method retrieves the list of Clients for the given search criteria
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
     * @return A result object with the list of applicable clients and the page
     *         and total data
     * @throws IllegalArgumentException
     *             If page < 0, or If pageSize < 1 unless page = 0
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     */
    public PagedResult<Client> search(ClientSearchCriteria criteria, int pageSize, int page)
            throws IllegalArgumentException, SecurityGroupException;
}
