/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.model;

import com.topcoder.security.groups.TestHelper;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import java.util.Date;

/**
 * <p>
 * Unit test for {@link GroupAuditRecord} class.
 * </p>
 * 
 * @author leo_lol
 * @version 1.0
 * @since 1.0
 */
public class GroupAuditRecordTest {

    /**
     * <p>
     * Commonly used instance for unit test.
     * </p>
     */
    private GroupAuditRecord instance;

    /**
     * <p>
     * Sample data for date.
     * </p>
     */
    private static final Date DATE = new Date();

    /**
     * <p>
     * Sample data for handle.
     * </p>
     */
    private static final String HANDLE = "handle";

    /**
     * <p>
     * Sample data for ipAddress.
     * </p>
     */
    private static final String IP_ADDRESS = "127.0.0.1";

    /**
     * <p>
     * Sample data for previousValue.
     * </p>
     */
    private static final String PREVIOUS_VALUE = "old data";

    /**
     * <p>
     * Sample data for newValue.
     * </p>
     */
    private static final String NEW_VALUE = "new data";

    /**
     * <p>
     * Set up unit test.
     * </p>
     * 
     * @throws java.lang.Exception
     */
    @Before
    public void setUp() throws Exception {
        instance = new GroupAuditRecord();
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupAuditRecord#GroupAuditRecord()}
     * .
     */
    @Test
    public void testGroupAuditRecord() {
        GroupAuditRecord groupAuditRecord = new GroupAuditRecord();
        Assert.assertNotNull(groupAuditRecord);
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupAuditRecord#getDate()}.
     */
    @Test
    public void testGetDate() {
        TestHelper.setProperty(instance, "date", DATE);
        Assert.assertEquals(DATE, instance.getDate());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupAuditRecord#setDate(java.util.Date)}
     * .
     */
    @Test
    public void testSetDate() {
        instance.setDate(DATE);
        Assert.assertEquals(DATE,
                TestHelper.getProperty(instance, "date", Date.class));
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupAuditRecord#getHandle()}.
     */
    @Test
    public void testGetHandle() {
        TestHelper.setProperty(instance, "handle", HANDLE);
        Assert.assertEquals(HANDLE, instance.getHandle());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupAuditRecord#setHandle(java.lang.String)}
     * .
     */
    @Test
    public void testSetHandle() {
        instance.setHandle(HANDLE);
        Assert.assertEquals(HANDLE,
                TestHelper.getProperty(instance, "handle", String.class));
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupAuditRecord#getIpAddress()}
     * .
     */
    @Test
    public void testGetIpAddress() {
        TestHelper.setProperty(instance, "ipAddress", IP_ADDRESS);
        Assert.assertEquals(IP_ADDRESS, instance.getIpAddress());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupAuditRecord#setIpAddress(java.lang.String)}
     * .
     */
    @Test
    public void testSetIpAddress() {
        instance.setIpAddress(IP_ADDRESS);
        Assert.assertEquals(IP_ADDRESS,
                TestHelper.getProperty(instance, "ipAddress", String.class));
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupAuditRecord#getPreviousValue()}
     * .
     */
    @Test
    public void testGetPreviousValue() {
        TestHelper.setProperty(instance, "previousValue", PREVIOUS_VALUE);
        Assert.assertEquals(PREVIOUS_VALUE, instance.getPreviousValue());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupAuditRecord#setPreviousValue(java.lang.String)}
     * .
     */
    @Test
    public void testSetPreviousValue() {
        instance.setPreviousValue(PREVIOUS_VALUE);
        Assert.assertEquals(PREVIOUS_VALUE,
                TestHelper.getProperty(instance, "previousValue", String.class));
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupAuditRecord#getNewValue()}
     * .
     */
    @Test
    public void testGetNewValue() {
        TestHelper.setProperty(instance, "newValue", NEW_VALUE);
        Assert.assertEquals(NEW_VALUE, instance.getNewValue());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupAuditRecord#setNewValue(java.lang.String)}
     * .
     */
    @Test
    public void testSetNewValue() {
        instance.setNewValue(NEW_VALUE);
        Assert.assertEquals(NEW_VALUE,
                TestHelper.getProperty(instance, "newValue", String.class));
    }

}
