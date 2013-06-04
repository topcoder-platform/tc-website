/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services.hibernate;

import static org.junit.Assert.*;
import java.util.List;
import javax.annotation.Resource;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.topcoder.security.groups.model.GroupPermissionType;
import com.topcoder.security.groups.model.ResourceType;
import com.topcoder.security.groups.services.AuthorizationService;
import com.topcoder.security.groups.services.SecurityGroupException;
import com.topcoder.security.groups.services.hibernate.HibernateAuthorizationService;

/**
 * <p>
 * Unit test for {@link HibernateAuthorizationService}
 * </p>
 * 
 * @author leo_lol
 * @version 1.0
 * @since 1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/securityGroupsApplicationContext.xml")
public class HibernateAuthorizationServiceTest {

    /**
     * <p>
     * Instance of {@link HibernateAuthorizationService}.
     * </p>
     */
    private AuthorizationService authorizationService;

    /**
     * <p>
     * Test method for {@link HibernateAuthorizationService#checkAuthorization(long, long, ResourceType)}.
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>userId1 has full permission of project 1.</li>
     * <li>userId2 has read permission of project 2.</li>
     * <li>userId3 has write permission of project 3.</li>
     * <li>userId1 has full permission of billingAccount1.</li>
     * <li>userId2 has read permission of billingAccount2.</li>
     * <li>userId3 has write permission of billingAccount3.</li>
     * <li>Cross permission does not exist, meaning userId(I) do not has any permission to directProject(J) given I !=
     * J. It's also true for billingAccount(J) when I != J.</li>
     * <li>non_existing_user_id does not exist.</li>
     * </ol>
     * </p>
     */
    @Test
    public void testCheckAuthorization() {
        long userId1 = 132456L;
        long userId2 = 132457L;
        long userId3 = 124776;
        long non_existing_user_id = 11111321L;

        long directProjectId1 = 1L;
        long directProjectId2 = 2L;
        long directProjectId3 = 3L;

        long billingAccountId1 = 1L;
        long billingAccountId2 = 2L;
        long billingAccountId3 = 3L;

        try {
            //direct projects.
            assertTrue(GroupPermissionType.FULL == authorizationService.checkAuthorization(userId1, directProjectId1,
                    ResourceType.PROJECT));
            assertTrue(GroupPermissionType.READ == authorizationService.checkAuthorization(userId2, directProjectId2,
                    ResourceType.PROJECT));
            assertTrue(GroupPermissionType.WRITE == authorizationService.checkAuthorization(userId3, directProjectId3,
                    ResourceType.PROJECT));
            assertTrue(null == authorizationService.checkAuthorization(userId1, directProjectId2, ResourceType.PROJECT));
            assertTrue(null == authorizationService.checkAuthorization(non_existing_user_id, directProjectId2,
                    ResourceType.PROJECT));

            //billing account
            assertTrue(GroupPermissionType.FULL == authorizationService.checkAuthorization(userId1, billingAccountId1,
                    ResourceType.BILLING_ACCOUNT));
            assertTrue(GroupPermissionType.READ == authorizationService.checkAuthorization(userId2, billingAccountId2,
                    ResourceType.BILLING_ACCOUNT));
            assertTrue(GroupPermissionType.WRITE == authorizationService.checkAuthorization(userId3, billingAccountId3,
                    ResourceType.BILLING_ACCOUNT));
            assertTrue(null == authorizationService.checkAuthorization(userId2, billingAccountId1,
                    ResourceType.BILLING_ACCOUNT));
            assertTrue(null == authorizationService.checkAuthorization(non_existing_user_id, billingAccountId3,
                    ResourceType.BILLING_ACCOUNT));

        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }

    }

    /**
     * <p>
     * Test method for {@link HibernateAuthorizationService#isCustomerAdministrator(long, long)} . This test case tests
     * the scenario when heffan is the customer administrator.
     * </p>
     */
    @Test
    public void testIsCustomerAdministrator() {
        long userId1 = 132456;// heffan

        long clientId1 = 1;

        try {
            boolean result = authorizationService.isCustomerAdministrator(userId1, clientId1);
            assertTrue(result);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for {@link HibernateAuthorizationService#isCustomerAdministrator(long, long)} . This test case tests
     * the scenario when user is not the customer administrator.
     * </p>
     */
    @Test
    public void testIsCustomerAdministrator2() {
        long userId2 = 132457; // user
        long clientId1 = 1;
        try {
            assertFalse(authorizationService.isCustomerAdministrator(userId2, clientId1));
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for {@link HibernateAuthorizationService#isAdministrator(long)}.
     * </p>
     * <p>
     * Scenario include both "success" and "failure".
     * </p>
     */
    @Test
    public void testIsAdministrator() {
        long userId_TC_STAFF = 132456;
        try {
            assertTrue(authorizationService.isAdministrator(userId_TC_STAFF));
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        }

        long userId_NON_TC_STAFF = 132457;
        try {
            assertFalse(authorizationService.isAdministrator(userId_NON_TC_STAFF));
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for {@link HibernateAuthorizationService#getGroupIdsOfFullPermissionsUser(long)}.
     * </p>
     * <p>
     * This test case tests good situation.
     * </p>
     */
    @Test
    public void testGetGroupIdsOfFullPermissionsUser() {
        long userId = 132456;
        try {
            List<Long> groupIds = authorizationService.getGroupIdsOfFullPermissionsUser(userId);
            assertNotNull(groupIds);
            assertEquals(1, groupIds.size());
            assertEquals(1, groupIds.get(0).longValue());
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for {@link HibernateAuthorizationService#getGroupIdsOfFullPermissionsUser(long)} . This test case
     * tests the scenario when user's group has only read permission.
     * </p>
     */
    @Test
    public void testGetGroupIdsOfFullPermissionsUser_None() {
        long userId_read = 132457;

        try {
            List<Long> groupIds = authorizationService.getGroupIdsOfFullPermissionsUser(userId_read);
            assertNotNull(groupIds);
            assertTrue(groupIds.isEmpty());
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for {@link HibernateAuthorizationService#getGroupIdsOfFullPermissionsUser(long)} . This test case
     * test if the user's group has only write permission.
     * </p>
     */
    @Test
    public void testGetGroupIdsOfFullPermissionsUser_None2() {
        long userId_write = 124776;

        try {
            List<Long> groupIds = authorizationService.getGroupIdsOfFullPermissionsUser(userId_write);
            assertNotNull(groupIds);
            assertTrue(groupIds.isEmpty());
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Getter of authorizationService field.
     * </p>
     * 
     * @return the authorizationService
     */
    public AuthorizationService getAuthorizationService() {
        return authorizationService;
    }

    /**
     * <p>
     * Setter of authorizationService field.
     * </p>
     * 
     * @param authorizationService
     *            the authorizationService to set
     */
    @Resource
    public void setAuthorizationService(AuthorizationService authorizationService) {
        this.authorizationService = authorizationService;
    }
}
