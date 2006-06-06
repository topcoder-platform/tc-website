/*
 * TCS Online Review Application
 *
 * ProjectTrackerAccuracyTests.java
 *
 * Copyright (c) 2003 TopCoder, Inc.  All rights reserved.
 */

package com.topcoder.apps.review.accuracytests;

import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.projecttracker.ProjectTrackerLocal;
import com.topcoder.apps.review.projecttracker.ProjectTrackerLocalHome;
import com.topcoder.apps.review.projecttracker.UserRole;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import com.topcoder.apps.review.projecttracker.PaymentInfo;
import com.topcoder.apps.review.projecttracker.PaymentStatus;
import com.topcoder.apps.review.projecttracker.Phase;
import com.topcoder.apps.review.projecttracker.PhaseInstance;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.ProjectType;
import com.topcoder.apps.review.projecttracker.ReviewerResponsibility;
import com.topcoder.apps.review.projecttracker.Role;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Date;
import java.util.Random;
import java.util.StringTokenizer;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import junit.extensions.TestSetup;
import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

public class ProjectTrackerAccuracyTests extends TestCase {

    static User adminUser;
    private static User activeUser;
    private static User inactiveUser;

    private static Project project1;
    private static Project project2;
    private static Project project3;

    private static Random rand = new Random();
    private static AccuracyTestUtils utils;
    private PTProxy tracker;

    static {
        try {
            utils = new AccuracyTestUtils();
        } catch (Exception e) {
            throw new IllegalStateException(
                    "Could not initialize test utilities");
        }
    }

    public ProjectTrackerAccuracyTests(String testName) {
        super(testName);
    }

    public void setUp() throws Exception {
        super.setUp();
        tracker = new Sub2PTProxy();
    }

    public void tearDown() throws Exception {
        tracker.remove();
        super.tearDown();
    }

    public void testGetProjectInfo_User() throws Exception {
        // test gets correct UPIs
        assertNotNull("Admin user object is null", adminUser);
        UserProjectInfo[] info = tracker.getProjectInfo(adminUser);

        assertNotNull("UPI array is null", info);
        assertEquals("Wrong number of UPIs retrieved", 3, info.length);
        assertProjectFound(info, project1);
        assertProjectFound(info, project2);
        assertProjectFound(info, project3);

        info = tracker.getProjectInfo(activeUser);
        assertNotNull("UPI array is null", info);
        assertEquals("UPI array has extraneous elements", 0, info.length);

        // -- Assign user roles (or not)
        tracker.assignUserRole(activeUser, new Role(2L, ""), null, project2);
        tracker.saveProject(project2, "assigned user role", adminUser);

        // -- getProjectInfo
        info = tracker.getProjectInfo(activeUser);
        assertNotNull("UPI array is null", info);
        assertEquals("Wrong number of UPIs retrieved", 1, info.length);

        // -- verify  (check is latest info)
        assertProjectFound(info, project2);
    }

    public void testGetProject_UPI() throws Exception {
        Project proj = tracker.getProject(new DummyUPI(project3.getId()));
        assertNotNull("Project not successfully retrieved", proj);
        assertProjectsMatch(project3, proj);
    }

    public void testGetProject_long_User() throws Exception {
        Project proj = tracker.getProject(project2.getId(), adminUser);
        Project proj2;

        assertNotNull("Project not successfully retrieved", proj);
        assertProjectsMatch(project2, proj);
        proj.setNotes("Modified the project for testing purposes.");
/*
        Not used
        proj.setProjectInformationURL(
                new URL("http://www.topcoder.com/info.html"));
 */
        tracker.saveProject(proj, "Modified for testing purposes", adminUser);
        proj2 = tracker.getProject(proj.getId(), adminUser);
        assertProjectsMatch(proj, proj2);
    }

    // saveProject tested along with getProject

    private void assertProjectsMatch(Project p1, Project p2) {
        Comparator roleComparator = new Comparator() {
            public int compare(Object o1, Object o2) {
                UserRole ur1 = (UserRole) o1;
                UserRole ur2 = (UserRole) o2;
                long id1 = ur1.getId();
                long id2 = ur2.getId();

                if (id1 < id2) {
                    return -1;
                } else if (id1 > id2) {
                    return 1;
                } else {
                    return 0;
                }
            }
        };

        assertEquals("Ids don't match", p1.getId(), p2.getId());
        PhaseInstance[] pi1 = p1.getTimeline();
        PhaseInstance[] pi2 = p2.getTimeline();
        assertEquals("Number of phases doesn't match", pi1.length, pi2.length);
        for (int i = 0; i < pi1.length; i++) {
            assertPIsMatch(pi1[i], pi2[i]);
        }
        assertEquals("Manager IDs don't match", p1.getProjectManager().getId(),
                p2.getProjectManager().getId());
        assertEquals("Project names don't match", p1.getName(), p2.getName());
        assertEquals("Project versions don't match", p1.getVersion(),
                p2.getVersion());
        assertEquals("Phase IDs don't match",
                p1.getCurrentPhase().getId(),
                p2.getCurrentPhase().getId());
        assertEquals("Winner IDs don't match", p1.getProjectManager().getId(),
                p2.getProjectManager().getId());
        URL u1 = p1.getProjectInformationURL();
        URL u2 = p2.getProjectInformationURL();
        if (u1 == null) {
            assertNull("URLs don't match", u2);
        } else {
            assertNotNull("URLs don't match", u2);
            assertEquals("URLs don't match",
                    p1.getProjectInformationURL().toString(),
                    p2.getProjectInformationURL().toString());
        }
        UserRole[] roles1 = p1.getParticipants();
        UserRole[] roles2 = p2.getParticipants();
        assertEquals("Numbers of participants don't match",
                roles1.length, roles2.length);
        Arrays.sort(roles1, roleComparator);
        Arrays.sort(roles2, roleComparator);
        for (int i = 0; i < roles1.length; i++) {
            assertEquals("Participants don't match", roles1[i].getId(),
                    roles2[i].getId());
        }
        assertEquals("Overviews don't match", p1.getOverview(),
                p2.getOverview());
        assertEquals("Notes don't match", p1.getNotes(), p2.getNotes());
        assertEquals("Project types don't match", p1.getProjectType().getId(),
                p2.getProjectType().getId());
    }

    private void assertPIsMatch(PhaseInstance in1, PhaseInstance in2) {
        assertEquals("Phase IDs don't match", in1.getPhase().getId(),
                in2.getPhase().getId());
        assertEquals("Start dates don't match", in1.getStartDate(),
                in2.getStartDate());
        assertEquals("End dates don't match", in1.getEndDate(),
                in2.getEndDate());
    }

    private void assertProjectFound(UserProjectInfo[] info, Project proj)
            throws Exception {
        long pid = proj.getId();

        for (int i = 0; i < info.length; i++) {
            if (info[i].getId() == pid) {
                assertEquals("UPI name incorrect", proj.getName(),
                        info[i].getProjectName());
                assertEquals("UPI version incorrect", proj.getVersion(),
                        info[i].getProjectVersion());
                return;
            }
        }
        fail("Expected project not found");
    }

    public static Test suite() throws Exception {
        return new Setup(new TestSuite(ProjectTrackerAccuracyTests.class));
    }

    private static class Setup extends TestSetup {

        public Setup(Test test) throws Exception {
            super(test);
        }

        public void setUp() throws Exception {
            super.setUp();
            Sub2PTProxy pt = new Sub2PTProxy();
            User[] users = utils.getUsers(3);

            /*
             * The actual user information doesn't much matter, as long as the
             * users are different from each other.  First skip some users that
             * might be used by other tests.
             */
            adminUser = users[0];
            activeUser = users[1];
            inactiveUser = users[2];

            Sub2PTProxy.adminUser = adminUser;

            project1 = pt.createProject("Project 1", "12.2.3", adminUser);
            assertNotNull("Failed to create project 1", project1);
            project2 = pt.createProject("Project 2", "7.6", adminUser);
            assertNotNull("Failed to create project 2", project2);
            project3 = pt.createProject("Project 3", "0.2", adminUser);
            assertNotNull("Failed to create project 3", project3);

            pt.remove();
        }

        public void tearDown() throws Exception {
            Connection con = utils.getConnection();

            try {
                Sub2PTProxy.removeProject(project1, con);
                Sub2PTProxy.removeProject(project2, con);
                Sub2PTProxy.removeProject(project3, con);
            } finally {
                con.close();
            }

            super.tearDown();
        }
    }
}
