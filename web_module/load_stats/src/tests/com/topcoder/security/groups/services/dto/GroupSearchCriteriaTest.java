/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services.dto;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import com.topcoder.security.groups.TestHelper;
import com.topcoder.security.groups.model.GroupPermissionType;

/**
 * <p>
 * Unit test for {@link GroupMemberSearchCriteria}
 * </p>
 * 
 * @author leo_lol
 * @version 1.0 (Topcoder Security Groups Backend Model and Authorization
 *          Assembly)
 * @since 1.0
 */
public class GroupSearchCriteriaTest {

    /**
     * <p>
     * This field represents the commonly used GroupMemberSearchCriteria
     * instance.
     * </p>
     */
    private GroupSearchCriteria instance;

    /**
     * <p>
     * Initialize the {{@link #instance} field.
     * </p>
     */
    @Before
    public void setUp() {
        instance = new GroupSearchCriteria();
    }

    /**
     * Test method for {@link GroupSearchCriteria#GroupSearchCriteria()}.
     */
    @Test
    public void testGroupSearchCriteria() {
        GroupSearchCriteria groupSearchCriteria = new GroupSearchCriteria();
        assertNotNull(groupSearchCriteria);
    }

    /**
     * Test method for {@link GroupSearchCriteria#getUserId()}.
     */
    @Test
    public void testGetUserId() {
        Long USER_ID = 1L;
        TestHelper.setProperty(instance, "userId", USER_ID);
        assertEquals(USER_ID, instance.getUserId());
    }

    /**
     * Test method for {@link GroupSearchCriteria#setUserId(Long)}.
     */
    @Test
    public void testSetUserId() {
        Long USER_ID = 1L;
        instance.setUserId(USER_ID);
        assertEquals(USER_ID,
                TestHelper.getProperty(instance, "userId", Long.class));
    }

    /**
     * Test method for {@link GroupSearchCriteria#getGroupName()}.
     */
    @Test
    public void testGetGroupName() {
        String GROUP_NAME = "name";
        TestHelper.setProperty(instance, "groupName", GROUP_NAME);
        assertEquals(GROUP_NAME, instance.getGroupName());
    }

    /**
     * Test method for {@link GroupSearchCriteria#setGroupName(String)}.
     */
    @Test
    public void testSetGroupName() {
        String GROUP_NAME = "name";
        instance.setGroupName(GROUP_NAME);
        assertEquals(GROUP_NAME,
                TestHelper.getProperty(instance, "groupName", String.class));

    }

    /**
     * Test method for {@link GroupSearchCriteria#getClientName()}.
     */
    @Test
    public void testGetClientName() {
        String CLIENT_NAME = "name";
        TestHelper.setProperty(instance, "clientName", CLIENT_NAME);
        assertEquals(CLIENT_NAME, instance.getClientName());
    }

    /**
     * Test method for {@link GroupSearchCriteria#setClientName(String)}.
     */
    @Test
    public void testSetClientName() {
        String CLIENT_NAME = "name";
        instance.setClientName(CLIENT_NAME);
        assertEquals(CLIENT_NAME,
                TestHelper.getProperty(instance, "clientName", String.class));
    }

    /**
     * Test method for {@link GroupSearchCriteria#getProjectName()}.
     */
    @Test
    public void testGetProjectName() {
        String PROJECT_NAME = "name";
        TestHelper.setProperty(instance, "projectName", PROJECT_NAME);
        assertEquals(PROJECT_NAME, instance.getProjectName());
    }

    /**
     * Test method for {@link GroupSearchCriteria#setProjectName(String)}.
     */
    @Test
    public void testSetProjectName() {
        String PROJECT_NAME = "name";
        instance.setProjectName(PROJECT_NAME);
        assertEquals(PROJECT_NAME,
                TestHelper.getProperty(instance, "projectName", String.class));

    }

    /**
     * Test method for {@link GroupSearchCriteria#getPermissions()}.
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
     * Test method for {@link GroupSearchCriteria#setPermissions(List)}.
     */
    @Test
    public void testSetPermissions() {
        List<GroupPermissionType> PERMISSIONS = new ArrayList<GroupPermissionType>();
        PERMISSIONS.add(GroupPermissionType.FULL);
        PERMISSIONS.add(GroupPermissionType.READ);
        instance.setPermissions(PERMISSIONS);
        assertEquals(PERMISSIONS, TestHelper.getProperty(instance,
                "permissions", ArrayList.class));
    }

    /**
     * Test method for {@link GroupSearchCriteria#getGroupMemberHandle()}.
     */
    @Test
    public void testGetGroupMemberHandle() {
        String GOUP_MEMBER_HANDLE = "HANDLE";
        TestHelper.setProperty(instance, "groupMemberHandle",
                GOUP_MEMBER_HANDLE);
        assertEquals(GOUP_MEMBER_HANDLE, instance.getGroupMemberHandle());
    }

    /**
     * Test method for {@link GroupSearchCriteria#setGroupMemberHandle(String)}.
     */
    @Test
    public void testSetGroupMemberHandle() {
        String GOUP_MEMBER_HANDLE = "HANDLE";
        instance.setGroupMemberHandle(GOUP_MEMBER_HANDLE);
        assertEquals(GOUP_MEMBER_HANDLE, TestHelper.getProperty(instance,
                "groupMemberHandle", String.class));
    }

    /**
     * Test method for {@link GroupSearchCriteria#getBillingAccountName()}.
     */
    @Test
    public void testGetBillingAccountName() {
        String BILLING_ACCOUNT_NAME = "name";
        TestHelper.setProperty(instance, "billingAccountName",
                BILLING_ACCOUNT_NAME);
        assertEquals(BILLING_ACCOUNT_NAME, instance.getBillingAccountName());
    }

    /**
     * Test method for {@link GroupSearchCriteria#setBillingAccountName(String)}
     * .
     */
    @Test
    public void testSetBillingAccountName() {
        String BILLING_ACCOUNT_NAME = "name";
        instance.setBillingAccountName(BILLING_ACCOUNT_NAME);
        assertEquals(BILLING_ACCOUNT_NAME, TestHelper.getProperty(instance,
                "billingAccountName", String.class));

    }

}
