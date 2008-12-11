/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.mockup.MockupData;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import junit.framework.TestCase;

/**
 * Unit tests for the FinalReview class.
 *
 * @author adic
 * @version 1.0
 */
public class FinalReviewTestCase extends TestCase {

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

        ResultData result = new FinalReview().start(new FinalReviewData(new OnlineReviewProjectData(user, proj), null));
        assertTrue(result instanceof FinalReviewRetrieval);
        FinalReviewRetrieval ffr = (FinalReviewRetrieval) result;
        assertNotNull(ffr.getFinalReview());
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

        ResultData result = new FinalReview().start(new FinalReviewData(new OnlineReviewProjectData(user, proj), null));
        assertTrue(result instanceof FinalReviewRetrieval);
        FinalReviewRetrieval ffr = (FinalReviewRetrieval) result;
        assertNotNull(ffr.getFinalReview());

        ScreenProjectTestCase.setPhase(proj, MockupData.phases[5]);
        result = new FinalReview().start(new FinalReviewData(new OnlineReviewProjectData(user, proj), ffr.getFinalReview()));
        assertTrue(result instanceof SuccessResult);
    }

}

