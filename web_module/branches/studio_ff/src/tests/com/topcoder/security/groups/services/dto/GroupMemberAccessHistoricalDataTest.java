/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services.dto;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import com.topcoder.security.groups.TestHelper;
import com.topcoder.security.groups.model.BillingAccount;
import com.topcoder.security.groups.model.GroupPermissionType;
import com.topcoder.security.groups.model.ResourceType;

/**
 * <p>
 * Unit test for {@link GroupMemberAccessHistoricalData}
 * </p>
 * 
 * @author leo_lol
 * @version 1.0 (Topcoder Security Groups Backend Model and Authorization
 *          Assembly)
 * @since 1.0
 */
public class GroupMemberAccessHistoricalDataTest {

    /**
     * <p>
     * This field represents the commonly used GroupMemberAccessHistoricalData
     * instance.
     * </p>
     */
    private GroupMemberAccessHistoricalData instance;

    /**
     * <p>
     * Initialize the {{@link #instance} field.
     * </p>
     */
    @Before
    public void setUp() {
        instance = new GroupMemberAccessHistoricalData();
    }

    /**
     * Test method for
     * {@link GroupMemberAccessHistoricalData#GroupMemberAccessHistoricalData()}
     * .
     */
    @Test
    public void testGroupMemberAccessHistoricalData() {
        GroupMemberAccessHistoricalData groupMemberAccessHistoricalData = new GroupMemberAccessHistoricalData();
        assertNotNull(groupMemberAccessHistoricalData);
    }

    /**
     * Test method for {@link GroupMemberAccessHistoricalData#getGroupId()}.
     */
    @Test
    public void testGetGroupId() {
        long GROUP_ID = 1L;
        TestHelper.setProperty(instance, "groupId", GROUP_ID);
        assertEquals(GROUP_ID, instance.getGroupId());
    }

    /**
     * Test method for {@link GroupMemberAccessHistoricalData#setGroupId(long)}.
     */
    @Test
    public void testSetGroupId() {
        Long GROUP_ID = 1L;
        instance.setGroupId(GROUP_ID);
        assertEquals(GROUP_ID,
                TestHelper.getProperty(instance, "groupId", Long.class));
    }

    /**
     * Test method for {@link GroupMemberAccessHistoricalData#getPermissions()}.
     */
    @Test
    public void testGetPermission() {
        TestHelper
                .setProperty(instance, "permission", GroupPermissionType.FULL);
        assertEquals(GroupPermissionType.FULL, instance.getPermission());
    }

    /**
     * Test method for
     * {@link GroupMemberAccessHistoricalData#setPermissions(GroupPermissionType)}
     * .
     */
    @Test
    public void testSetPermission() {
        instance.setPermission(GroupPermissionType.FULL);
        assertEquals(GroupPermissionType.FULL, TestHelper.getProperty(instance,
                "permission", GroupPermissionType.class));
    }

    /**
     * Test method for
     * {@link GroupMemberAccessHistoricalData#getBillingAccounts()}.
     */
    @Test
    public void testGetBillingAccounts() {
        List<BillingAccount> BILLING_ACCOUNTS = new ArrayList<BillingAccount>();
        BILLING_ACCOUNTS.add(new BillingAccount());
        TestHelper.setProperty(instance, "billingAccounts", BILLING_ACCOUNTS);
        assertEquals(BILLING_ACCOUNTS, instance.getBillingAccounts());
    }

    /**
     * Test method for
     * {@link GroupMemberAccessHistoricalData#setBillingAccounts(List)}.
     */
    @Test
    public void testSetBillingAccounts() {
        List<BillingAccount> BILLING_ACCOUNTS = new ArrayList<BillingAccount>();
        BILLING_ACCOUNTS.add(new BillingAccount());
        instance.setBillingAccounts(BILLING_ACCOUNTS);
        assertEquals(BILLING_ACCOUNTS, TestHelper.getProperty(instance,
                "billingAccounts", ArrayList.class));

    }

    /**
     * Test method for
     * {@link GroupMemberAccessHistoricalData#getDirectProjectIds()}.
     */
    @Test
    public void testGetDirectProjectIds() {
        List<Long> DIRECT_PROJECT_IDS = new ArrayList<Long>();
        DIRECT_PROJECT_IDS.add(1L);
        DIRECT_PROJECT_IDS.add(2L);

        TestHelper
                .setProperty(instance, "directProjectIds", DIRECT_PROJECT_IDS);
        assertEquals(DIRECT_PROJECT_IDS, instance.getDirectProjectIds());

    }

    /**
     * Test method for
     * {@link GroupMemberAccessHistoricalData#setDirectProjectIds(List)}.
     */
    @Test
    public void testSetDirectProjectIds() {
        List<Long> DIRECT_PROJECT_IDS = new ArrayList<Long>();
        DIRECT_PROJECT_IDS.add(1L);
        DIRECT_PROJECT_IDS.add(2L);

        instance.setDirectProjectIds(DIRECT_PROJECT_IDS);

        assertEquals(DIRECT_PROJECT_IDS, TestHelper.getProperty(instance,
                "directProjectIds", ArrayList.class));

    }

    /**
     * Test method for {@link GroupMemberAccessHistoricalData#getRestrictions()}
     * .
     */
    @Test
    public void testGetRestrictions() {
        List<ResourceType> RESTRICTIONS = new ArrayList<ResourceType>();
        RESTRICTIONS.add(ResourceType.PROJECT);
        TestHelper.setProperty(instance, "restrictions", RESTRICTIONS);
        assertEquals(RESTRICTIONS, instance.getRestrictions());
    }

    /**
     * Test method for
     * {@link GroupMemberAccessHistoricalData#setRestrictions(List)}.
     */
    @Test
    public void testSetRestrictions() {
        List<ResourceType> RESTRICTIONS = new ArrayList<ResourceType>();
        RESTRICTIONS.add(ResourceType.PROJECT);
        instance.setRestrictions(RESTRICTIONS);
        assertEquals(RESTRICTIONS, TestHelper.getProperty(instance,
                "restrictions", ArrayList.class));
    }

    /**
     * Test method for {@link GroupMemberAccessHistoricalData#getFrom()}.
     */
    @Test
    public void testGetFrom() {
        Date FROM = new Date();
        TestHelper.setProperty(instance, "from", FROM);
        assertEquals(FROM, instance.getFrom());
    }

    /**
     * Test method for {@link GroupMemberAccessHistoricalData#setFrom(Date)}.
     */
    @Test
    public void testSetFrom() {
        Date FROM = new Date();
        instance.setFrom(FROM);
        assertEquals(FROM, TestHelper.getProperty(instance, "from", Date.class));
    }

    /**
     * Test method for {@link GroupMemberAccessHistoricalData#getTo()}.
     */
    @Test
    public void testGetTo() {
        Date TO = new Date();
        TestHelper.setProperty(instance, "to", TO);
        assertEquals(TO, instance.getTo());
    }

    /**
     * Test method for {@link GroupMemberAccessHistoricalData#setTo(Date)}.
     */
    @Test
    public void testSetTo() {
        Date TO = new Date();
        instance.setTo(TO);
        assertEquals(TO, TestHelper.getProperty(instance, "to", Date.class));
    }

}
