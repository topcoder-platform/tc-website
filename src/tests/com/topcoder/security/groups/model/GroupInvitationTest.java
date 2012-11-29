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
 * Unit test for {@link GroupInvitation} class.
 * </p>
 * 
 * @author leo_lol
 * @version 1.0
 * @since 1.0
 */
public class GroupInvitationTest {

    /**
     * <p>
     * Commonly used instance of GroupInvitation instance.
     * </p>
     */
    private GroupInvitation instance;

    /**
     * <p>
     * Sample data for groupMember.
     * </p>
     */
    private static final GroupMember GROUP_MEMBER = new GroupMember();

    /***
     * <p>
     * Sample data for status.
     * </p>
     */
    private static final InvitationStatus INVITATION_STATUS = InvitationStatus.PENDING;

    /**
     * <p>
     * Sample data for sentOn.
     * </p>
     */
    private static final Date SENT_ON = new Date();

    /**
     * <p>
     * Sample data for acceptedOrRejectedOn.
     * </p>
     */
    private static final Date ACCEPTED_OR_REJECTED_ON = new Date();

    /**
     * <p>
     * Sample data for approvalProcessedOn.
     * </p>
     */
    private static final Date APPROVAL_PROCESSED_ON = new Date();

    /**
     * <p>
     * Set up unit test.
     * </p>
     * 
     * @throws java.lang.Exception
     */
    @Before
    public void setUp() throws Exception {
        instance = new GroupInvitation();
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupInvitation#GroupInvitation()}
     * .
     */
    @Test
    public void testGroupInvitation() {
        GroupInvitation groupInvitation = new GroupInvitation();
        Assert.assertNotNull(groupInvitation);
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupInvitation#getGroupMember()}
     * .
     */
    @Test
    public void testGetGroupMember() {
        TestHelper.setProperty(instance, "groupMember", GROUP_MEMBER);
        Assert.assertEquals(GROUP_MEMBER, instance.getGroupMember());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupInvitation#setGroupMember(com.topcoder.security.groups.model.GroupMember)}
     * .
     */
    @Test
    public void testSetGroupMember() {
        instance.setGroupMember(GROUP_MEMBER);
        Assert.assertEquals(GROUP_MEMBER, TestHelper.getProperty(instance,
                "groupMember", GroupMember.class));
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupInvitation#getStatus()}.
     */
    @Test
    public void testGetStatus() {
        TestHelper.setProperty(instance, "status", INVITATION_STATUS);
        Assert.assertEquals(INVITATION_STATUS, instance.getStatus());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupInvitation#setStatus(com.topcoder.security.groups.model.InvitationStatus)}
     * .
     */
    @Test
    public void testSetStatus() {
        instance.setStatus(INVITATION_STATUS);
        Assert.assertEquals(INVITATION_STATUS, TestHelper.getProperty(instance,
                "status", InvitationStatus.class));
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupInvitation#getSentOn()}.
     */
    @Test
    public void testGetSentOn() {
        TestHelper.setProperty(instance, "sentOn", SENT_ON);
        Assert.assertEquals(SENT_ON, instance.getSentOn());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupInvitation#setSentOn(java.util.Date)}
     * .
     */
    @Test
    public void testSetSentOn() {
        instance.setSentOn(SENT_ON);
        Assert.assertEquals(SENT_ON,
                TestHelper.getProperty(instance, "sentOn", Date.class));
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupInvitation#getAcceptedOrRejectedOn()}
     * .
     */
    @Test
    public void testGetAcceptedOrRejectedOn() {
        TestHelper.setProperty(instance, "acceptedOrRejectedOn",
                ACCEPTED_OR_REJECTED_ON);
        Assert.assertEquals(ACCEPTED_OR_REJECTED_ON,
                instance.getAcceptedOrRejectedOn());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupInvitation#setAcceptedOrRejectedOn(java.util.Date)}
     * .
     */
    @Test
    public void testSetAcceptedOrRejectedOn() {
        instance.setAcceptedOrRejectedOn(ACCEPTED_OR_REJECTED_ON);
        Assert.assertEquals(ACCEPTED_OR_REJECTED_ON, TestHelper.getProperty(
                instance, "acceptedOrRejectedOn", Date.class));
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupInvitation#getApprovalProcessedOn()}
     * .
     */
    @Test
    public void testGetApprovalProcessedOn() {
        TestHelper.setProperty(instance, "approvalProcessedOn",
                APPROVAL_PROCESSED_ON);
        Assert.assertEquals(APPROVAL_PROCESSED_ON,
                instance.getApprovalProcessedOn());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.GroupInvitation#setApprovalProcessedOn(java.util.Date)}
     * .
     */
    @Test
    public void testSetApprovalProcessedOn() {
        instance.setApprovalProcessedOn(APPROVAL_PROCESSED_ON);
        Assert.assertEquals(APPROVAL_PROCESSED_ON, TestHelper.getProperty(
                instance, "approvalProcessedOn", Date.class));
    }

}
