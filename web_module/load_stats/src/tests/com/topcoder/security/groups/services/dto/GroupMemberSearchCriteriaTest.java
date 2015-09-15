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
import com.topcoder.security.groups.model.GroupPermissionType;

/**
 * <p>
 *  Unit test for {@link GroupMemberSearchCriteria}
 * </p>
 * @author leo_lol
 * @version 1.0 (Topcoder Security Groups Backend Model and Authorization
 *          Assembly)
 * @since 1.0
 */
public class GroupMemberSearchCriteriaTest {
    
    /**
     * <p>
     * This field represents the commonly used GroupMemberSearchCriteria instance.
     * </p>
     */
    private GroupMemberSearchCriteria  instance;
    
    /**
     * <p>
     * Initialize the {{@link #instance} field.
     * </p>
     */
    @Before
    public void setUp() {
        instance = new GroupMemberSearchCriteria();
    }

    /**
     * Test method for {@link GroupMemberSearchCriteria#GroupMemberSearchCriteria()}.
     */
    @Test
    public void testGroupMemberSearchCriteria() {
        GroupMemberSearchCriteria groupMemberSearchCriteria = new GroupMemberSearchCriteria();
        assertNotNull(groupMemberSearchCriteria);
    }

    /**
     * Test method for {@link GroupMemberSearchCriteria#getUserId()}.
     */
    @Test
    public void testGetUserId() {
        Long USER_ID = 1L;
        TestHelper.setProperty(instance, "userId", USER_ID);
        assertEquals(USER_ID, instance.getUserId());
    }

    /**
     * Test method for {@link GroupMemberSearchCriteria#setUserId(Long)}.
     */
    @Test
    public void testSetUserId() {
        Long USER_ID = 1L;
        instance.setUserId(USER_ID);
        assertEquals(USER_ID, instance.getUserId());
    }

    /**
     * Test method for {@link GroupMemberSearchCriteria#getGroupName()}.
     */
    @Test
    public void testGetGroupName() {
        String GROUP_NAME = "name";
        TestHelper.setProperty(instance, "groupName", GROUP_NAME);
        assertEquals(GROUP_NAME, instance.getGroupName());
    }

    /**
     * Test method for {@link GroupMemberSearchCriteria#setGroupName(String)}.
     */
    @Test
    public void testSetGroupName() {
        String GROUP_NAME = "name";
        instance.setGroupName(GROUP_NAME);
        assertEquals(GROUP_NAME, TestHelper.getProperty(instance, "groupName", String.class));
    }

    /**
     * Test method for {@link GroupMemberSearchCriteria#getClientName()}.
     */
    @Test
    public void testGetClientName() {
        String CLIENT_NAME = "name";
        TestHelper.setProperty(instance, "clientName", CLIENT_NAME);
        assertEquals(CLIENT_NAME, instance.getClientName());
    }

    /**
     * Test method for {@link GroupMemberSearchCriteria#setClientName(String)}.
     */
    @Test
    public void testSetClientName() {
        String CLIENT_NAME = "name";
        instance.setClientName(CLIENT_NAME);
        assertEquals(CLIENT_NAME, TestHelper.getProperty(instance, "clientName", String.class));
    }

    /**
     * Test method for {@link GroupMemberSearchCriteria#getProjectName()}.
     */
    @Test
    public void testGetProjectName() {
        String PROJECT_NAME = "name";
        TestHelper.setProperty(instance, "projectName", PROJECT_NAME);
        assertEquals(PROJECT_NAME, instance.getProjectName());
    }

    /**
     * Test method for {@link GroupMemberSearchCriteria#setProjectName(String)}.
     */
    @Test
    public void testSetProjectName() {
        String PROJECT_NAME = "name";
        instance.setProjectName(PROJECT_NAME);
        assertEquals(PROJECT_NAME, TestHelper.getProperty(instance, "projectName", String.class));
    }

    /**
     * Test method for {@link GroupMemberSearchCriteria#getBillingAccountName()}.
     */
    @Test
    public void testGetBillingAccountName() {
        String BILLING_ACCOUNT_NAME = "name";
        TestHelper.setProperty(instance, "billingAccountName", BILLING_ACCOUNT_NAME);
        assertEquals(BILLING_ACCOUNT_NAME, instance.getBillingAccountName());
    }

    /**
     * Test method for {@link GroupMemberSearchCriteria#setBillingAccountName(String)}.
     */
    @Test
    public void testSetBillingAccountName() {
        String BILLING_ACCOUNT_NAME = "name";
        instance.setBillingAccountName(BILLING_ACCOUNT_NAME);
        assertEquals(BILLING_ACCOUNT_NAME, TestHelper.getProperty(instance, "billingAccountName", String.class));
    }

    /**
     * Test method for {@link GroupMemberSearchCriteria#getMemberHandle()}.
     */
    @Test
    public void testGetMemberHandle() {
        String MEMBER_HANDLE = "HANDLE";
        TestHelper.setProperty(instance, "memberHandle", MEMBER_HANDLE);
        assertEquals(MEMBER_HANDLE, instance.getMemberHandle());
    }

    /**
     * Test method for {@link GroupMemberSearchCriteria#setMemberHandle(String)}.
     */
    @Test
    public void testSetMemberHandle() {
        String MEMBER_HANDLE = "HANDLE";
        instance.setMemberHandle(MEMBER_HANDLE);
        assertEquals(MEMBER_HANDLE, TestHelper.getProperty(instance, "memberHandle", String.class));
    }

    /**
     * Test method for {@link GroupMemberSearchCriteria#getPermissions()}.
     */
    @Test
    public void testGetPermissions() {
        List<GroupPermissionType> PERMISSIONS = new ArrayList<GroupPermissionType>();
        PERMISSIONS.add(GroupPermissionType.FULL);
        PERMISSIONS.add(GroupPermissionType.READ);
        TestHelper.setProperty(instance, "permissions", PERMISSIONS);
        assertEquals(PERMISSIONS, instance.getPermissions());
    }

    /**
     * Test method for {@link GroupMemberSearchCriteria#setPermissions(List)}.
     */
    @Test
    public void testSetPermissions() {
        List<GroupPermissionType> PERMISSIONS = new ArrayList<GroupPermissionType>();
        PERMISSIONS.add(GroupPermissionType.FULL);
        PERMISSIONS.add(GroupPermissionType.READ);
        instance.setPermissions(PERMISSIONS);
        assertEquals(PERMISSIONS, TestHelper.getProperty(instance, "permissions", ArrayList.class));
    }

    /**
     * Test method for {@link GroupMemberSearchCriteria#getHadAccessFrom()}.
     */
    @Test
    public void testGetHadAccessFrom() {
        Date HAD_ACCESS_FROM = new Date();
        TestHelper.setProperty(instance, "hadAccessFrom", HAD_ACCESS_FROM);
        assertEquals(HAD_ACCESS_FROM, instance.getHadAccessFrom());
    }

    /**
     * Test method for {@link GroupMemberSearchCriteria#setHadAccessFrom(Date)}.
     */
    @Test
    public void testSetHadAccessFrom() {
        Date HAD_ACCESS_FROM = new Date();
        instance.setHadAccessFrom(HAD_ACCESS_FROM);
        assertEquals(HAD_ACCESS_FROM, TestHelper.getProperty(instance, "hadAccessFrom", Date.class));
    }

    /**
     * Test method for {@link GroupMemberSearchCriteria#getHadAccessTill()}.
     */
    @Test
    public void testGetHadAccessTill() {
        Date HAD_ACCESS_TILL = new Date();
        TestHelper.setProperty(instance, "hadAccessTill", HAD_ACCESS_TILL);
        assertEquals(HAD_ACCESS_TILL, instance.getHadAccessTill());
    }

    /**
     * Test method for {@link GroupMemberSearchCriteria#setHadAccessTill(Date)}.
     */
    @Test
    public void testSetHadAccessTill() {
        Date HAD_ACCESS_TILL = new Date();
        instance.setHadAccessTill(HAD_ACCESS_TILL);
        assertEquals(HAD_ACCESS_TILL, TestHelper.getProperty(instance, "hadAccessTill", Date.class));

    }

}
