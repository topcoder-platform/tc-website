/*
 * TestTechnology.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.Technology;
import junit.framework.*;

public class TestTechnology extends TestCase {

    private final static String TECHNOLOGY_NAME = "Fire";
    private final static String TECHNOLOGY_DESCRIPTION =
            "handy for heating things";

    private Technology testTechnology =
            new Technology(TECHNOLOGY_NAME, TECHNOLOGY_DESCRIPTION);

    public TestTechnology(String testName) {
        super(testName);
    }

    /*
     * getName and getDescription methods tested implicitly in the constructor
     * and setter method tests.  getId not tested because there is no good way
     * to determine the correct return value.
     */

    public void testConstructor() {
        assertNotNull("test technology is null", testTechnology);
        assertEquals("Wrong name", TECHNOLOGY_NAME, testTechnology.getName());
        assertEquals("Wrong description", TECHNOLOGY_DESCRIPTION,
                testTechnology.getDescription());
    }

    public void testConstr_NullName() {
        try {
            testTechnology = new Technology(null, TECHNOLOGY_DESCRIPTION);
            fail("Accepted null technology name");
        } catch (IllegalArgumentException iae) {
            /* the expected behavior */
        }
    }

    public void testConstr_NullDesc() {
        try {
            testTechnology = new Technology(TECHNOLOGY_NAME, null);
            fail("Accepted null role description");
        } catch (IllegalArgumentException iae) {
            /* the expected behavior */
        }
    }

    public void testEquals() {
        Technology role2 = new Technology(TECHNOLOGY_NAME, TECHNOLOGY_DESCRIPTION);
        Technology role3 = new Technology("", TECHNOLOGY_DESCRIPTION);
        Technology role4 = new Technology(TECHNOLOGY_NAME, "");
        assertEquals("Equality failure", testTechnology, role2);
        assertTrue("Inequality failure", !testTechnology.equals(role3));
        assertTrue("Inequality failure", !testTechnology.equals(role4));
    }

    public void testHashCode_ConsistentWithEquals() {
        Technology role2 = new Technology(TECHNOLOGY_NAME, TECHNOLOGY_DESCRIPTION);
        Technology role3 = new Technology("", TECHNOLOGY_DESCRIPTION);
        assertEquals("Hash codes should match", testTechnology.hashCode(),
                role2.hashCode());
        assertTrue("Hash codes should not match",
                testTechnology.hashCode() != role3.hashCode());
    }

    public void testSetDescription() {
        testTechnology.setDescription("Fire rules!");
        assertEquals("Description not set correctly", "Fire rules!",
                testTechnology.getDescription());
    }

    public void testSetDescription_Null() {
        try {
            testTechnology.setDescription(null);
            fail("Accepted null technology description");
        } catch (IllegalArgumentException iae) {
            /* the expected behavior */
        }
    }


    public void testSetName() {
        testTechnology.setName("Stone Axe");
        assertEquals("Name not set correctly", "Stone Axe",
                testTechnology.getName());
    }

    public void testSetName_Null() {
        try {
            testTechnology.setName(null);
            fail("Accepted null technology name");
        } catch (IllegalArgumentException iae) {
            /* the expected behavior */
        }
    }

    public void testToString() {
        assertNotNull(testTechnology.toString());  // not much we can test
    }
}