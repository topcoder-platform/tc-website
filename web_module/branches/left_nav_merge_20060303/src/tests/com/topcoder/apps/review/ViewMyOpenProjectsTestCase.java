/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import junit.framework.TestCase;

/**
 * Unit tests for the ViewMyOpenProjects class.
 *
 * @author adic
 * @version 1.0
 */
public class ViewMyOpenProjectsTestCase extends TestCase {

    /**
     * Method setUp.
     */
    public void setUp() {
        EJBHelper.setTestMode(true);
    }

    /**
     * Method tearDown.
     */
    public void tearDown() {
        EJBHelper.setTestMode(false);
    }

    /**
     * Test for admin. Should return 2 projects.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testForAdmin1() throws Exception {
        SecurityEnabledUser user = ((LoginResult) new Login().start(new LoginData("marc", "secret"))).getUser();
        ResultData result = new ViewMyOpenProjects().start(new OnlineReviewData(user));
        assertTrue(result instanceof ProjectsRetrieval);
        ProjectsRetrieval projectsRetrieval = (ProjectsRetrieval) result;
        assertNotNull(projectsRetrieval.getProjects());
        assertEquals(projectsRetrieval.getProjects().length, 2);
    }

    /**
     * Test for admin. Should return 3 projects.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testForAdmin2() throws Exception {
        SecurityEnabledUser user = ((LoginResult) new Login().start(new LoginData("dave", "secret"))).getUser();
        ResultData result = new ViewMyOpenProjects().start(new OnlineReviewData(user));
        assertTrue(result instanceof ProjectsRetrieval);
        ProjectsRetrieval projectsRetrieval = (ProjectsRetrieval) result;
        assertNotNull(projectsRetrieval.getProjects());
        assertEquals(projectsRetrieval.getProjects().length, 3);
    }

    /**
     * Test for non-admin. Should return 1 projects.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testForNonAdmin1() throws Exception {
        SecurityEnabledUser user = ((LoginResult) new Login().start(new LoginData("user1", "secret"))).getUser();
        ResultData result = new ViewMyOpenProjects().start(new OnlineReviewData(user));
        assertTrue(result instanceof ProjectsRetrieval);
        ProjectsRetrieval projectsRetrieval = (ProjectsRetrieval) result;
        assertNotNull(projectsRetrieval.getProjects());
        assertTrue(projectsRetrieval.getProjects().length == 3);
    }

    /**
     * Test for non-admin. Should return 2 projects.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testForNonAdmin2() throws Exception {
        SecurityEnabledUser user = ((LoginResult) new Login().start(new LoginData("user2", "secret"))).getUser();
        ResultData result = new ViewMyOpenProjects().start(new OnlineReviewData(user));
        assertTrue(result instanceof ProjectsRetrieval);
        ProjectsRetrieval projectsRetrieval = (ProjectsRetrieval) result;
        assertNotNull(projectsRetrieval.getProjects());
        assertTrue(projectsRetrieval.getProjects().length == 2);
    }

    /**
     * Test bad request.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testBadRequest() throws Exception {
        ResultData result = new ViewMyOpenProjects().start(new ActionData() {
        });
        assertTrue(result instanceof FailureResult);
    }

}

