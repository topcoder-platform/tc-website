/*
 * TestComponentManager_TeamMemberRole.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.Catalog;
import com.topcoder.dde.catalog.CatalogException;
import com.topcoder.dde.catalog.TeamMemberRole;

import java.util.Collection;
import java.util.Iterator;

import junit.framework.Test;
import junit.framework.TestSuite;

/**
 * a JUnit test case that exercises the TeamMemberRole management methods of the
 * ComponentManager EJB
 *
 * @author John C. Bollinger
 * @version 1.0
 */
public class TestComponentManager_TeamMemberRole
        extends RemoteComponentManagerTestCase {

    protected Catalog catalog;
    protected TeamMemberRole teamMemberRole;

    /**
     * constructs a new instance configured to run the named test
     *
     * @param  testName a <code>String</code> containing the name of the test
     *         to run
     */
    public TestComponentManager_TeamMemberRole(String testName) {
        super(testName);
    }

    public void setUp() throws Exception {
        super.setUp();
        teamMemberRole = new TeamMemberRole(defaultUser, memberRole,
                (int) (idGen.nextId() % (TeamMemberRole.MAX_RATING + 1)));
    }

    /**
     * tests the normal functioning of the addTeamMemberRole method
     */
    synchronized public void testAddTeamMemberRole() throws Exception {
        //System.out.println("Before add: " + teamMemberRole.toString());
        teamMemberRole = manager1.addTeamMemberRole(teamMemberRole);
        //System.out.println("After add: " + teamMemberRole.toString());
        Collection teamMemberRoles = manager1.getTeamMemberRoles();
        //System.out.println("All: " + teamMemberRoles);
        try {
            Iterator it;
            assertTrue("TeamMemberRole not added correctly",
                    teamMemberRoles.contains(teamMemberRole));
            it = teamMemberRoles.iterator();
            while (it.hasNext()) {
                Object o = it.next();
                if (teamMemberRole.equals(o)) {
                    TeamMemberRole tmr = (TeamMemberRole) o;
                    assertEquals("Wrong username",
                            defaultUser.getRegInfo().getUsername(),
                            tmr.getUsername());
                    break;
                }
            }
        } finally {
            manager1.removeTeamMemberRole(teamMemberRole.getId());
        }
    }

    /**
     * tests the functioning of the addTeamMemberRole method when a teamMemberRole matching
     * the argument already exists
     */
    synchronized public void testAddTeamMemberRole_Null() throws Exception {
        try {
            manager1.addTeamMemberRole(null);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

/*
 * Objecting to this case is not required
 *
    synchronized public void testAddTeamMemberRole_Assigned() throws Exception {
        TeamMemberRole role2 = manager1.addTeamMemberRole(teamMemberRole);
        try {
            manager1.addTeamMemberRole(teamMemberRole);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            // the expected case
        } finally {
            manager1.removeTeamMemberRole(role2.getId());
        }
    }
 */

    /*
     * getTeamMemberRoles tested implicitly throughout this test case
     */

    /**
     * tests the normal functioning of the removeTeamMemberRole method
     */
    synchronized public void testRemoveTeamMemberRole() throws Exception {
        Collection teamMemberRoles;

        teamMemberRole = manager1.addTeamMemberRole(teamMemberRole);
        manager1.removeTeamMemberRole(teamMemberRole.getId());
        teamMemberRoles = manager1.getTeamMemberRoles();

        assertTrue("TeamMemberRole not removed",
                !teamMemberRoles.contains(teamMemberRole));
    }

    /**
     * tests the functioning of the removeTeamMemberRole method when no
     * teamMemberRole matching the argument exists
     */
    public void testRemoveTeamMemberRole_Missing() throws Exception {
        try {
            manager1.removeTeamMemberRole(idGen.nextId());
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    /**
     * tests the functioning of the removeTeamMemberRole method when the
     * teamMemberRole matching the argument is not associated with the component
     * being managed
     */
    synchronized public void testRemoveTeamMemberRole_NotAssigned()
            throws Exception {
        Collection teamMemberRoles;

        teamMemberRole = manager2.addTeamMemberRole(teamMemberRole);
        manager1.removeTeamMemberRole(teamMemberRole.getId());
        teamMemberRoles = manager2.getTeamMemberRoles();
        assertTrue("TeamMemberRole not removed",
                !teamMemberRoles.contains(teamMemberRole));
    }

    public static Test suite() {
        return new ComponentManagerTestSetup(
                new TestSuite(TestComponentManager_TeamMemberRole.class));
    }

}
