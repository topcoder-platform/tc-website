/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.mockup.MockupData;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;

import java.io.File;

import junit.framework.TestCase;

/**
 * Unit tests for the SubmitFinalFix class.
 *
 * @author adic
 * @version 1.0
 */
public class SubmitFinalFixTestCase extends TestCase {

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
     * Test save document (submit final fix).
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testSaveDocument() throws Exception {
        SecurityEnabledUser user = ((LoginResult) new Login().start(new LoginData("user3", "secret"))).getUser();
        ProjectsRetrieval projectsRetrieval =
                (ProjectsRetrieval) new ViewMyOpenProjects().start(new OnlineReviewData(user));
        assertTrue(projectsRetrieval.getProjects().length == 1);
        UserProjectInfo proj = projectsRetrieval.getProjects()[0];

        ScreenProjectTestCase.setPhase(proj, MockupData.phases[4]);
        ResultData result = new SubmitFinalFix().start(new SolutionData(new OnlineReviewProjectData(user, proj), null, //sol.getSolutions()[0],
                new File("test_files/test.jar")));
        assertTrue(result instanceof SuccessResult);
    }

}

