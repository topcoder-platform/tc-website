/**
 * Copyright (c) 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.math.matrix.MathMatrix;
import junit.framework.TestCase;

/**
 * Unit tests for the ScoringHelper class.
 *
 * @author adic
 * @version 1.0
 */
public class ScoringHelperTestCase extends TestCase {

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
    public void testCalculation() throws Exception {
        SecurityEnabledUser user = ((LoginResult) new Login().start(new LoginData("marc", "secret"))).getUser();
        ProjectsRetrieval projectsRetrieval =
                (ProjectsRetrieval) new ViewAllProjects().start(new OnlineReviewData(user));
        assertTrue(projectsRetrieval.getProjects().length == 5);
        ResultData result =
                new RetrieveReviewScorecards().start(new ReviewScorecardsData(new OnlineReviewProjectData(user, projectsRetrieval.getProjects()[0])));
        assertTrue(result instanceof ReviewScorecardsRetrieval);
        ReviewScorecardsRetrieval scorecards = (ReviewScorecardsRetrieval) result;
        assertTrue(scorecards.getScorecards().length == 3);

        MathMatrix mm = new ScoringHelper().calculateScore(scorecards.getScorecards()[0]);
        assertTrue(Math.abs(mm.getWeightedScore() - 90.0) < 1e8);
        mm = new ScoringHelper().calculateScore(scorecards.getScorecards()[1]);
        assertTrue(Math.abs(mm.getWeightedScore() - 83.1) < 1e8);
        mm = new ScoringHelper().calculateScore(scorecards.getScorecards()[2]);
        assertTrue(Math.abs(mm.getWeightedScore() - 56.2) < 1e8);

        double score = new ScoringHelper().calculateScore(scorecards.getScorecards());
        assertTrue(Math.abs(score - (90.0 + 83.1 + 56.2) / 3) < 1e8);
    }

}

