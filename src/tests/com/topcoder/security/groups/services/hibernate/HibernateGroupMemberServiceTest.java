/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services.hibernate;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.topcoder.security.groups.model.Group;
import com.topcoder.security.groups.model.GroupMember;
import com.topcoder.security.groups.model.GroupPermissionType;
import com.topcoder.security.groups.services.GroupMemberService;
import com.topcoder.security.groups.services.SecurityGroupException;
import com.topcoder.security.groups.services.dto.GroupMemberAccessHistoricalData;
import com.topcoder.security.groups.services.dto.GroupMemberSearchCriteria;
import com.topcoder.security.groups.services.dto.PagedResult;

/**
 * <p>
 * Unit test for {@link HibernateGroupMemberService}. Test data should already be in database
 * </p>
 * 
 * @author backstretlili
 * @version 1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/securityGroupsApplicationContext.xml")
public class HibernateGroupMemberServiceTest {

    /**
     * <p>
     * Instance of {@link HibernateGroupMemberService}.
     * </p>
     */
    private GroupMemberService groupMemberService;

    /**
     * <p>
     * Test method for {@link GroupMemberService#update(GroupMember member)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can update a GroupMember</li>
     * </ol>
     * </p>
     */
    @Test
    public void testUpdate() {

        try {
            GroupMember gm = new GroupMember();
            Group g = new Group();
            g.setId(4L);
            gm.setGroup(g);
            gm.setId(4L);
            gm.setUserId(132456L);
            gm.setUseGroupDefault(true);
            gm.setUnassignedOn(new Date(System.currentTimeMillis()));
            groupMemberService.update(gm);
            assertTrue(gm.getUnassignedOn() != null);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for
     * {@link GroupMemberService#searchHistoricalData(GroupMemberSearchCriteria criteria,int pageSize, int page)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can search GroupMember by all conditions</li>
     * </ol>
     * </p>
     */
    @Test
    public void testSearchHistoricalData_AllConditions() {
        // long userId = 132456L;
        String groupName = "g3";
        String clientName = "Notus";
        String projectName = "DirectProject name 3";
        List<GroupPermissionType> permissionTypes = new ArrayList<GroupPermissionType>();
        permissionTypes.add(GroupPermissionType.WRITE);
        String memberHandle = "user";
        String billingAccountName = "Test Project 3";
        Date from = new Date(Long.MAX_VALUE);

        GroupMemberSearchCriteria criteria = new GroupMemberSearchCriteria();
        // criteria.setUserId(userId);
        criteria.setGroupName(groupName);
        criteria.setClientName(clientName);
        criteria.setProjectName(projectName);
        criteria.setPermissions(permissionTypes);
        criteria.setMemberHandle(memberHandle);
        criteria.setBillingAccountName(billingAccountName);
        criteria.setHadAccessFrom(from);

        try {
            PagedResult<GroupMemberAccessHistoricalData> result = groupMemberService.searchHistoricalData(criteria, 20,
                            1);
            assertTrue(result.getValues().size() == 1);
            assertTrue(result.getValues().get(0).getGroupId() == 3);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for
     * {@link GroupMemberService#searchHistoricalData(GroupMemberSearchCriteria criteria,int pageSize, int page)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can search GroupMember by all groupName</li>
     * </ol>
     * </p>
     */
    @Test
    public void testSearchHistoricalData_GroupName() {
        String groupName = "g3";

        GroupMemberSearchCriteria criteria = new GroupMemberSearchCriteria();
        criteria.setGroupName(groupName);

        try {
            PagedResult<GroupMemberAccessHistoricalData> result = groupMemberService.searchHistoricalData(criteria, 20,
                            1);
            assertTrue(result.getValues().size() == 1);
            assertTrue(result.getValues().get(0).getGroupId() == 3);
            assertTrue(result.getValues().get(0).getBillingAccounts().size() == 1);
            assertTrue(result.getValues().get(0).getDirectProjectIds().size() == 1);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for
     * {@link GroupMemberService#searchHistoricalData(GroupMemberSearchCriteria criteria,int pageSize, int page)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can search GroupMember by all clientName</li>
     * </ol>
     * </p>
     */
    @Test
    public void testSearchHistoricalData_ClientName() {
        String clientName = "Notus";

        GroupMemberSearchCriteria criteria = new GroupMemberSearchCriteria();
        criteria.setClientName(clientName);

        try {
            PagedResult<GroupMemberAccessHistoricalData> result = groupMemberService.searchHistoricalData(criteria, 20,
                            1);
            assertTrue(result.getValues().size() == 2);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for
     * {@link GroupMemberService#searchHistoricalData(GroupMemberSearchCriteria criteria,int pageSize, int page)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can search GroupMember by userId</li>
     * </ol>
     * </p>
     */
    @Test
    public void testSearchHistoricalData_UserId() {
        long userId = 132457;

        GroupMemberSearchCriteria criteria = new GroupMemberSearchCriteria();
        criteria.setUserId(userId);

        try {
            PagedResult<GroupMemberAccessHistoricalData> result = groupMemberService.searchHistoricalData(criteria, 20,
                            1);
            assertTrue(result.getValues().size() == 2);
            assertTrue(result.getValues().get(0).getGroupId() == 3 || result.getValues().get(0).getGroupId() == 4);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for
     * {@link GroupMemberService#searchHistoricalData(GroupMemberSearchCriteria criteria,int pageSize, int page)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can search GroupMember by memberHandle</li>
     * </ol>
     * </p>
     */
    @Test
    public void testSearchHistoricalData_MemberHandle() {
        String handle = "Hung";// id=124764;

        GroupMemberSearchCriteria criteria = new GroupMemberSearchCriteria();
        criteria.setMemberHandle(handle);

        try {
            PagedResult<GroupMemberAccessHistoricalData> result = groupMemberService.searchHistoricalData(criteria, 20,
                            1);
            assertTrue(result.getValues().size() == 1);
            assertTrue(result.getValues().get(0).getGroupId() == 5);
            assertTrue(result.getValues().get(0).getPermission().name().equals("WRITE"));
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for
     * {@link GroupMemberService#searchHistoricalData(GroupMemberSearchCriteria criteria,int pageSize, int page)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can search GroupMember by projectName</li>
     * </ol>
     * </p>
     */
    @Test
    public void testSearchHistoricalData_ProjectName() {
        String projectName = "DirectProject name 4";// id=4;

        GroupMemberSearchCriteria criteria = new GroupMemberSearchCriteria();
        criteria.setProjectName(projectName);

        try {
            PagedResult<GroupMemberAccessHistoricalData> result = groupMemberService.searchHistoricalData(criteria, 20,
                            1);
            assertTrue(result.getValues().size() == 1);
            assertTrue(result.getValues().get(0).getGroupId() == 5);
            assertTrue(result.getValues().get(0).getPermission().name().equals("WRITE"));
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for
     * {@link GroupMemberService#searchHistoricalData(GroupMemberSearchCriteria criteria,int pageSize, int page)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can get the access history of a member</li>
     * </ol>
     * </p>
     */
    @Test
    public void testSearchHistoricalData_Range() {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date1 = "2012-02-01 12:12:12";
        String date2 = "2012-02-05 12:12:12";
        String groupName = "g-range";

        GroupMemberSearchCriteria criteria = new GroupMemberSearchCriteria();
        criteria.setGroupName(groupName);

        try {
            PagedResult<GroupMemberAccessHistoricalData> result = groupMemberService.searchHistoricalData(criteria, 20,
                            1);
            assertTrue(result.getValues().size() == 2);
            for (int i = 0; i < result.getValues().size(); i++) {
                if (result.getValues().get(i).getGroupId() == 11) {
                    assertTrue(formatter.format(result.getValues().get(i).getFrom()).equals(date2));
                    assertTrue(result.getValues().get(i).getTo() == null);
                } else {
                    assertTrue(formatter.format(result.getValues().get(i).getFrom()).equals(date1));
                    assertTrue(formatter.format(result.getValues().get(i).getTo()).equals(date2));
                }
            }
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for
     * {@link GroupMemberService#searchHistoricalData(GroupMemberSearchCriteria criteria,int pageSize, int page)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can search GroupMember by using an admin user</li>
     * </ol>
     * </p>
     */
    @Test
    public void testSearchHistoricalData_Admin() {
        long userId = 132456L;

        GroupMemberSearchCriteria criteria = new GroupMemberSearchCriteria();
        criteria.setUserId(userId);

        try {
            PagedResult<GroupMemberAccessHistoricalData> result = groupMemberService.searchHistoricalData(criteria, 20,
                            1);
            assertTrue(result.getValues().size() == 8);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * Setter of groupMemberService
     * 
     * @param groupMemberService
     *            the Spring injected groupMemberService
     */
    @Resource
    public void setGroupMemberService(GroupMemberService groupMemberService) {
        this.groupMemberService = groupMemberService;
    }

}
