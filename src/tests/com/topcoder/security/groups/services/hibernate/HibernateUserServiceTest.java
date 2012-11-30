/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services.hibernate;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.topcoder.security.groups.services.SecurityGroupException;
import com.topcoder.security.groups.services.UserService;
import com.topcoder.security.groups.services.dto.UserDTO;

/**
 * <p>
 * Unit test for {@link HibernateUserService}. Test data should already be in
 * database
 * </p>
 * 
 * @author backstretlili
 * @version 1.0
 * @since 1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/securityGroupsApplicationContext.xml")
public class HibernateUserServiceTest {

    /**
     * <p>
     * Instance of {@link UserService}.
     * </p>
     */
    private UserService userService;

    /**
     * <p>
     * Test method for {@link UserService#get(long id)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can find a User by userId</li>
     * </ol>
     * </p>
     */
    @Test
    public void testGet_Found() {
        long userId = 20L;
        String handle = "dok_tester";
        String email = "foo@fooonyou.com";

        try {
            UserDTO user = userService.get(userId);
            assertTrue(user != null);
            assertTrue(user.getHandle().equals(handle));
            assertTrue(user.getEmailAddress().equals(email));
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for {@link UserService#get(long id)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can not find a User by userId</li>
     * </ol>
     * </p>
     */
    @Test
    public void testGet_NotFound() {
        long userId = 23238434L;

        try {
            assertTrue(userService.get(userId) == null);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for {@link UserService#search(handle)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can find User by handle</li>
     * </ol>
     * </p>
     */
    @Test
    public void testSearch_Found() {
        String handle = "dok_tester";

        try {
            List<UserDTO> users = userService.search(handle);
            assertTrue(users.size() > 0);
            assertTrue(users.get(0).getHandle().indexOf(handle) > -1);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for {@link UserService#search(handle)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can find multiple Users by handle</li>
     * </ol>
     * </p>
     */
    @Test
    public void testSearch_FoundMultiple() {
        String handle = "h";

        try {
            List<UserDTO> users = userService.search(handle);
            assertTrue(users.size() == 9);
            assertTrue(users.get(0).getHandle().indexOf("h") > -1);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for {@link UserService#search(handle)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can not find User by handle</li>
     * </ol>
     * </p>
     */
    @Test
    public void testSearch_NotFound() {
        String handle = "heffan_not_exists_handle";

        try {
            assertTrue(userService.search(handle).size() == 0);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * Setter of userService
     * 
     * @param userService
     *            the Spring injected userService
     */
    @Resource
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

}
