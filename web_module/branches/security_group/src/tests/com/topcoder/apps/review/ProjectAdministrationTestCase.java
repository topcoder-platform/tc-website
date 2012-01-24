/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.projecttracker.Phase;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import junit.framework.TestCase;
import com.topcoder.apps.review.mockup.MockupData;

/**
 * Unit tests for the ProjectAdministration class.
 *
 * @author adic
 * @version 1.0
 */
public class ProjectAdministrationTestCase extends TestCase {

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
     * Test contact document.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testAdminister() throws Exception {
        SecurityEnabledUser user = ((LoginResult) new Login().start(new LoginData("marc", "secret"))).getUser();
        ProjectsRetrieval projectsRetrieval =
                (ProjectsRetrieval) new ViewAllProjects().start(new OnlineReviewData(user));
        assertTrue(projectsRetrieval.getProjects().length == 5);

        ResultData result =
                new ProjectDetail().start(new OnlineReviewProjectData(user, projectsRetrieval.getProjects()[0]));
        assertTrue(result instanceof ProjectRetrieval);
        Project project = ((ProjectRetrieval) result).getProject();

        Phase[] phases = MockupData.phs;
        for (int i = 0; i < phases.length; i++) {
            project.setCurrentPhase(phases[i]);
            result = new ProjectAdministration().start(new ProjectData(new OnlineReviewData(user), project, "reason", null));
            String msg = result instanceof FailureResult ? ((FailureResult) result).getMessage() : "";
            assertTrue(msg, result instanceof SuccessResult);
        }
    }

}

