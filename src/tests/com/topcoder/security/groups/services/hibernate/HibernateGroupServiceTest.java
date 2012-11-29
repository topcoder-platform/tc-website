/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services.hibernate;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.topcoder.security.groups.model.BillingAccount;
import com.topcoder.security.groups.model.Client;
import com.topcoder.security.groups.model.DirectProject;
import com.topcoder.security.groups.model.Group;
import com.topcoder.security.groups.model.GroupPermissionType;
import com.topcoder.security.groups.model.ResourceType;
import com.topcoder.security.groups.services.BillingAccountService;
import com.topcoder.security.groups.services.GroupService;
import com.topcoder.security.groups.services.SecurityGroupException;
import com.topcoder.security.groups.services.dto.GroupSearchCriteria;

/**
 * <p>
 * Unit test for {@link GroupService}. Test data should already be in database
 * </p>
 * 
 * @author backstretlili
 * @version 1.0
 * @since 1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/securityGroupsApplicationContext.xml")
public class HibernateGroupServiceTest {

    /**
     * <p>
     * Instance of {@link GroupService}.
     * </p>
     */
    private GroupService groupService;

    /**
     * <p>
     * Test method for {@link GroupService#add(Group group)} and
     * {@link GoupService#get(long id)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can add a Group properly</li>
     * <li>can get a Group properly</li>
     * </ol>
     * </p>
     */
    @Test
    public void testAddAndGet() {
        Group group = generateGroup();

        try {
            long id = groupService.add(group);
            assertTrue(id > 0);

            Group added = groupService.get(id);
            assertTrue(added.getName().equals(group.getName()));
            assertTrue(added.getArchivedOn() == null);
            assertTrue(added.getArchived() == false);

            assertTrue(added.getDefaultPermission().equals(GroupPermissionType.FULL));
            assertTrue(added.getClient().getCompanyId() == group.getClient().getCompanyId());
            assertTrue(added.getClient().getName().equals(group.getClient().getName()));

            assertTrue(added.getBillingAccounts().size() == 2);
            assertTrue(added.getBillingAccounts().get(0).getDescription().indexOf("description") > -1);

            assertTrue(added.getRestrictions().size() == 2);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for {@link GroupService#add(Group group)} and
     * {@link GoupService#get(long id)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can get a Group properly</li>
     * </ol>
     * </p>
     */
    @Test
    public void testGet() {
        long groupId = 1L;

        try {
            Group group = groupService.get(groupId);
            assertTrue(group != null);
            assertTrue(group.getDirectProjects().size() == 1);

            assertTrue(group.getGroupMembers().size() == 1);
            assertTrue(group.getGroupMembers().get(0).getUserId() == 132456);
            assertTrue(group.getGroupMembers().get(0).getActive() == true);

        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * A utility method used to generate a Group entity for testing.
     * 
     * @return Group the generated Group
     */
    private Group generateGroup() {
        Group group = new Group();
        group.setArchived(false);
        group.setArchivedOn(null);
        group.setDefaultPermission(GroupPermissionType.FULL);
        String name = "test add_";
        group.setName(name);

        Client client = new Client();
        client.setId(1L);
        client.setCompanyId(1);
        client.setName("ACME");
        group.setClient(client);

        List<BillingAccount> billingAccounts = new ArrayList<BillingAccount>();
        BillingAccount ba1 = new BillingAccount();
        ba1.setId(1L);
        ba1.setCompanyId(1);
        ba1.setDeleted(false);
        ba1.setDescription("description");
        ba1.setName("Test Project 1");
        billingAccounts.add(ba1);
        BillingAccount ba2 = new BillingAccount();
        ba2.setId(2L);
        ba2.setCompanyId(2);
        ba2.setDeleted(false);
        ba2.setDescription("description");
        ba2.setName("Test Project 2");
        billingAccounts.add(ba2);
        group.setBillingAccounts(billingAccounts);

        List<DirectProject> directProjects = new ArrayList<DirectProject>();
        DirectProject dp1 = new DirectProject();
        dp1.setId(1);
        directProjects.add(dp1);
        group.setDirectProjects(directProjects);

        List<ResourceType> restrictions = new ArrayList<ResourceType>();
        restrictions.add(ResourceType.BILLING_ACCOUNT);
        restrictions.add(ResourceType.PROJECT);
        group.setRestrictions(restrictions);

        group.setArchived(false);

        return group;
    }

    /**
     * <p>
     * Test method for {@link GoupService#update(Group group)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can update a Group properly when no archive needed</li>
     * </ol>
     * </p>
     */
    @Test
    public void testUpdate_NoArchive() {
        Long groupId = 2L;

        try {
            Group group = groupService.get(groupId);

            String name = "updated group";
            group.setName(name);
            groupService.update(group);
            group = groupService.get(groupId);

            assertTrue(group.getName().equals(name));
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for {@link GoupService#update(Group group)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can update a Group properly when defaultPermission changed</li>
     * <li>the new group has old groups's active member</li>
     * </ol>
     * </p>
     */
    @Test
    public void testUpdate_ArchiveDefaultPermission() {
        Long groupId = 2L;

        try {
            Group group = groupService.get(groupId);

            group.setDefaultPermission(GroupPermissionType.FULL);
            groupService.update(group);
            group = groupService.get(group.getId());

            assertTrue(group.getArchived() == true);
            assertTrue(group.getArchivedOn() != null);

            Group newGroup = groupService.get(group.getEffectiveGroup().getId());
            assertTrue(newGroup != null);
            assertTrue(newGroup.getDefaultPermission().equals(GroupPermissionType.FULL));
            assertTrue(newGroup.getGroupMembers().size() == 1);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for {@link GoupService#update(Group group)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can update a Group properly when billingAccounts changed</li>
     * </ol>
     * </p>
     */
    @Test
    public void testUpdate_ArchiveBillingAccounts() {
        Long groupId = 2L;

        try {
            Group group = groupService.get(groupId);

            List<BillingAccount> billingAccounts = new ArrayList<BillingAccount>();
            BillingAccount ba1 = new BillingAccount();
            ba1.setId(3);
            ba1.setName("Test Project 3");
            group.setBillingAccounts(billingAccounts);
            groupService.update(group);
            group = groupService.get(group.getId());

            assertTrue(group.getArchived() == true);
            assertTrue(group.getArchivedOn() != null);

            Group newGroup = groupService.get(group.getEffectiveGroup().getId());
            assertTrue(newGroup != null);
            assertTrue(newGroup.getBillingAccounts().size() == 1);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for {@link GoupService#update(Group group)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can update a Group properly when directProjects changed</li>
     * </ol>
     * </p>
     */
    @Test
    public void testUpdate_ArchiveDirectProjects() {
        Long groupId = 2L;

        try {
            Group group = groupService.get(groupId);

            List<DirectProject> directProjects = new ArrayList<DirectProject>();
            DirectProject dp1 = new DirectProject();
            dp1.setName("DirectProject name1 updated");
            group.setDirectProjects(directProjects);
            groupService.update(group);
            group = groupService.get(group.getId());

            assertTrue(group.getArchived() == true);
            assertTrue(group.getArchivedOn() != null);

            Group newGroup = groupService.get(group.getEffectiveGroup().getId());
            assertTrue(newGroup != null);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for {@link GoupService#update(Group group)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can update a Group properly when restrictions changed</li>
     * </ol>
     * </p>
     */
    @Test
    public void testUpdate_ArchiveRestrictions() {
        Long groupId = 2L;

        try {
            Group group = groupService.get(groupId);

            List<ResourceType> restrictions = new ArrayList<ResourceType>();
            restrictions.add(ResourceType.BILLING_ACCOUNT);
            group.setRestrictions(restrictions);
            groupService.update(group);
            group = groupService.get(group.getId());

            assertTrue(group.getArchived() == true);
            assertTrue(group.getArchivedOn() != null);

            Group newGroup = groupService.get(group.getEffectiveGroup().getId());
            assertTrue(newGroup != null);
            assertTrue(newGroup.getRestrictions().size() == 1);
            assertTrue(newGroup.getRestrictions().get(0).equals(ResourceType.BILLING_ACCOUNT));
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for {@link GoupService#get(long id)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can delete a Group properly</li>
     * </ol>
     * </p>
     */
    @Test
    public void testDelete() {
        Long groupId = 2L;

        try {
            Group group = groupService.get(groupId);
            assertTrue(group != null);

            groupService.delete(group.getId());
            assertTrue(groupService.get(group.getId()) == null);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for
     * {@link BillingAccountService#search(GroupSearchCriteria criteria, int pageSize, int page)}
     * .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can search Groups meet all conditions</li>
     * </ol>
     * </p>
     */
    @Test
    public void testSearch_AllCondition() {
        // long userId = 132456L;
        String groupName = "g3";
        String clientName = "Notus";
        String projectName = "DirectProject name";
        List<GroupPermissionType> permissionTypes = new ArrayList<GroupPermissionType>();
        permissionTypes.add(GroupPermissionType.WRITE);
        String groupMemberHandle = "firstdok";
        String billingAccountName = "Test Project 3";

        GroupSearchCriteria criteria = new GroupSearchCriteria();
        // criteria.setUserId(userId);
        criteria.setGroupName(groupName);
        criteria.setClientName(clientName);
        criteria.setProjectName(projectName);
        criteria.setPermissions(permissionTypes);
        criteria.setGroupMemberHandle(groupMemberHandle);
        criteria.setBillingAccountName(billingAccountName);
        int page = 1;
        int pageSize = 20;

        try {
            assertTrue(groupService.search(criteria, pageSize, page).getValues().size() >= 0);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for
     * {@link BillingAccountService#search(GroupSearchCriteria criteria, int pageSize, int page)}
     * .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can search Groups by groupName</li>
     * </ol>
     * </p>
     */
    @Test
    public void testSearch_GroupName() {
        // long userId = 132456L;
        String groupName = "g3";

        GroupSearchCriteria criteria = new GroupSearchCriteria();
        criteria.setGroupName(groupName);
        int page = 1;
        int pageSize = 20;

        try {
            assertTrue(groupService.search(criteria, pageSize, page).getValues().size() > 0);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for
     * {@link BillingAccountService#search(GroupSearchCriteria criteria, int pageSize, int page)}
     * .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can search Groups by clientName</li>
     * </ol>
     * </p>
     */
    @Test
    public void testSearch_ClientName() {
        String clientName = "Notus";

        GroupSearchCriteria criteria = new GroupSearchCriteria();
        criteria.setClientName(clientName);
        int page = 1;
        int pageSize = 20;

        try {
            assertTrue(groupService.search(criteria, pageSize, page).getValues().size() > 0);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for
     * {@link BillingAccountService#search(GroupSearchCriteria criteria, int pageSize, int page)}
     * .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can search Groups by project name</li>
     * </ol>
     * </p>
     */
    @Test
    public void testSearch_ProjectName() {
        String projectName = "DirectProject name";

        GroupSearchCriteria criteria = new GroupSearchCriteria();
        criteria.setProjectName(projectName);
        int page = 1;
        int pageSize = 20;

        try {
            assertTrue(groupService.search(criteria, pageSize, page).getValues().size() > 0);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for
     * {@link BillingAccountService#search(GroupSearchCriteria criteria, int pageSize, int page)}
     * .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can search Groups by permission</li>
     * </ol>
     * </p>
     */
    @Test
    public void testSearch_Permissio() {
        List<GroupPermissionType> permissionTypes = new ArrayList<GroupPermissionType>();
        permissionTypes.add(GroupPermissionType.WRITE);

        GroupSearchCriteria criteria = new GroupSearchCriteria();
        criteria.setPermissions(permissionTypes);
        int page = 1;
        int pageSize = 20;

        try {
            assertTrue(groupService.search(criteria, pageSize, page).getValues().size() > 0);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for
     * {@link BillingAccountService#search(GroupSearchCriteria criteria, int pageSize, int page)}
     * .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can search Groups by member handle and billing account</li>
     * </ol>
     * </p>
     */
    @Test
    public void testSearch_MemberBillingAccount() {
        String groupMemberHandle = "Yoshi";
        String billingAccountName = "Test Project 3";

        GroupSearchCriteria criteria = new GroupSearchCriteria();
        criteria.setGroupMemberHandle(groupMemberHandle);
        criteria.setBillingAccountName(billingAccountName);
        int page = 1;
        int pageSize = 20;

        try {
            assertTrue(groupService.search(criteria, pageSize, page).getValues().size() >= 0);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }
    
    /**
     * <p>
     * Test method for {@link BillingAccountService#search(GroupSearchCriteria criteria, int pageSize, int page)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can search Groups by using an admin user</li>
     * </ol>
     * </p>
     */
    @Test
    public void testSearch_Admin() {
        long userId = 132456L;

        GroupSearchCriteria criteria = new GroupSearchCriteria();
        criteria.setUserId(userId);
        int page = 1;
        int pageSize = 20;

        try {
            assertTrue(groupService.search(criteria, pageSize, page).getValues().size() == 8);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * Setter of groupService
     * 
     * @param groupService
     *            the Spring injected groupService
     */
    @Resource
    public void setGroupService(GroupService groupService) {
        this.groupService = groupService;
    }

}
