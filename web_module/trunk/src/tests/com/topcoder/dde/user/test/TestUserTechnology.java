/*
 * TestUserTechnology.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.user.test;

import com.topcoder.dde.user.*;
import junit.framework.*;

/**
 * a JUnit TestCase that exercises the UserTechnology class.  These tests assume
 * UserTechnology to be a dumb container without validation logic, and merely
 * verify that the values with which one is constructed are the values its
 * accessor methods return.
 */
public class TestUserTechnology extends TestCase {

    final static long DEF_TECH_ID = 1721L;
    final static int DEF_RATING = 17;
    final static int DEF_MONTHS = 21;

    protected UserTechnology tech;

    public void setUp() {
        tech = new UserTechnology(DEF_TECH_ID, DEF_RATING, DEF_MONTHS);
    }

    public TestUserTechnology(String testName) {
        super(testName);
    }

    public void testGetMonths() {
        assertEquals("Wrong # months", DEF_MONTHS, tech.getMonths());
    }

    public void testGetRating() {
        assertEquals("Wrong rating", DEF_RATING, tech.getRating());
    }

    public void testGetTechnologyId() {
        assertEquals("Wrong id", DEF_TECH_ID, tech.getTechnologyId());
    }

    public static Test suite() {
        return new TestSuite(TestUserTechnology.class);
    }
}