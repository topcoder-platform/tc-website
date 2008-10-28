/*
 * TestForum.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.Forum;

import java.util.Date;

import junit.framework.Test;
import junit.framework.TestSuite;

/**
 * a JUnit test case that excerises the Forum class
 *
 * @author  John C. Bollinger
 * @version 1.0
 */
public class TestForum extends RemoteCatalogTestCase {

    private Forum forum;

    public TestForum(String testName) {
        super(testName);
    }

    public void setUp() throws Exception {
        super.setUp();
        forum = manager.getForum(Forum.COLLABORATION);
    }

    public void testEquals() throws Exception {
        assertEquals("Forums expected to be equal", forum,
                manager.getForum(Forum.COLLABORATION));
    }

    public void testGetCloseDate() throws Exception {
        assertNull("Expected null", forum.getCloseDate());
    }

    public void testGetStartDate() throws Exception {
        Date sd = forum.getStartDate();
        assertTrue("Bad forum start date", requestDate1.compareTo(sd) < 0);
        assertTrue("Bad forum start date", requestDate2.compareTo(sd) > 0);
    }

    public void testGetStatus() throws Exception {
        assertEquals("Wrong forum status", Forum.ACTIVE, forum.getStatus());
    }

    public void testGetVersion() throws Exception {
        assertEquals("Wrong version", 1L, forum.getVersion());
    }

    public void testGetVersionLabel() throws Exception {
        assertEquals("Wrong version", DEF_COMP_VERSION,
                forum.getVersionLabel());
    }

    public void testToString() throws Exception {
        assertNotNull(forum.toString());
    }

    public static Test suite() {
        return new CatalogTestSetup(new TestSuite(TestForum.class));
    }

}