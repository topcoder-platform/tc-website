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

import com.topcoder.security.groups.model.BillingAccount;
import com.topcoder.security.groups.services.BillingAccountService;
import com.topcoder.security.groups.services.SecurityGroupException;

/**
 * <p>
 * Unit test for {@link HibernateBillingAccountService}. Test data should
 * already be in database
 * </p>
 * 
 * @author backstretlili
 * @version 1.0
 * @since 1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/securityGroupsApplicationContext.xml")
public class HibernateBillingAccountServiceTest {

    /**
     * <p>
     * Instance of {@link HibernateAuthorizationService}.
     * </p>
     */
    private BillingAccountService billingAccountService;

    /**
     * <p>
     * Test method for {@link BillingAccountService#get(long id)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can get a BillingAccount by billingAccountId</li>
     * </ol>
     * </p>
     */
    @Test
    public void testGet_Found() {
        long billingAccountId = 1L;
        String name = "Test Project 1";
        long companyId = 1;
        String description = "description";

        try {
            BillingAccount ba = billingAccountService.get(billingAccountId);
            assertTrue(ba != null);

            assertTrue(ba.getName().equals(name));
            assertTrue(ba.getCompanyId() == companyId);
            assertTrue(ba.getDescription().equals(description));
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for {@link BillingAccountService#get(long id)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can not find a BillingAccount by billingAccountId</li>
     * </ol>
     * </p>
     */
    @Test
    public void testGet_NotFound() {
        long billingAccountId = 236323L;

        try {
            assertTrue(billingAccountService.get(billingAccountId) == null);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for
     * {@link BillingAccountService#getBillingAccountsForClient(long clientId)}.
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can find BillingAccounts by clientId</li>
     * </ol>
     * </p>
     */
    @Test
    public void testGetBillingAccountsForClient_Found() {
        long clientId = 1L;
        String name = "Test Project 1";

        try {
            List<BillingAccount> billingAccounts = billingAccountService.getBillingAccountsForClient(clientId);
            assertTrue(billingAccounts.size() > 0);

            BillingAccount ba = billingAccounts.get(0);
            assertTrue(ba.getName().equals(name));
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for
     * {@link BillingAccountService#getBillingAccountsForClient(long clientId)}.
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can not find a BillingAccount by clientId</li>
     * </ol>
     * </p>
     */
    @Test
    public void testGetBillingAccountsForClient_NotFound() {
        long clientId = 345434L;

        try {
            assertTrue(billingAccountService.getBillingAccountsForClient(clientId).size() == 0);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * Setter of billingAccountService
     * 
     * @param billingAccountService
     *            the Spring injected billingAccountService
     */
    @Resource
    public void setBillingAccountService(BillingAccountService billingAccountService) {
        this.billingAccountService = billingAccountService;
    }

}
