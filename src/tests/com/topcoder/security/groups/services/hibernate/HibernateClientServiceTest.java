/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services.hibernate;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.topcoder.security.groups.model.Client;
import com.topcoder.security.groups.services.ClientService;
import com.topcoder.security.groups.services.SecurityGroupException;
import com.topcoder.security.groups.services.dto.ClientSearchCriteria;

/**
 * <p>
 * Unit test for {@link HibernateClientService}. Test data should already be in
 * database
 * </p>
 * 
 * @author backstretlili
 * @version 1.0
 * @since 1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/securityGroupsApplicationContext.xml")
public class HibernateClientServiceTest {

    /**
     * <p>
     * Instance of {@link HibernateAuthorizationService}.
     * </p>
     */
    private ClientService clientService;

    /**
     * <p>
     * Test method for {@link ClientService#getAllClients(long id)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can get all Clients</li>
     * </ol>
     * </p>
     */
    @Test
    public void testGetAllClients() {

        try {
            assertTrue(clientService.getAllClients().size() > 0);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for {@link ClientService#get(long id)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can get a Client by clientId</li>
     * </ol>
     * </p>
     */
    @Test
    public void testGet_Found() {
        long clientId = 1L;
        String name = "ACME";
        long companyId = 1;

        try {
            Client client = clientService.get(clientId);
            assertTrue(client != null);

            assertTrue(client.getName().equals(name));
            assertTrue(client.getCompanyId() == companyId);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for {@link ClientService#get(long id)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can not get a Client by clientId</li>
     * </ol>
     * </p>
     */
    @Test
    public void testGet_NotFound() {
        long clientId = 3453432L;

        try {
            assertTrue(clientService.get(clientId) == null);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for
     * {@link ClientService#search(ClientSearchCriteria criteria, int pageSize, int page)}
     * .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>test can not find Clients by condition</li>
     * </ol>
     * </p>
     */
    @Test
    public void testSearch_NotFound() {
        String clientName = "ACME_not_exists";
        String billingAccountName = "Test Project 1";

        ClientSearchCriteria criteria = new ClientSearchCriteria();
        criteria.setClientName(clientName);
        criteria.setBillingAccountName(billingAccountName);
        int page = 1;
        int pageSize = 20;

        try {
            assertTrue(clientService.search(criteria, pageSize, page).getValues().size() == 0);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for
     * {@link ClientService#search(ClientSearchCriteria criteria, int pageSize, int page)}
     * .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can find clients only by clientName</li>
     * </ol>
     * </p>
     */
    @Test
    public void testSearch_ClientName() {
        String clientName = "ACME";

        ClientSearchCriteria criteria = new ClientSearchCriteria();
        criteria.setClientName(clientName);
        int page = 1;
        int pageSize = 20;

        try {
            List<Client> list = clientService.search(criteria, pageSize, page).getValues();
            assertTrue(list.size() > 0);
            assertTrue(list.get(0).getName().indexOf(clientName) > -1);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for
     * {@link ClientService#search(ClientSearchCriteria criteria, int pageSize, int page)}
     * .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can find clients only by billingAccountName</li>
     * </ol>
     * </p>
     */
    @Test
    public void testSearch_BillingAccountName() {
        String billingAccountName = "Test Project 1";

        ClientSearchCriteria criteria = new ClientSearchCriteria();
        criteria.setBillingAccountName(billingAccountName);
        int page = 1;
        int pageSize = 20;

        try {
            List<Client> list = clientService.search(criteria, pageSize, page).getValues();
            assertTrue(list.size() > 0);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for
     * {@link ClientService#search(ClientSearchCriteria criteria, int pageSize, int page)}
     * .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can find clients only by projetcName</li>
     * </ol>
     * </p>
     */
    @Test
    public void testSearch_ProjetcName() {
        String projectName = "DirectProject name";

        ClientSearchCriteria criteria = new ClientSearchCriteria();
        criteria.setProjectName(projectName);
        int page = 1;
        int pageSize = 20;

        try {
            List<Client> list = clientService.search(criteria, pageSize, page).getValues();
            assertTrue(list.size() > 0);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for
     * {@link ClientService#search(ClientSearchCriteria criteria, int pageSize, int page)}
     * .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can find clients meet all conditions</li>
     * </ol>
     * </p>
     */
    @Test
    public void testSearch_AllConditions() {
        String projectName = "DirectProject name";
        String billingAccountName = "Test Project 1";
        String clientName = "ACME";

        ClientSearchCriteria criteria = new ClientSearchCriteria();
        criteria.setClientName(clientName);
        criteria.setBillingAccountName(billingAccountName);
        criteria.setProjectName(projectName);
        int page = 1;
        int pageSize = 20;

        try {
            List<Client> list = clientService.search(criteria, pageSize, page).getValues();
            assertTrue(list.size() > 0);
            assertTrue(list.get(0).getName().indexOf(clientName) > -1);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * Setter of clientService
     * 
     * @param clientService
     *            the Spring injected clientService
     */
    @Resource
    public void setClientService(ClientService clientService) {
        this.clientService = clientService;
    }

}
