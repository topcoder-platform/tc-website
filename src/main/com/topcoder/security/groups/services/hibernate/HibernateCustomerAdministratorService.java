/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services.hibernate;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.topcoder.commons.utils.LoggingWrapperUtility;
import com.topcoder.commons.utils.ValidationUtility;
import com.topcoder.security.groups.model.Client;
import com.topcoder.security.groups.model.CustomerAdministrator;
import com.topcoder.security.groups.services.ClientService;
import com.topcoder.security.groups.services.CustomerAdministratorService;
import com.topcoder.security.groups.services.EntityNotFoundException;
import com.topcoder.security.groups.services.SecurityGroupConfigurationException;
import com.topcoder.security.groups.services.SecurityGroupException;
import com.topcoder.security.groups.services.UserService;
import com.topcoder.security.groups.services.dto.UserDTO;

/**
 * <p>
 * This is the implementation of interface defines the contract for the management of customer administrators
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
public class HibernateCustomerAdministratorService extends BaseGroupService implements CustomerAdministratorService {

    /**
     * <p>
     * Represent the qualified name of this class.
     * </p>
     */
    private static final String CLASS_NAME = HibernateCustomerAdministratorService.class.getName();

    /**
     * A instance of ClientService used to check permissions,it'll be injected by Spring
     */
    private ClientService clientService;
    
    /**
     * A instance of UserService used to get user
     */
    private UserService userService;

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
                    SecurityGroupException {
        final String signature = CLASS_NAME + ".add(CustomerAdministrator customerAdministrator)";
        LoggingWrapperUtility.logEntrance(logger, signature, new String[] { "customerAdministrator" },
                        new Object[] { customerAdministrator });

        if (customerAdministrator == null) {
            wrapAndLogIllegalArgumentException(new IllegalArgumentException("customerAdministrator is null"), logger,
                            signature);
        }

        try {
            Session session = sessionFactory.getCurrentSession();
            session.persist(customerAdministrator);
        } catch (HibernateException e) {
            wrapAndLogSecurityException(e, logger, signature);
        }

        LoggingWrapperUtility.logExit(logger, signature, new Object[] { customerAdministrator.getId() });

        return customerAdministrator.getId();
    }

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
                    SecurityGroupException {
        final String signature = CLASS_NAME + ".update(CustomerAdministrator customerAdministrator)";
        LoggingWrapperUtility.logEntrance(logger, signature, new String[] { "customerAdministrator" },
                        new Object[] { customerAdministrator });

        if (customerAdministrator == null) {
            wrapAndLogIllegalArgumentException(
                            new IllegalArgumentException("customerAdministrator is null when update"), logger,
                            signature);
        }

        try {
            Session session = sessionFactory.getCurrentSession();
            CustomerAdministrator existing = (CustomerAdministrator) session.get(CustomerAdministrator.class,
                            Long.valueOf(customerAdministrator.getId()));

            if (existing == null) {
                wrapAndLogEntityNotFoundException(new EntityNotFoundException(
                                "customerAdministrator not found when update"), logger, signature);
            }

            session.clear();
            session.update(customerAdministrator);
        } catch (HibernateException e) {
            wrapAndLogSecurityException(e, logger, signature);
        }

        LoggingWrapperUtility.logExit(logger, signature, new Object[] { customerAdministrator });
    }

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
    public void delete(long id) throws EntityNotFoundException, SecurityGroupException {
        final String signature = CLASS_NAME + ".delete(long id)";
        LoggingWrapperUtility.logEntrance(logger, signature, new String[] { "id" }, new Object[] { id });

        CustomerAdministrator existing = null;
        try {
            Session session = sessionFactory.getCurrentSession();
            existing = (CustomerAdministrator) session.get(CustomerAdministrator.class, Long.valueOf(id));

            if (existing == null) {
                wrapAndLogEntityNotFoundException(new EntityNotFoundException(
                                "customerAdministrator not found when update"), logger, signature);
            }

            session.delete(existing);
        } catch (HibernateException e) {
            wrapAndLogSecurityException(e, logger, signature);
        }

        LoggingWrapperUtility.logExit(logger, signature, new Object[] { existing });
    }

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
    @SuppressWarnings("unchecked")
    public List<CustomerAdministrator> getAdministratorsForCustomer(long clientId) throws EntityNotFoundException,
                    SecurityGroupException {
        final String signature = CLASS_NAME + ".getAdministratorsForCustomer(long clientId)";
        LoggingWrapperUtility.logEntrance(logger, signature, new String[] { "clientId" }, new Object[] { clientId });

        List<CustomerAdministrator> result = new ArrayList<CustomerAdministrator>();
        try {
            Client client = clientService.get(clientId);
            if (client == null) {
                wrapAndLogEntityNotFoundException(new EntityNotFoundException("client not found"), logger, signature);
            }
            
            String hql = " from CustomerAdministrator ca where ca.client.id = :clientId ";
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createQuery(hql);
            query.setLong("clientId", clientId);
            result = (List<CustomerAdministrator>) query.list();
        } catch (HibernateException e) {
            wrapAndLogSecurityException(e, logger, signature);
        }

        LoggingWrapperUtility.logExit(logger, signature, new Object[] { result });

        return result;
    }

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
    @SuppressWarnings("unchecked")
    public List<Client> getCustomersForAdministrator(long userId) throws EntityNotFoundException,
    SecurityGroupException{
        final String signature = CLASS_NAME + ".getAdministratorsForCustomer(long clientId)";
        LoggingWrapperUtility.logEntrance(logger, signature, new String[] { "userId" }, new Object[] { userId });

        List<Client> result = new ArrayList<Client>();
        try {
            UserDTO user = userService.get(userId);
            if (user == null) {
                wrapAndLogEntityNotFoundException(new EntityNotFoundException("user not found"), logger, signature);
            }
            
            String hql = " from CustomerAdministrator ca where ca.userId = :userId ";
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createQuery(hql);
            query.setLong("userId", userId);
            List<CustomerAdministrator> list = (List<CustomerAdministrator>) query.list();
            for(CustomerAdministrator ca:list){
                result.add(ca.getClient());
            }
        } catch (HibernateException e) {
            wrapAndLogSecurityException(e, logger, signature);
        } 

        LoggingWrapperUtility.logExit(logger, signature, new Object[] { result });

        return result;
    }
    
    /**
     * <p>
     * This method mainly checks if the IOC operations succeeds. It's supposed
     * to be invoked immediately after IOC completes. Generally, you need to
     * specify its name at init-method property of spring bean definition.
     * </p>
     * 
     * @throws SecurityGroupConfigurationException
     */
    public void afterPropertiesSet() throws SecurityGroupConfigurationException {
        super.afterPropertiesSet();
        ValidationUtility.checkNotNull(clientService, "clientService", SecurityGroupConfigurationException.class);
        ValidationUtility.checkNotNull(userService, "userService", SecurityGroupConfigurationException.class);
    }

    /**
     * The setter of clientService
     * 
     * @param clientService
     *            the clientService to set
     */
    public void setClientService(ClientService clientService) {
        this.clientService = clientService;
    }

    /**
     * The setter of userService
     * 
     * @param userService
     *            the userService to set
     */
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
