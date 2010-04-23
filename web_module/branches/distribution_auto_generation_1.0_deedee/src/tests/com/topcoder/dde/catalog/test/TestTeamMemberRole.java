/*
 * TestTeamMemberRole.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.Catalog;
import com.topcoder.dde.catalog.Role;
import com.topcoder.dde.catalog.TeamMemberRole;
import junit.framework.*;
import junit.framework.Test;
import junit.framework.TestSuite;

public class TestTeamMemberRole extends RemoteCatalogTestCase {

    private final static String ROLE_NAME = "Devil's Advocate";
    private final static String ROLE_DESCRIPTION =
            "all in the name of good software";
    private final static int RATING = 17;

    private Catalog catalog;
    private Role testRole;
    private Role testRole2;
    private TeamMemberRole testTeamMemberRole;

    public TestTeamMemberRole(String testName) {
        super(testName);
    }

    public void setUp() throws Exception {
        super.setUp();
        catalog = catalogHome.create();
        testRole = catalog.addRole(new Role(ROLE_NAME, ROLE_DESCRIPTION));
        testRole2 = catalog.addRole(new Role(ROLE_NAME + " 2", ROLE_DESCRIPTION));
        testTeamMemberRole = new TeamMemberRole(defaultUser, testRole, RATING);
    }

    public void tearDown() throws Exception {
        catalog.removeRole(testRole.getId());
        catalog.remove();
        super.tearDown();
    }

    /*
     * getName and getDescription methods tested implicitly in the constructor
     * and setter method tests.  getId not tested because there is no good way
     * to determine the correct return value.
     */

    public void testConstructor() {
        assertNotNull("test team member role is null", testTeamMemberRole);
        assertEquals("Wrong role name", ROLE_NAME,
                testTeamMemberRole.getRoleName());
        assertEquals("Wrong description", ROLE_DESCRIPTION,
                testTeamMemberRole.getRoleDescription());
        assertEquals("Wrong TCS rating", RATING,
                testTeamMemberRole.getTCSRating());
        assertEquals("Wrong name", ROLE_NAME, testTeamMemberRole.getRoleName());
        assertNull("Wrong username", testTeamMemberRole.getUsername());

    }

    public void testConstr_NullUser() {
        try {
            testTeamMemberRole = new TeamMemberRole(null,
                    new Role(ROLE_NAME, ROLE_DESCRIPTION), RATING);
            fail("Accepted null user");
        } catch (IllegalArgumentException iae) {
            /* the expected behavior */
        }
    }

    public void testConstr_NullRole() {
        try {
            testTeamMemberRole = new TeamMemberRole(defaultUser, null, RATING);
            fail("Accepted null role");
        } catch (IllegalArgumentException iae) {
            /* the expected behavior */
        }
    }

    public void testEquals() {
        TeamMemberRole role2 = new TeamMemberRole(defaultUser, testRole, RATING);
        assertEquals("Equality failure", testTeamMemberRole, role2);
        role2 = new TeamMemberRole(defaultUser, testRole, 75003);
        assertTrue("Equality failure", !testTeamMemberRole.equals(role2));
        role2 = new TeamMemberRole(defaultUser, testRole2, RATING);
        assertTrue("Equality failure", !testTeamMemberRole.equals(role2));
    }

    public void testHashCode_ConsistentWithEquals() {
        TeamMemberRole role2 = new TeamMemberRole(defaultUser, testRole, RATING);
        assertEquals("Hash codes should match", testTeamMemberRole.hashCode(),
                role2.hashCode());
    }

    public void testToString() {
        assertNotNull(testTeamMemberRole.toString());  // not much we can test
    }

    public static Test suite() {
        return new CatalogTestSetup(new TestSuite(TestTeamMemberRole.class));
    }

}