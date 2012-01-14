/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import junit.framework.TestCase;

/**
 * Unit tests for the ViewAllProjects class.
 *
 * @author adic
 * @version 1.0
 */
public class ViewAllProjectsTestCase extends TestCase {

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
     * Test for admin. Should return 5 projects.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testForAdmin() throws Exception {
        SecurityEnabledUser user = ((LoginResult) new Login().start(new LoginData("marc", "secret"))).getUser();
        ResultData result = new ViewAllProjects().start(new OnlineReviewData(user));
        assertTrue(result instanceof ProjectsRetrieval);
        ProjectsRetrieval projectsRetrieval = (ProjectsRetrieval) result;
        assertNotNull(projectsRetrieval.getProjects());
        assertTrue(projectsRetrieval.getProjects().length == 5);
    }

    /**
     * Test for non-admin. Should fail.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testForNonAdmin() throws Exception {
        SecurityEnabledUser user = ((LoginResult) new Login().start(new LoginData("user1", "secret"))).getUser();
        ResultData result = new ViewAllProjects().start(new OnlineReviewData(user));
        assertTrue(result instanceof FailureResult);
    }

    /**
     * Test bad request.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testBadRequest() throws Exception {
        ResultData result = new ViewAllProjects().start(new ActionData() {
        });
        assertTrue(result instanceof FailureResult);
    }

}

