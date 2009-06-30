/*
 * TCS Online Review Application
 *
 * UserManagerAccuracyTests.java
 *
 * Copyright (c) 2003  Topcoder, Inc.  All rights reserved.
 */

package com.topcoder.apps.review.accuracytests;

import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.security.TCSubject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

/**
 * A JUnit test case that makes use of JUnitEE to test the UserManager
 * bean running in the application server.
 *
 * @author ThinMan
 * @version 1.0
 */
public class UserManagerAccuracyTests extends TestCase {

    private final static int NUMBER_TO_TEST = 16;

    /** An instance of the utility class */
    private AccuracyTestUtils utils;

    /**
     * A Proxy for the real UserManager to hide the differing details between
     * implementations
     */
    private UMProxy manager;

    /**
     * Constructs a new UserManagerAccuracyTests configured to run the named
     * test
     *
     * @param  testName a String containing the name of the test to run
     */
    public UserManagerAccuracyTests(String testName) {
        super(testName);
    }

    /**
     * Sets up this TestCase to run a test.
     */
    public void setUp() throws Exception {
        super.setUp();
        utils = new AccuracyTestUtils();
        manager = new Sub2UMProxy();
    }

    /**
     * Cleans up after the test.
     */
    public void tearDown() throws Exception {
        manager.remove();
        utils.close();
        super.tearDown();
    }

    /**
     * Exercises the getUser method of the UserManager bean to verify that it
     * obtains the correct data from the database
     */
    public void testGetUser_TCSubject() throws Exception {
        User[] users = utils.getUsers(NUMBER_TO_TEST);

        for (int i = 0; i < NUMBER_TO_TEST; i++) {
            System.out.println("Testing user " + users[i].getId());
            assertUsersMatch(users[i],
                    manager.getUser(new TCSubject(users[i].getId())));
        }
    }

    /**
     * Compares two Users to verify that all their fields match
     *
     * @param  u1 the first User to compare
     * @param  u2 the second User to compare
     */
    public static void assertUsersMatch(User u1, User u2) {
        assertNotNull("First user is null", u1);
        assertNotNull("Second user is null", u2);
        assertEquals("User IDs don't match", u1.getId(), u2.getId());
        assertEquals("User Handles don't match", u1.getHandle(),
                u2.getHandle());
        assertEquals("User First Names don't match", u1.getFirstName(),
                u2.getFirstName());
        assertEquals("User Last Names don't match", u1.getLastName(),
                u2.getLastName());
        assertEquals("User E-mails don't match", u1.getEmail(), u2.getEmail());
    }

    /**
     * Creates a JUnit Test suitable for running all the tests in this class.
     *
     * @return  a JUnit Test with which to run all the tests defined by this
     *          class
     */
    public static Test suite() {
        return new TestSuite(UserManagerAccuracyTests.class);
    }
}

