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
 * Unit test for {@link CustomerAdministrator}
 * </p>
 * 
 * @author leo_lol
 * @version 1.0
 * @since 1.0
 */
public class CustomerAdministratorTest {

    /**
     * <p>
     * Commonly used CustomAdministrator instance for unit test.
     * </p>
     */
    private CustomerAdministrator instance;

    /**
     * <p>
     * Sample data for userId;
     * </p>
     */
    private static final long USER_ID = 1L;

    /**
     * <p>
     * Sample Client.
     * </p>
     */
    private static final Client CIENT = new Client();

    /**
     * <p>
     * Set up for unit test.
     * </p>
     * 
     * @throws java.lang.Exception
     */
    @Before
    public void setUp() throws Exception {
        instance = new CustomerAdministrator();
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.CustomerAdministrator#CustomerAdministrator()}
     * .
     */
    @Test
    public void testCustomerAdministrator() {
        CustomerAdministrator customerAdministrator = new CustomerAdministrator();
        Assert.assertNotNull(customerAdministrator);
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.CustomerAdministrator#getUserId()}
     * .
     */
    @Test
    public void testGetUserId() {
        TestHelper.setProperty(instance, "userId", USER_ID);
        Assert.assertEquals(USER_ID, instance.getUserId());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.CustomerAdministrator#setUserId(long)}
     * .
     */
    @Test
    public void testSetUserId() {
        instance.setUserId(USER_ID);
        Assert.assertEquals(USER_ID,
                TestHelper.getProperty(instance, "userId", Long.class)
                        .longValue());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.CustomerAdministrator#getClient()}
     * .
     */
    @Test
    public void testGetClient() {
        TestHelper.setProperty(instance, "client", CIENT);
        Assert.assertEquals(CIENT, instance.getClient());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.CustomerAdministrator#setClient(com.topcoder.security.groups.model.Client)}
     * .
     */
    @Test
    public void testSetClient() {
        instance.setClient(CIENT);
        Assert.assertEquals(CIENT,
                TestHelper.getProperty(instance, "client", Client.class));
    }

}
