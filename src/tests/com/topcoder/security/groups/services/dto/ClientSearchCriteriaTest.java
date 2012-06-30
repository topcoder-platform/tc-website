/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services.dto;

import static org.junit.Assert.*;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import com.topcoder.security.groups.TestHelper;

/**
 * <p>
 * Unit test for {@link ClientSearchCriteria}.
 * </p>
 * 
 * @author leo_lol
 * @version 1.0 (Topcoder Security Groups Backend Model and Authorization
 *          Assembly)
 * @since 1.0
 */
public class ClientSearchCriteriaTest {
    /**
     * <p>
     * This field represents the commonly used ClientSearchCriteria instance.
     * </p>
     */
    private ClientSearchCriteria instance;

    /**
     * <p>
     * Initialize the {{@link #instance} field.
     * </p>
     */
    @Before
    public void setUp() {
        instance = new ClientSearchCriteria();
    }

    /**
     * Test method for {@link ClientSearchCriteria#ClientSearchCriteria()} .
     */
    @Test
    public void testClientSearchCriteria() {
        ClientSearchCriteria clientSearchCriteria = new ClientSearchCriteria();
        assertNotNull(clientSearchCriteria);
    }

    /**
     * Test method for {@link ClientSearchCriteria#getClientName()} .
     */
    @Test
    public void testGetClientName() {
        String CLIENT_NAME = "NAME";
        TestHelper.setProperty(instance, "clientName", CLIENT_NAME);
        Assert.assertEquals(CLIENT_NAME, instance.getClientName());
    }

    /**
     * Test method for
     * {@link ClientSearchCriteria#setClientName(java.lang.String)} .
     */
    @Test
    public void testSetClientName() {
        String CLIENT_NAME = "NAME";
        instance.setClientName(CLIENT_NAME);
        Assert.assertEquals(CLIENT_NAME,
                TestHelper.getProperty(instance, "clientName", String.class));
    }

    /**
     * Test method for {@link ClientSearchCriteria#getBillingAcountName()} .
     */
    @Test
    public void testGetBillingAcountName() {
        String BILLING_ACCOUNT_NAME = "BILLING ACCOUNT NAME";
        TestHelper.setProperty(instance, "billingAccountName",
                BILLING_ACCOUNT_NAME);
        assertEquals(BILLING_ACCOUNT_NAME, instance.getBillingAccountName());
    }

    /**
     * Test method for
     * {@link ClientSearchCriteria#setBillingAcountName(java.lang.String)} .
     */
    @Test
    public void testSetBillingAcountName() {
        String BILLING_ACCOUNT_NAME = "BILLING ACCOUNT NAME";
        instance.setBillingAccountName(BILLING_ACCOUNT_NAME);
        assertEquals(BILLING_ACCOUNT_NAME, TestHelper.getProperty(instance,
                "billingAccountName", String.class));

    }

    /**
     * Test method for {@link ClientSearchCriteria#getProjectName()} .
     */
    @Test
    public void testGetProjectName() {
        String PROJECT_NAME = "project name";
        TestHelper.setProperty(instance, "projectName", PROJECT_NAME);
        assertEquals(PROJECT_NAME, instance.getProjectName());
    }

    /**
     * Test method for
     * {@link ClientSearchCriteria#setProjectName(java.lang.String)} .
     */
    @Test
    public void testSetProjectName() {
        String PROJECT_NAME = "project name";
        instance.setProjectName(PROJECT_NAME);
        assertEquals(PROJECT_NAME,
                TestHelper.getProperty(instance, "projectName", String.class));
    }

}
