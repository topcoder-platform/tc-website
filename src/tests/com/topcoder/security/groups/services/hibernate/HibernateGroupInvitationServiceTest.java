/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services.hibernate;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.topcoder.security.groups.model.Group;
import com.topcoder.security.groups.model.GroupInvitation;
import com.topcoder.security.groups.model.GroupMember;
import com.topcoder.security.groups.model.GroupPermissionType;
import com.topcoder.security.groups.model.InvitationStatus;
import com.topcoder.security.groups.services.GroupInvitationService;
import com.topcoder.security.groups.services.SecurityGroupException;
import com.topcoder.security.groups.services.dto.InvitationSearchCriteria;

/**
 * <p>
 * Unit test for {@link HibernateGroupInvitationService}. Test data should already be in database
 * </p>
 * 
 * @author backstretlili
 * @version 1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/securityGroupsApplicationContext.xml")
public class HibernateGroupInvitationServiceTest {

    /**
     * <p>
     * Instance of {@link HibernateGroupInvitationService}.
     * </p>
     */
    private GroupInvitationService groupInvitationService;

    /**
     * <p>
     * Test method for {@link GroupInvitationService#addInvitation(GroupInvitation invitation) } .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can add a GroupInvitation</li>
     * </ol>
     * </p>
     */
    @Test
    public void testAddInvitation() {
        GroupInvitation gi = generateGroupInvitation();

        try {
            assertTrue(groupInvitationService.addInvitation(gi) > 0);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * A utility method used to generate a GroupInvitation entity for testing.
     * 
     * @return GroupInvitation the generated GroupInvitation
     */
    private GroupInvitation generateGroupInvitation() {
        GroupInvitation gi = new GroupInvitation();
        gi.setAcceptedOrRejectedOn(new Date(System.currentTimeMillis()));
        gi.setApprovalProcessedOn(new Date(System.currentTimeMillis()));
        GroupMember gm = new GroupMember();
        gm.setId(1);
        gi.setGroupMember(gm);
        gi.setSentOn(new Date(System.currentTimeMillis()));
        gi.setStatus(InvitationStatus.APPROVAL_ACCEPTED);
        return gi;
    }

    /**
     * <p>
     * Test method for {@link GroupInvitationService#updateInvitation(GroupInvitation invitation) } .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can update a GroupInvitation</li>
     * </ol>
     * </p>
     */
    @Test
    public void testUpdateInvitation() {

        try {
            GroupInvitation gi = groupInvitationService.getInvitation(1L);
            gi.setAcceptedOrRejectedOn(new Date(System.currentTimeMillis()));
            groupInvitationService.updateInvitation(gi);
            assertTrue(groupInvitationService.getInvitation(1L).getAcceptedOrRejectedOn() != null);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for {@link GroupInvitationService#getInvitation(long invitationId) } .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can get a GroupInvitation by id</li>
     * </ol>
     * </p>
     */
    @Test
    public void testGetInvitation_Found() {

        try {
            assertTrue(groupInvitationService.getInvitation(1L).getId() == 1L);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for {@link GroupInvitationService#getInvitation(long invitationId) } .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>get a GroupInvitation not exists</li>
     * </ol>
     * </p>
     */
    @Test
    public void testGetInvitation_NotFound() {

        try {
            assertTrue(groupInvitationService.getInvitation(12345L) == null);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for
     * {@link GroupInvitationService#search(InvitationSearchCriteria criteria, long clientId, int pageSize, int page) } .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can search GroupInvitation by all conditions</li>
     * </ol>
     * </p>
     */
    @Test
    public void testSearch_AllConditions() {
        InvitationSearchCriteria criteria = new InvitationSearchCriteria();
        Long ownedUserId = 132458L;
        Long masterUserId = 132458L;
        String groupName = "g3";
        List<GroupPermissionType> permissionTypes = new ArrayList<GroupPermissionType>();
        permissionTypes.add(GroupPermissionType.WRITE);
        Date sentDateFrom = new Date(0L);
        Date sentDateTo = new Date(Long.MAX_VALUE);
        Date acceptedDateFrom = new Date(0L);
        Date acceptedDateTo = new Date(Long.MAX_VALUE);
        InvitationStatus status = InvitationStatus.APPROVAL_ACCEPTED;

        criteria.setOwnedUserId(ownedUserId);
        criteria.setMasterUserId(masterUserId);
        criteria.setGroupName(groupName);
        criteria.setPermissions(permissionTypes);
        criteria.setSentDateFrom(sentDateFrom);
        criteria.setSentDateTo(sentDateTo);
        criteria.setAcceptedDateFrom(acceptedDateFrom);
        criteria.setAcceptedDateTo(acceptedDateTo);
        criteria.setStatus(status);

        try {
            assertTrue(groupInvitationService.search(criteria, 70014096L, 20, 1).getValues().size() == 1);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for
     * {@link GroupInvitationService#search(InvitationSearchCriteria criteria, long clientId, int pageSize, int page) } .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can search GroupInvitation masterUserId</li>
     * </ol>
     * </p>
     */
    @Test
    public void testSearch_MasterUserId() {
        InvitationSearchCriteria criteria = new InvitationSearchCriteria();
        Long masterUserId = 132457L;

        criteria.setMasterUserId(masterUserId);

        try {
            assertTrue(groupInvitationService.search(criteria, 70014096L, 20, 1).getValues().size() == 1);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for
     * {@link GroupInvitationService#search(InvitationSearchCriteria criteria, long clientId, int pageSize, int page) } .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can search GroupInvitation by group name</li>
     * </ol>
     * </p>
     */
    @Test
    public void testSearch_GroupName() {
        InvitationSearchCriteria criteria = new InvitationSearchCriteria();
        String groupName = "g3";
        criteria.setGroupName(groupName);

        try {
            assertTrue(groupInvitationService.search(criteria, 70014096L, 20, 1).getValues().size() == 1);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for
     * {@link GroupInvitationService#search(InvitationSearchCriteria criteria, long clientId, int pageSize, int page) } .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can search GroupInvitation by snetDate</li>
     * </ol>
     * </p>
     */
    @Test
    public void testSearch_SentDate() {
        InvitationSearchCriteria criteria = new InvitationSearchCriteria();
        Date sentDateFrom = new Date(0L);
        Date sentDateTo = new Date(Long.MAX_VALUE);

        criteria.setSentDateFrom(sentDateFrom);
        criteria.setSentDateTo(sentDateTo);
        try {
            assertTrue(groupInvitationService.search(criteria, 70014096L, 20, 1).getValues().size() == 1);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for
     * {@link GroupInvitationService#search(InvitationSearchCriteria criteria, long clientId, int pageSize, int page) } .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can search GroupInvitation by using an admin user</li>
     * </ol>
     * </p>
     */
    @Test
    public void testSearch_Admin() {
        long userId = 132456;

        InvitationSearchCriteria criteria = new InvitationSearchCriteria();
        criteria.setMasterUserId(userId);
        try {
            assertTrue(groupInvitationService.search(criteria, 70014096L, 20, 1).getValues().size() == 1);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for
     * {@link GroupInvitationService#sendInvitation(GroupInvitation invitation, String registrationUrl, String acceptanceUrl, String rejectionUrl) }
     * .You need to manually check the inbox configured in the spring application context to view the email.
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can send invitation email</li>
     * </ol>
     * </p>
     */
    @Test
    public void testSendInvitation() {

        GroupInvitation gi = new GroupInvitation();
        gi.setAcceptedOrRejectedOn(new Date(System.currentTimeMillis()));
        gi.setApprovalProcessedOn(new Date(System.currentTimeMillis()));
        GroupMember gm = new GroupMember();
        gm.setId(1);
        gm.setUserId(132456);
        Group g = new Group();
        g.setName("test group name");
        gm.setGroup(g);
        gi.setGroupMember(gm);
        String registrationUrl = "http://registrationUrl <>&'\"registrationUrl";
        String acceptanceUrl = "acceptanceUrl";
        String rejectionUrl = "rejectionUrl";

        try {
            groupInvitationService.sendInvitation(gi, registrationUrl, acceptanceUrl, rejectionUrl);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * Setter of groupInvitationService
     * 
     * @param groupInvitationService
     *            the Spring injected groupInvitationService
     */
    @Resource
    public void setGroupInvitationService(GroupInvitationService groupInvitationService) {
        this.groupInvitationService = groupInvitationService;
    }

}
