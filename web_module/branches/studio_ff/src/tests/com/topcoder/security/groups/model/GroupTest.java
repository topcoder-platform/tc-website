/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import com.topcoder.security.groups.TestHelper;

/**
 * <p>
 * Unit test for {@link Group}
 * </p>
 * 
 * @author leo_lol
 * @version 1.0
 * @since 1.0
 */
public class GroupTest {

    /**
     * <p>
     * Commonly used instance for unit test.
     * </p>
     */
    private Group instance;

    /**
     * <p>
     * Sample data for name.
     * </p>
     */
    private static final String NAME = "name";

    /**
     * <p>
     * Sample data for client.
     * </p>
     */
    private static final Client CLIENT = new Client();

    /**
     * <p>
     * Sample data for defaultPermissions.
     * </p>
     */
    private static final GroupPermissionType DEFAULT_PERMISSION = GroupPermissionType.FULL;

    /**
     * <p>
     * Sample data for billingAccounts.
     * </p>
     */
    private static final List<BillingAccount> BILLING_ACCOUNTS = new ArrayList<BillingAccount>();

    /**
     * <p>
     * Sample data for directProjects.
     * </p>
     */
    private static final List<DirectProject> DIRECT_PROJECTS = new ArrayList<DirectProject>();

    /**
     * <p>
     * Sample data for groupMembers.
     * </p>
     */
    private static final List<GroupMember> GROUP_MEMBERS = new ArrayList<GroupMember>();

    /**
     * <p>
     * Sample data for restrictions.
     * </p>
     */
    private static final List<ResourceType> RESTRICTIONS = new ArrayList<ResourceType>();

    /**
     * <p>
     * Sample data for archived.
     * </p>
     */
    private static final boolean ARCHIVED = false;

    /**
     * <p>
     * Sample data for archivedOn.
     * </p>
     */
    private static final Date ARCHIVED_ON = new Date();

    /**
     * <p>
     * Sample data for effectiveGroup.
     * </p>
     */
    private static final Group EFFECTIVE_GROUP = new Group();

    /**
     * <p>
     * Set up for unit test.
     * </p>
     * 
     * @throws java.lang.Exception
     */
    @Before
    public void setUp() throws Exception {
        instance = new Group();
    }

    /**
     * Test method for {@link com.topcoder.security.groups.model.Group#Group()}.
     */
    @Test
    public void testGroup() {
        Group group = new Group();
        Assert.assertNotNull(group);
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.Group#getName()}.
     */
    @Test
    public void testGetName() {
        TestHelper.setProperty(instance, "name", NAME);
        Assert.assertEquals(NAME, instance.getName());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.Group#setName(java.lang.String)}
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
     * {@link com.topcoder.security.groups.model.Group#getClient()}.
     */
    @Test
    public void testGetClient() {
        TestHelper.setProperty(instance, "client", CLIENT);
        Assert.assertEquals(CLIENT, instance.getClient());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.Group#setClient(com.topcoder.security.groups.model.Client)}
     * .
     */
    @Test
    public void testSetClient() {
        instance.setClient(CLIENT);
        Assert.assertEquals(CLIENT,
                TestHelper.getProperty(instance, "client", Client.class));
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.Group#getDefaultPermission()}.
     */
    @Test
    public void testGetDefaultPermission() {
        TestHelper.setProperty(instance, "defaultPermission",
                DEFAULT_PERMISSION);
        Assert.assertEquals(DEFAULT_PERMISSION, instance.getDefaultPermission());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.Group#setDefaultPermission(com.topcoder.security.groups.model.GroupPermissionType)}
     * .
     */
    @Test
    public void testSetDefaultPermission() {
        instance.setDefaultPermission(DEFAULT_PERMISSION);
        Assert.assertEquals(DEFAULT_PERMISSION, TestHelper.getProperty(
                instance, "defaultPermission", Set.class));
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.Group#getBillingAccounts()}.
     */
    @Test
    public void testGetBillingAccounts() {
        TestHelper.setProperty(instance, "billingAccounts", BILLING_ACCOUNTS);
        Assert.assertEquals(BILLING_ACCOUNTS, instance.getBillingAccounts());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.Group#setBillingAccounts(java.util.List)}
     * .
     */
    @Test
    public void testSetBillingAccounts() {
        instance.setBillingAccounts(BILLING_ACCOUNTS);
        Assert.assertEquals(BILLING_ACCOUNTS,
                TestHelper.getProperty(instance, "billingAccounts", Set.class));
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.Group#getDirectProjects()}.
     */
    @Test
    public void testGetDirectProjects() {
        TestHelper.setProperty(instance, "directProjects", DIRECT_PROJECTS);
        Assert.assertEquals(DIRECT_PROJECTS, instance.getDirectProjects());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.Group#setDirectProjects(java.util.List)}
     * .
     */
    @Test
    public void testSetDirectProjects() {
        instance.setDirectProjects(DIRECT_PROJECTS);
        Assert.assertEquals(DIRECT_PROJECTS,
                TestHelper.getProperty(instance, "directProjects", Set.class));
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.Group#getGroupMembers()}.
     */
    @Test
    public void testGetGroupMembers() {
        TestHelper.setProperty(instance, "groupMembers", GROUP_MEMBERS);
        Assert.assertEquals(GROUP_MEMBERS, instance.getGroupMembers());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.Group#setGroupMembers(java.util.List)}
     * .
     */
    @Test
    public void testSetGroupMembers() {
        instance.setGroupMembers(GROUP_MEMBERS);
        Assert.assertEquals(GROUP_MEMBERS,
                TestHelper.getProperty(instance, "groupMembers", Set.class));
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.Group#getRestrictions()}.
     */
    @Test
    public void testGetRestrictions() {
        TestHelper.setProperty(instance, "restrictions", RESTRICTIONS);
        Assert.assertEquals(RESTRICTIONS, instance.getRestrictions());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.Group#setRestrictions(java.util.List)}
     * .
     */
    @Test
    public void testSetRestrictions() {
        instance.setRestrictions(RESTRICTIONS);
        Assert.assertEquals(RESTRICTIONS,
                TestHelper.getProperty(instance, "restrictions", Set.class));
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.Group#isArchived()}.
     */
    @Test
    public void testIsArchived() {
        TestHelper.setProperty(instance, "archived", ARCHIVED);
        Assert.assertEquals(ARCHIVED, instance.getArchived());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.Group#setArchived(boolean)}.
     */
    @Test
    public void testSetArchived() {
        instance.setArchived(ARCHIVED);
        Assert.assertEquals(ARCHIVED,
                TestHelper.getProperty(instance, "archived", Boolean.class)
                        .booleanValue());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.Group#getArchivedOn()}.
     */
    @Test
    public void testGetArchivedOn() {
        TestHelper.setProperty(instance, "archivedOn", ARCHIVED_ON);
        Assert.assertEquals(ARCHIVED_ON, instance.getArchivedOn());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.Group#setArchivedOn(java.util.Date)}
     * .
     */
    @Test
    public void testSetArchivedOn() {
        instance.setArchivedOn(ARCHIVED_ON);
        Assert.assertEquals(ARCHIVED_ON,
                TestHelper.getProperty(instance, "archivedOn", Date.class));
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.Group#getEffectiveGroup()}.
     */
    @Test
    public void testGetEffectiveGroup() {
        TestHelper.setProperty(instance, "effectiveGroup", EFFECTIVE_GROUP);
        Assert.assertEquals(EFFECTIVE_GROUP, instance.getEffectiveGroup());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.Group#setEffectiveGroup(com.topcoder.security.groups.model.Group)}
     * .
     */
    @Test
    public void testSetEffectiveGroup() {
        instance.setEffectiveGroup(EFFECTIVE_GROUP);
        Assert.assertEquals(EFFECTIVE_GROUP,
                TestHelper.getProperty(instance, "effectiveGroup", Group.class));
    }

}
