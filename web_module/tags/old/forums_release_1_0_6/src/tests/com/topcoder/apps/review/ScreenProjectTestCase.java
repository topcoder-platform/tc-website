/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.mockup.MockupData;
import com.topcoder.apps.review.projecttracker.PhaseInstance;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;

import java.lang.reflect.Method;

import junit.framework.TestCase;

/**
 * Unit tests for the ScreenProject class.
 *
 * @author adic
 * @version 1.0
 */
public class ScreenProjectTestCase extends TestCase {

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

        ResultData result = new ScreenProject().start(new ScreeningData(new OnlineReviewProjectData(user, proj), user3.getId(), null));

        assertTrue(result instanceof ScreeningScorecardRetrieval);
        ScreeningScorecardRetrieval scorecard = (ScreeningScorecardRetrieval) result;
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

        ResultData result = new ScreenProject().start(new ScreeningData(new OnlineReviewProjectData(user, proj), user3.getId(), null));
        assertTrue(result instanceof ScreeningScorecardRetrieval);
        ScreeningScorecardRetrieval scorecard = (ScreeningScorecardRetrieval) result;
        assertNotNull(scorecard.getScoreCard());

        setPhase(proj, MockupData.phases[1]);
        result = new ScreenProject().start(new ScreeningData(new OnlineReviewProjectData(user, proj), user3.getId(), scorecard.getScoreCard()));
        assertTrue(result instanceof SuccessResult);
    }

    /**
     * Change the phase for a project.
     *
     * @param proj the project
     * @param phase the new phase
     */
    static void setPhase(UserProjectInfo proj, PhaseInstance phase) {
        Project project = MockupData.getProject(proj.getId());
        project.setCurrentPhase(phase.getPhase());
        try {
            // trick: override package private visibility of the UserProjectInfo.setPhase method
            Method m = UserProjectInfo.class.getDeclaredMethod("setPhase", new Class[]{PhaseInstance.class});
            m.setAccessible(true);
            m.invoke(proj, new Object[]{phase});
        } catch (Exception e) {
            System.out.println(e.getClass().getName() + ": " + e.getMessage());
        }
    }

}

