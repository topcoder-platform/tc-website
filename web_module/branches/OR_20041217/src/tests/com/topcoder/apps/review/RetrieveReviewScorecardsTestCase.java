/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import junit.framework.TestCase;

/**
 * Unit tests for the RetrieveReviewScorecards class.
 *
 * @author adic
 * @version 1.0
 */
public class RetrieveReviewScorecardsTestCase extends TestCase {

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
     * Test for admin.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testForAdmin() throws Exception {
        SecurityEnabledUser user = ((LoginResult) new Login().start(new LoginData("marc", "secret"))).getUser();
        ProjectsRetrieval projectsRetrieval =
            (ProjectsRetrieval) new ViewAllProjects().start(new OnlineReviewData(user));
        assertTrue(projectsRetrieval.getProjects().length == 5);
        ResultData result =
            new RetrieveReviewScorecards().start(new ReviewScorecardsData(new OnlineReviewProjectData(user, projectsRetrieval.getProjects()[0])));
        assertTrue(result instanceof ReviewScorecardsRetrieval);
        ReviewScorecardsRetrieval scorecards = (ReviewScorecardsRetrieval) result;
        assertTrue(scorecards.getScorecards().length == 3);
    }

    /**
     * Test for non-admin.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testForNonAdmin() throws Exception {
        SecurityEnabledUser user = ((LoginResult) new Login().start(new LoginData("user1", "secret"))).getUser();
        ProjectsRetrieval projectsRetrieval =
            (ProjectsRetrieval) new ViewMyOpenProjects().start(new OnlineReviewData(user));
        assertTrue(projectsRetrieval.getProjects().length == 3);
        ResultData result =
            new RetrieveReviewScorecards().start(new ReviewScorecardsData(new OnlineReviewProjectData(user, projectsRetrieval.getProjects()[0])));
        assertTrue(result instanceof ReviewScorecardsRetrieval);
        ReviewScorecardsRetrieval scorecards = (ReviewScorecardsRetrieval) result;
        assertTrue(scorecards.getScorecards().length == 3);
    }

    /**
     * Test for user without proper permissions.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testBadRequest1() throws Exception {
        SecurityEnabledUser user = ((LoginResult) new Login().start(new LoginData("user1", "secret"))).getUser();
        ProjectsRetrieval projectsRetrieval =
            (ProjectsRetrieval) new ViewMyOpenProjects().start(new OnlineReviewData(user));
        assertTrue(projectsRetrieval.getProjects().length == 3);
        SecurityEnabledUser user2 = ((LoginResult) new Login().start(new LoginData("user2", "secret"))).getUser();
        ResultData result =
            new RetrieveReviewScorecards().start(new ReviewScorecardsData(new OnlineReviewProjectData(user2, projectsRetrieval.getProjects()[0])));
        assertTrue(result instanceof FailureResult);
    }

    /**
     * Test bad request.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testBadRequest2() throws Exception {
        ResultData result = new RetrieveReviewScorecards().start(new ActionData() { });
        assertTrue(result instanceof FailureResult);
    }

}

