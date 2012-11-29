/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services.dto;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import com.topcoder.security.groups.TestHelper;

/**
 * <p>
 * Unit test for {@link UserDTO}
 * </p>
 * 
 * @author leo_lol
 * @version 1.0 (Topcoder Security Groups Backend Model and Authorization Assembly)
 * @since 1.0
 */
public class UserDTOTest {

    /**
     * <p>
     * Sample user ID.
     * </p>
     */
    private static final long SAMPLE_USER_ID = 1L;

    /**
     * <p>
     * Sample user name.
     * </p>
     */
    private static final String SAMPLE_EMAIL_ADDRESS = "user@company.com";

    /**
     * <p>
     * Sample user handle.
     * </p>
     */
    private static final String SAMPLE_USER_HANDLE = "heffan";

    /**
     * <p>
     * This field represents the commonly used UserDTO instance.
     * </p>
     */
    private UserDTO instance;

    /**
     * <p>
     * Initialize the {{@link #instance} field.
     * </p>
     */
    @Before
    public void setUp() {
        instance = new UserDTO();
    }

    /**
     * Test method for {@link UserDTO#UserDTO()}.
     */
    @Test
    public void testUserDTO() {
        UserDTO userDTO = new UserDTO();
        assertNotNull(userDTO);
    }

    /**
     * Test method for {@link UserDTO#getUserId()}.
     */
    @Test
    public void testGetUserId() {
        TestHelper.setProperty(instance, "userId", SAMPLE_USER_ID);
        assertEquals(SAMPLE_USER_ID, instance.getUserId());
    }

    /**
     * Test method for {@link UserDTO#setUserId(long)}.
     */
    @Test
    public void testSetUserId() {
        instance.setUserId(SAMPLE_USER_ID);
        assertEquals(SAMPLE_USER_ID, TestHelper.getProperty(instance, "userId", Long.class).longValue());
    }

    /**
     * Test method for {@link UserDTO#getHandle()}.
     */
    @Test
    public void testGetHandle() {
        TestHelper.setProperty(instance, "handle", SAMPLE_USER_HANDLE);
        assertEquals(SAMPLE_USER_HANDLE, instance.getHandle());
    }

    /**
     * Test method for {@link UserDTO#setHandle(java.lang.String)}.
     */
    @Test
    public void testSetHandle() {
        instance.setHandle(SAMPLE_USER_HANDLE);
        assertEquals(SAMPLE_USER_HANDLE, TestHelper.getProperty(instance, "handle", String.class));
    }

    /**
     * Test method for {@link UserDTO#getEmailAddress()}.
     */
    @Test
    public void testGetEmailAddress() {
        String EMAIL_ADDRESS = "EMAIL@ADDRESS";
        TestHelper.setProperty(instance, "emailAddress", EMAIL_ADDRESS);
        assertEquals(EMAIL_ADDRESS, instance.getEmailAddress());
    }

    /**
     * Test method for {@link UserDTO#setEmailAddress(java.lang.String)}.
     */
    @Test
    public void testSetEmailAddress() {
        instance.setEmailAddress(SAMPLE_EMAIL_ADDRESS);
        assertEquals(SAMPLE_EMAIL_ADDRESS, TestHelper.getProperty(instance, "emailAddress", String.class));
    }

}
