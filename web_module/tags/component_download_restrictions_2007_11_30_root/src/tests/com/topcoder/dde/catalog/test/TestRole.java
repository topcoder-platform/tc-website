/*
 * TestRole.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.Role;
import junit.framework.*;

public class TestRole extends TestCase {

    private final static String ROLE_NAME = "Devil's Advocate";
    private final static String ROLE_DESCRIPTION =
            "all in the name of good software";

    private Role testRole;

    public TestRole(String testName) {
        super(testName);
    }

    public void setUp() throws Exception {
        super.setUp();
        testRole = new Role(ROLE_NAME, ROLE_DESCRIPTION);
    }

    /*
     * getName and getDescription methods tested implicitly in the constructor
     * and setter method tests.  getId not tested because there is no good way
     * to determine the correct return value.
     */

    public void testConstructor() {
        assertNotNull("test role is null", testRole);
        assertEquals("Wrong name", ROLE_NAME, testRole.getName());
        assertEquals("Wrong description", ROLE_DESCRIPTION,
                testRole.getDescription());
    }

    public void testConstr_NullName() {
        try {
            testRole = new Role(null, ROLE_DESCRIPTION);
            fail("Accepted null role name");
        } catch (IllegalArgumentException iae) {
            /* the expected behavior */
        }
    }

    public void testConstr_NullDesc() {
        try {
            testRole = new Role(ROLE_NAME, null);
            fail("Accepted null role description");
        } catch (IllegalArgumentException iae) {
            /* the expected behavior */
        }
    }

    public void testEquals() {
        Role role2 = new Role(ROLE_NAME, ROLE_DESCRIPTION);
        Role role3 = new Role("", ROLE_DESCRIPTION);
        Role role4 = new Role(ROLE_NAME, "");
        assertEquals("Equality failure", testRole, role2);
        assertTrue("Inequality failure", !testRole.equals(role3));
        assertTrue("Inequality failure", !testRole.equals(role4));
    }

    public void testHashCode_ConsistentWithEquals() {
        Role role2 = new Role(ROLE_NAME, ROLE_DESCRIPTION);
        Role role3 = new Role("", ROLE_DESCRIPTION);
        assertEquals("Hash codes should match", testRole.hashCode(),
                role2.hashCode());
        assertTrue("Hash codes should not match",
                testRole.hashCode() != role3.hashCode());
    }

    public void testSetDescription() {
        testRole.setDescription("Foo rules!");
        assertEquals("Description not set correctly", "Foo rules!",
                testRole.getDescription());
    }

    public void testSetDescription_Null() {
        try {
            testRole.setDescription(null);
            fail("Accepted null role description");
        } catch (IllegalArgumentException iae) {
            /* the expected behavior */
        }
    }

    public void testSetName() {
        testRole.setName("Foo Evangelist");
        assertEquals("Name not set correctly", "Foo Evangelist",
                testRole.getName());
    }

    public void testSetName_Null() {
        try {
            testRole.setName(null);
            fail("Accepted null role name");
        } catch (IllegalArgumentException iae) {
            /* the expected behavior */
        }
    }

    public void testToString() {
        assertNotNull(testRole.toString());  // not much we can test
    }
}