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
import com.topcoder.security.groups.model.InvitationStatus;

/**
 * <p>
 * Unit test for {@link InvitationSearchCriteria}
 * </p>
 * 
 * @author leo_lol
 * @version 1.0 (Topcoder Security Groups Backend Model and Authorization
 *          Assembly)
 * @since 1.0
 */
public class InvitationSearchCriteriaTest {

    /**
     * <p>
     * This field represents the commonly used InvitationSearchCriteria
     * instance.
     * </p>
     */
    private InvitationSearchCriteria instance;

    /**
     * <p>
     * Initialize the {{@link #instance} field.
     * </p>
     */
    @Before
    public void setUp() {
        instance = new InvitationSearchCriteria();
    }

    /**
     * Test method for
     * {@link InvitationSearchCriteria#InvitationSearchCriteria()}.
     */
    @Test
    public void testInvitationSearchCriteria() {
        InvitationSearchCriteria invitationSearchCriteria = new InvitationSearchCriteria();
        assertNotNull(invitationSearchCriteria);
    }

    /**
     * Test method for {@link InvitationSearchCriteria#getOwnedUserId()}.
     */
    @Test
    public void testGetOwnedUserId() {
        Long OWNED_USER_ID = 1L;
        TestHelper.setProperty(instance, "ownedUserId", OWNED_USER_ID);
        assertEquals(OWNED_USER_ID, instance.getOwnedUserId());
    }

    /**
     * Test method for {@link InvitationSearchCriteria#setOwnedUserId(Long)}.
     */
    @Test
    public void testSetOwnedUserId() {
        Long OWNED_USER_ID = 1L;
        instance.setOwnedUserId(OWNED_USER_ID);
        assertEquals(OWNED_USER_ID,
                TestHelper.getProperty(instance, "ownedUserId", Long.class));
    }

    /**
     * Test method for {@link InvitationSearchCriteria#getMasterUserId()}.
     */
    @Test
    public void testGetMasterUserId() {
        Long MASTER_USER_ID = 1L;
        TestHelper.setProperty(instance, "masterUserId", MASTER_USER_ID);
        assertEquals(MASTER_USER_ID, instance.getMasterUserId());
    }

    /**
     * Test method for {@link InvitationSearchCriteria#setMasterUserId(Long)}.
     */
    @Test
    public void testSetMasterUserId() {
        Long MASTER_USER_ID = 1L;
        instance.setMasterUserId(MASTER_USER_ID);
        assertEquals(MASTER_USER_ID,
                TestHelper.getProperty(instance, "masterUserId", Long.class));

    }

    /**
     * Test method for {@link InvitationSearchCriteria#getGroupName()}.
     */
    @Test
    public void testGetGroupName() {
        String GROUP_NAME = "group name";
        TestHelper.setProperty(instance, "groupName", GROUP_NAME);
        assertEquals(GROUP_NAME, instance.getGroupName());
    }

    /**
     * Test method for {@link InvitationSearchCriteria#setGroupName(String)}.
     */
    @Test
    public void testSetGroupName() {
        String GROUP_NAME = "group name";
        instance.setGroupName(GROUP_NAME);
        assertEquals(GROUP_NAME,
                TestHelper.getProperty(instance, "groupName", String.class));
    }

    /**
     * Test method for {@link InvitationSearchCriteria#getPermissions()}.
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
     * Test method for {@link InvitationSearchCriteria#setPermissions(List)}.
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
     * Test method for {@link InvitationSearchCriteria#getSentDateFrom()}.
     */
    @Test
    public void testGetSentDateFrom() {
        Date SENT_DATE_FROM = new Date();
        TestHelper.setProperty(instance, "sentDateFrom", SENT_DATE_FROM);
        assertEquals(SENT_DATE_FROM, instance.getSentDateFrom());
    }

    /**
     * Test method for {@link InvitationSearchCriteria#setSentDateFrom(Date)}.
     */
    @Test
    public void testSetSentDateFrom() {
        Date SENT_DATE_FROM = new Date();
        instance.setSentDateFrom(SENT_DATE_FROM);
        assertEquals(SENT_DATE_FROM,
                TestHelper.getProperty(instance, "sentDateFrom", Date.class));
    }

    /**
     * Test method for {@link InvitationSearchCriteria#getSentDateTo()}.
     */
    @Test
    public void testGetSentDateTo() {
        Date SENT_DATE_TO = new Date();
        TestHelper.setProperty(instance, "sentDateTo", SENT_DATE_TO);
        assertEquals(SENT_DATE_TO, instance.getSentDateTo());
    }

    /**
     * Test method for {@link InvitationSearchCriteria#setSentDateTo(Date)}.
     */
    @Test
    public void testSetSentDateTo() {
        Date SENT_DATE_TO = new Date();
        instance.setSentDateTo(SENT_DATE_TO);
        assertEquals(SENT_DATE_TO,
                TestHelper.getProperty(instance, "sentDateTo", Date.class));
    }

    /**
     * Test method for {@link InvitationSearchCriteria#getAcceptedDateFrom()}.
     */
    @Test
    public void testGetAcceptedDateFrom() {
        Date GET_ACCEPTED_DATE_FROM = new Date();
        TestHelper.setProperty(instance, "acceptedDateFrom",
                GET_ACCEPTED_DATE_FROM);
        assertEquals(GET_ACCEPTED_DATE_FROM, instance.getAcceptedDateFrom());
    }

    /**
     * Test method for
     * {@link InvitationSearchCriteria#setAcceptedDateFrom(Date)}.
     */
    @Test
    public void testSetAcceptedDateFrom() {
        Date GET_ACCEPTED_DATE_FROM = new Date();
        instance.setAcceptedDateFrom(GET_ACCEPTED_DATE_FROM);
        assertEquals(GET_ACCEPTED_DATE_FROM, TestHelper.getProperty(instance,
                "acceptedDateFrom", Date.class));
    }

    /**
     * Test method for {@link InvitationSearchCriteria#getAcceptedDateTo()}.
     */
    @Test
    public void testGetAcceptedDateTo() {
        Date ACCEPTED_DATE_TO = new Date();
        TestHelper.setProperty(instance, "acceptedDateTo", ACCEPTED_DATE_TO);
        assertEquals(ACCEPTED_DATE_TO, instance.getAcceptedDateTo());
    }

    /**
     * Test method for {@link InvitationSearchCriteria#setAcceptedDateTo(Date)}.
     */
    @Test
    public void testSetAcceptedDateTo() {
        Date ACCEPTED_DATE_TO = new Date();
        instance.setAcceptedDateTo(ACCEPTED_DATE_TO);
        assertEquals(ACCEPTED_DATE_TO,
                TestHelper.getProperty(instance, "acceptedDateTo", Date.class));

    }

    /**
     * Test method for {@link InvitationSearchCriteria#getStatus()}.
     */
    @Test
    public void testGetStatus() {
        InvitationStatus STATUS = InvitationStatus.APPROVAL_ACCEPTED;
        TestHelper.setProperty(instance, "status", STATUS);
        assertEquals(STATUS, instance.getStatus());
    }

    /**
     * Test method for
     * {@link InvitationSearchCriteria#setStatus(InvitationStatus)}.
     */
    @Test
    public void testSetStatus() {
        InvitationStatus STATUS = InvitationStatus.APPROVAL_ACCEPTED;
        instance.setStatus(STATUS);
        assertEquals(STATUS, TestHelper.getProperty(instance, "status",
                InvitationStatus.class));
    }

}
