/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services.hibernate;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.topcoder.security.groups.model.Client;
import com.topcoder.security.groups.model.CustomerAdministrator;
import com.topcoder.security.groups.services.CustomerAdministratorService;
import com.topcoder.security.groups.services.EntityNotFoundException;
import com.topcoder.security.groups.services.SecurityGroupException;

/**
 * <p>
 * Unit test for {@link HibernateCustomerAdministratorService}. Test data should already be in database
 * </p>
 * 
 * @author backstretlili
 * @version 1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/securityGroupsApplicationContext.xml")
public class HibernateCustomerAdministratorServiceTest {

    /**
     * <p>
     * Instance of {@link HibernateCustomerAdministratorService}.
     * </p>
     */
    private CustomerAdministratorService customerAdministratorService;

    /**
     * <p>
     * Test method for {@link CustomerAdministratorService#add(CustomerAdministrator customerAdministrator)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can add a CustomerAdministrator</li>
     * </ol>
     * </p>
     */
    @Test
    public void testAdd() {
        CustomerAdministrator ca = generateAdministrator();

        try {
            assertTrue(customerAdministratorService.add(ca) > 0);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * A utility method used to generate a CustomerAdministrator entity for testing.
     * 
     * @return CustomerAdministrator the generated CustomerAdministrator
     */
    private CustomerAdministrator generateAdministrator() {
        CustomerAdministrator ca = new CustomerAdministrator();
        Client client = new Client();
        client.setId(1L);
        ca.setClient(client);
        ca.setUserId(132456L);
        return ca;
    }

    /**
     * <p>
     * Test method for {@link CustomerAdministratorService#update(CustomerAdministrator customerAdministrator)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can update a CustomerAdministrator</li>
     * </ol>
     * </p>
     */
    @Test
    public void testUpdate() {

        try {
            CustomerAdministrator ca = customerAdministratorService.getAdministratorsForCustomer(2L).get(0);
            ca.getClient().setId(1L);
            customerAdministratorService.update(ca);
            assertTrue(customerAdministratorService.getAdministratorsForCustomer(1L).size() == 3);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for {@link CustomerAdministratorService#delete(long id)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can delete a CustomerAdministrator</li>
     * </ol>
     * </p>
     */
    @Test
    public void testDelete() {

        try {
            CustomerAdministrator ca = customerAdministratorService.getAdministratorsForCustomer(70014096L).get(0);
            customerAdministratorService.delete(ca.getId());
            assertTrue(customerAdministratorService.getAdministratorsForCustomer(70014096L).size() == 1);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for {@link CustomerAdministratorService#getAdministratorsForCustomer(long clientId)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can get CustomerAdministrators by clientId</li>
     * </ol>
     * </p>
     */
    @Test
    public void testGetAdministratorsForCustomer_Found() {

        try {
            assertTrue(customerAdministratorService.getAdministratorsForCustomer(70014096L).size() == 1);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for {@link CustomerAdministratorService#getAdministratorsForCustomer(long clientId)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>CustomerAdministrators for clientId don't exist</li>
     * </ol>
     * </p>
     */
    @Test
    public void testGetAdministratorsForCustomer_NotFound() {

        try {
            customerAdministratorService.getAdministratorsForCustomer(10000L);
        } catch (EntityNotFoundException e) {
            assertTrue(true);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for {@link CustomerAdministratorService#getCustomersForAdministrator(long userId)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can get Clients by userId</li>
     * </ol>
     * </p>
     */
    @Test
    public void testGetCustomersForAdministrator_Found() {

        try {
            assertTrue(customerAdministratorService.getCustomersForAdministrator(132456L).size() == 3);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for {@link CustomerAdministratorService#getCustomersForAdministrator(long userId)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>Client for userId don't exist</li>
     * </ol>
     * </p>
     */
    @Test
    public void testGetCustomersForAdministrator_NotFound() {

        try {
            assertTrue(customerAdministratorService.getCustomersForAdministrator(20L).size() == 0);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * Setter of customerAdministratorService
     * 
     * @param customerAdministratorService
     *            the Spring injected customerAdministratorService
     */
    @Resource
    public void setCustomerAdministratorService(CustomerAdministratorService customerAdministratorService) {
        this.customerAdministratorService = customerAdministratorService;
    }

}
