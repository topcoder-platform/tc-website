/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services;

import java.util.List;

import com.topcoder.security.groups.model.BillingAccount;

/**
 * <p>
 * This interface defines the contract for the retrieval of billing accounts
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
public interface BillingAccountService {

    /**
     * This method gets a billing account. If not found, returns null.
     * 
     * @param id
     *            the ID for the billing account to be retrieved
     * @return the requested BillingAccount
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     */
    public BillingAccount get(long id) throws SecurityGroupException;

    /**
     * This method gets all billing accounts for the given client. If not found,
     * returns an empty list.
     * 
     * @param clientId
     *            the ID for the client
     * @return the billing accounts for the given client
     * @throws EntityNotFoundException
     *             If a client with the given ID was not found
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     */
    public List<BillingAccount> getBillingAccountsForClient(long clientId) throws EntityNotFoundException,
            SecurityGroupException;
}
