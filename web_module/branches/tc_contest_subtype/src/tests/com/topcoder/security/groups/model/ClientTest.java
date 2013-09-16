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
 * Unit test for {@link Client}
 * </p>
 * 
 * @author leo_lol
 * @version 1.0
 * @since 1.0
 */
public class ClientTest {

    /**
     * <p>
     * This field represents the commonly used Client instance.
     * </p>
     */
    private Client instance;

    /**
     * <p>
     * Sample name value.
     * </p>
     */
    private static final String NAME = "name";

    /**
     * <p>
     * Sample companyId value.
     * </p>
     */
    private static final long COMPANY_ID = 1L;

    /**
     * <p>
     * Sample deleted value.
     * </p>
     */
    private static final boolean DELETED = false;

    /**
     * <p>
     * Set up for unit test.
     * </p>
     */
    @Before
    public void setUp() {
        instance = new Client();
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.Client#Client()}.
     */
    @Test
    public void testClient() {
        Client client = new Client();
        Assert.assertNotNull(client);
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.Client#getName()}.
     */
    @Test
    public void testGetName() {
        TestHelper.setProperty(instance, "name", NAME);
        Assert.assertEquals(NAME, instance.getName());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.Client#setName(java.lang.String)}
     * .
     */
    @Test
    public void testSetName() {
        instance.setName(NAME);
        Assert.assertEquals(NAME,
                TestHelper.getProperty(instance, "name", String.class));
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.Client#getCompanyId()}.
     */
    @Test
    public void testGetCompanyId() {
        TestHelper.setProperty(instance, "companyId", COMPANY_ID);
        Assert.assertEquals(COMPANY_ID, instance.getCompanyId());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.Client#setCompanyId(long)}.
     */
    @Test
    public void testSetCompanyId() {
        instance.setCompanyId(COMPANY_ID);
        Assert.assertEquals(COMPANY_ID,
                TestHelper.getProperty(instance, "companyId", Long.class)
                        .longValue());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.Client#isDeleted()}.
     */
    @Test
    public void testIsDeleted() {
        TestHelper.setProperty(instance, "deleted", DELETED);
        Assert.assertEquals(DELETED, instance.isDeleted());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.Client#setDeleted(boolean)}.
     */
    @Test
    public void testSetDeleted() {
        instance.setDeleted(DELETED);
        Assert.assertEquals(DELETED,
                TestHelper.getProperty(instance, "deleted", Boolean.class)
                        .booleanValue());
    }

}
