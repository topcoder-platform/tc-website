/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.mockup.MockupData;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import junit.framework.TestCase;

/**
 * Unit tests for the ReviewProject class.
 *
 * @author adic
 * @version 1.0
 */
public class ReviewProjectTestCase extends TestCase {

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
     * Test get document.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testGetDocument() throws Exception {
        SecurityEnabledUser user = ((LoginResult) new Login().start(new LoginData("user1", "secret"))).getUser();
        ProjectsRetrieval projectsRetrieval =
                (ProjectsRetrieval) new ViewMyOpenProjects().start(new OnlineReviewData(user));
        assertTrue(projectsRetrieval.getProjects().length == 3);
        UserProjectInfo proj = projectsRetrieval.getProjects()[0];
        User user3 = ((LoginResult) new Login().start(new LoginData("user3", "secret"))).getUser();

        ResultData result = new ReviewProject().start(new ReviewData(new OnlineReviewProjectData(user, proj), user3.getId(), user.getId(), null));
        assertTrue(result instanceof ReviewScorecardRetrieval);
        ReviewScorecardRetrieval scorecard = (ReviewScorecardRetrieval) result;
        assertNotNull(scorecard.getScoreCard());
    }

    /**
     * Test save document.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testSaveDocument() throws Exception {
        SecurityEnabledUser user = ((LoginResult) new Login().start(new LoginData("user1", "secret"))).getUser();
        ProjectsRetrieval projectsRetrieval =
                (ProjectsRetrieval) new ViewMyOpenProjects().start(new OnlineReviewData(user));
        assertTrue(projectsRetrieval.getProjects().length == 3);
        UserProjectInfo proj = projectsRetrieval.getProjects()[0];
        User user3 = ((LoginResult) new Login().start(new LoginData("user3", "secret"))).getUser();

        ResultData result = new ReviewProject().start(new ReviewData(new OnlineReviewProjectData(user, proj), user3.getId(), user.getId(), null));
        assertTrue(result instanceof ReviewScorecardRetrieval);
        ReviewScorecardRetrieval scorecard = (ReviewScorecardRetrieval) result;
        assertNotNull(scorecard.getScoreCard());

        ScreenProjectTestCase.setPhase(proj, MockupData.phases[2]);
        result = new ReviewProject().start(new ReviewData(new OnlineReviewProjectData(user, proj), user3.getId(), user.getId(), scorecard.getScoreCard()));
        assertTrue(result instanceof SuccessResult);
    }

}

