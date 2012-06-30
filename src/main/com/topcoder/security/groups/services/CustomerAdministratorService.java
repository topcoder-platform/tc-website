/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services;

import java.util.List;

import com.topcoder.security.groups.model.Client;
import com.topcoder.security.groups.model.CustomerAdministrator;

/**
 * <p>
 * This interface defines the contract for the management of customer administrators
 * </p>
 * 
 * <p>
 * Thread Safety:Implementations are expected to be effectively thread-safe
 * </p>
 * 
 * @author backstretlili
 * 
 * @version 1.0
 * 
 */
public interface CustomerAdministratorService {
    /**
     * This method creates a new customer administrator, and returns its ID.
     * 
     * @param customerAdministrator
     *            the CustomerAdministrator to create
     * @return the ID of the created CustomerAdministrator
     * @throws IllegalArgumentException
     *             If customerAdministrator is null
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     */
    public long add(CustomerAdministrator customerAdministrator) throws IllegalArgumentException,
                    SecurityGroupException;

    /**
     * This method updates an existing customer administrator
     * 
     * @param customerAdministrator
     *            the CustomerAdministrator to update
     * @throws IllegalArgumentException
     *             If customerAdministrator is null
     * @throws EntityNotFoundException
     *             If the customer administrator with the given ID was not found
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     * 
     */
    public void update(CustomerAdministrator customerAdministrator) throws EntityNotFoundException,
                    SecurityGroupException;

    /**
     * This method deletes an existing customer administrator
     * 
     * @param id
     *            the ID for the customer administrator to be retrieved
     * 
     * @throws EntityNotFoundException
     *             If a customer administrator with the given ID was not found
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     * 
     */
    public void delete(long id) throws EntityNotFoundException, SecurityGroupException;

    /**
     * This method gets all administrators for the given client. If not found, returns an empty list.
     * 
     * @param clientId
     *            the ID for the client
     * @return the administrators for the given client
     * @throws EntityNotFoundException
     *             If a client with the given ID was not found
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     * 
     */
    public List<CustomerAdministrator> getAdministratorsForCustomer(long clientId) throws EntityNotFoundException,
                    SecurityGroupException;

    /**
     * This method gets all clients for the given administrator. If not found, returns an empty list.
     * 
     * @param userId
     *            the ID for the administrator
     * @return the clients for the given administrator
     * @throws EntityNotFoundException
     *             If a administrator with the given ID was not found
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     * 
     */
    public List<Client> getCustomersForAdministrator(long userId) throws EntityNotFoundException,
                    SecurityGroupException;
}
