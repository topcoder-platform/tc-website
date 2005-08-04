/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import junit.framework.TestCase;

/**
 * Unit tests for the ContactProductManager class.
 *
 * @author adic
 * @version 1.0
 */
public class ContactProductManagerTestCase extends TestCase {

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
    public void testContact() throws Exception {
        SecurityEnabledUser user = ((LoginResult) new Login().start(new LoginData("user1", "secret"))).getUser();
        ProjectsRetrieval projectsRetrieval =
                (ProjectsRetrieval) new ViewMyOpenProjects().start(new OnlineReviewData(user));
        assertTrue(projectsRetrieval.getProjects().length == 3);
        UserProjectInfo proj = projectsRetrieval.getProjects()[0];

        ResultData result = new ContactProductManager().start(new ContactPMData(new OnlineReviewProjectData(user, proj), "subject", "body"));
        assertTrue(result instanceof SuccessResult);
    }

}

