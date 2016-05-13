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
 * Unit test for {@link GroupMember} class.
 * </p>
 * 
 * @author leo_lol
 * @version 1.0
 * @since 1.0
 */
public class GroupMemberTest {

    /**
     * <p>
     * Commonly used instance for unit test.
     * </p>
     */
    private GroupMember instance;

    /**
     * <p>
     * Sample data for userId.
     * </p>
     */
    private static final long USER_ID = 1L;

    /**
     * <p>
     * Sample data for useGroupDefault.
     * </p>
     */
    private static final boolean USE_GROUP_DEFAULT = false;

    /**
     * <p>
     * Sample data for specificPermission.
     * </p>
     */
    private static final GroupPermissionType SPECIFIC_PERMISSION = GroupPermissionType.FULL;

    /**
     * <p>
     * Sample data for active.
     * </p>
     */
    private static final boolean ACTIVE = true;

    /**
     * <p>
     * Sample data for activatedOn.
     * </p>
     */
    private static final Date ACTIVATED_ON = new Date();

    /**
     * <p>
     * Sample data for unassignedOn.
     * </p>
     */
    private static final Date UNASSIGNED_ON = new Date();

    /**
     * <p>
     * Sample data for group.
     * </p>
     */
    private static final Group GROUP = new Group();

    /**
     * <p>
     * Set up for unit test.
     * </p>
     */
    @Before
    public void setUp() {
        instance = new GroupMember();
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupMember#GroupMember()}.
     */
    @Test
    public void testGroupMember() {
        GroupMember groupMember = new GroupMember();
        Assert.assertNotNull(groupMember);
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupMember#getUserId()}.
     */
    @Test
    public void testGetUserId() {
        TestHelper.setProperty(instance, "userId", USER_ID);
        Assert.assertEquals(USER_ID, instance.getUserId());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupMember#setUserId(long)}.
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
     * {@link com.topcoder.security.groups.model.GroupMember#isUseGroupDefault()}
     * .
     */
    @Test
    public void testIsUseGroupDefault() {
        TestHelper.setProperty(instance, "useGroupDefault", USE_GROUP_DEFAULT);
        Assert.assertEquals(USE_GROUP_DEFAULT, instance.isUseGroupDefault());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupMember#setUseGroupDefault(boolean)}
     * .
     */
    @Test
    public void testSetUseGroupDefault() {
        instance.setUseGroupDefault(USE_GROUP_DEFAULT);
        Assert.assertEquals(
                USE_GROUP_DEFAULT,
                TestHelper.getProperty(instance, "useGroupDefault",
                        Boolean.class).booleanValue());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupMember#getSpecificPermission()}
     * .
     */
    @Test
    public void testGetSpecificPermission() {
        TestHelper.setProperty(instance, "specificPermission",
                SPECIFIC_PERMISSION);
        Assert.assertEquals(SPECIFIC_PERMISSION,
                instance.getSpecificPermission());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupMember#setSpecificPermission(com.topcoder.security.groups.model.GroupPermissionType)}
     * .
     */
    @Test
    public void testSetSpecificPermission() {
        instance.setSpecificPermission(SPECIFIC_PERMISSION);
        Assert.assertEquals(SPECIFIC_PERMISSION, TestHelper.getProperty(
                instance, "specificPermission", GroupPermissionType.class));
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupMember#isActive()}.
     */
    @Test
    public void testIsActive() {
        TestHelper.setProperty(instance, "active", ACTIVE);
        Assert.assertEquals(ACTIVE, instance.getActive());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupMember#setActive(boolean)}
     * .
     */
    @Test
    public void testSetActive() {
        instance.setActive(ACTIVE);
        Assert.assertEquals(ACTIVE,
                TestHelper.getProperty(instance, "active", Boolean.class)
                        .booleanValue());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupMember#getActivatedOn()}.
     */
    @Test
    public void testGetActivatedOn() {
        TestHelper.setProperty(instance, "activatedOn", ACTIVATED_ON);
        Assert.assertEquals(ACTIVATED_ON, instance.getActivatedOn());

    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupMember#setActivatedOn(java.util.Date)}
     * .
     */
    @Test
    public void testSetActivatedOn() {
        instance.setActivatedOn(ACTIVATED_ON);
        Assert.assertEquals(ACTIVATED_ON,
                TestHelper.getProperty(instance, "activatedOn", Date.class));

    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupMember#getUnassignedOn()}.
     */
    @Test
    public void testGetUnassignedOn() {
        TestHelper.setProperty(instance, "unassignedOn", UNASSIGNED_ON);
        Assert.assertEquals(UNASSIGNED_ON, instance.getUnassignedOn());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupMember#setUnassignedOn(java.util.Date)}
     * .
     */
    @Test
    public void testSetUnassignedOn() {
        instance.setUnassignedOn(UNASSIGNED_ON);
        Assert.assertEquals(UNASSIGNED_ON,
                TestHelper.getProperty(instance, "unassignedOn", Date.class));
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupMember#getGroup()}.
     */
    @Test
    public void testGetGroup() {
        TestHelper.setProperty(instance, "group", GROUP);
        Assert.assertEquals(GROUP, instance.getGroup());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupMember#setGroup(com.topcoder.security.groups.model.Group)}
     * .
     */
    @Test
    public void testSetGroup() {
        instance.setGroup(GROUP);
        Assert.assertEquals(GROUP,
                TestHelper.getProperty(instance, "group", Group.class));
    }

}
