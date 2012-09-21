/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.model;

import junit.framework.Assert;
import org.junit.Before;
import org.junit.Test;
import com.topcoder.security.groups.TestHelper;

/**
 * <p>
 * Unit test for {@link BillingAccount}
 * </p>
 * 
 * @author leo_lol
 * @version 1.0
 * @since 1.0
 */
public class BillingAccountTest {

    /**
     * <p>
     * Commonly used BillingAccount instance.
     * </p>
     */
    private BillingAccount instance;

    /**
     * <p>
     * Set up for unit test.
     * </p>
     */
    @Before
    public void setUp() {
        instance = new BillingAccount();
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.BillingAccount#BillingAccount()}
     * .
     */
    @Test
    public void testBillingAccount() {
        BillingAccount instance = new BillingAccount();
        Assert.assertNotNull(instance);
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.BillingAccount#getCompanyId()}.
     */
    @Test
    public void testGetCompanyId() {
        long id = 1;
        TestHelper.setProperty(instance, "companyId", id);
        Assert.assertEquals(instance.getCompanyId(), id);
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.BillingAccount#setCompanyId(long)}
     * .
     */
    @Test
    public void testSetCompanyId() {
        long id = 1L;
        instance.setCompanyId(id);
        Assert.assertEquals(id,
                TestHelper.getProperty(instance, "companyId", Long.class)
                        .longValue());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.BillingAccount#getName()}.
     */
    @Test
    public void testGetName() {
        String name = "name";
        TestHelper.setProperty(instance, "name", name);
        Assert.assertEquals(name, instance.getName());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.BillingAccount#setName(java.lang.String)}
     * .
     */
    @Test
    public void testSetName() {
        String name = "name";
        instance.setName(name);
        Assert.assertEquals(name,
                TestHelper.getProperty(instance, "name", String.class));
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.BillingAccount#getDescription()}
     * .
     */
    @Test
    public void testGetDescription() {
        String description = "desc";
        TestHelper.setProperty(instance, "description", description);
        Assert.assertEquals(description, instance.getDescription());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.BillingAccount#setDescription(java.lang.String)}
     * .
     */
    @Test
    public void testSetDescription() {
        String description = "desc";
        instance.setDescription(description);
        Assert.assertEquals(description,
                TestHelper.getProperty(instance, "description", String.class));
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.BillingAccount#getClient()}.
     */
    @Test
    public void testGetClient() {
        Client client = new Client();
        TestHelper.setProperty(instance, "client", client);
        Assert.assertEquals(client, instance.getClient());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.BillingAccount#setClient(com.topcoder.security.groups.model.Client)}
     * .
     */
    @Test
    public void testSetClient() {
        Client client = new Client();
        instance.setClient(client);
        Assert.assertEquals(client,
                TestHelper.getProperty(instance, "client", Client.class));
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.BillingAccount#isDeleted()}.
     */
    @Test
    public void testIsDeleted() {
        boolean deleted = false;
        TestHelper.setProperty(instance, "deleted", deleted);
        Assert.assertEquals(deleted, instance.isDeleted());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.BillingAccount#setDeleted(boolean)}
     * .
     */
    @Test
    public void testSetDeleted() {
        boolean deleted = true;
        instance.setDeleted(deleted);
        Assert.assertEquals(deleted,
                TestHelper.getProperty(instance, "deleted", Boolean.class)
                        .booleanValue());

    }

}
