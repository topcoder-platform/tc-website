/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import servletunit.struts.MockStrutsTestCase;

import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.User;

/**
 * <p>Test the ViewOpenProjectsAction classes.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class ViewOpenProjectsActionTest extends MockStrutsTestCase {
    /**
     * Business delegate instance.
     */
    private BusinessDelegate businessDelegate = null;

    /**
     * Initialize the business delegate for the tests.
     */
    public ViewOpenProjectsActionTest(String testName) {
        super(testName);
        businessDelegate = new BusinessDelegate();
        businessDelegate.setUseMockup(true);
    }

    /**
     * Initialize for the tests.
     */
    public void setUp() throws Exception {
        super.setUp();
        setConfigFile("conf/struts-config.xml");
    }

    /**
     * Tear down for the tests.
     */
    public void tearDown() throws Exception {
        super.tearDown();
    }

    /**
     * Test the success view.
     */
    public void testViewSuccess() {
        User user = businessDelegate.getUserByHandle("pzhao");

        getSession().setAttribute(Constants.USER_KEY, user);
        getSession().setAttribute(Constants.UTILITY_KEY,
                new UtilityBean((SecurityEnabledUser) user));
        setRequestPathInfo("/viewOpenProjects");
        actionPerform();

        verifyForward("success");
        assertNotNull(getRequest().getAttribute(Constants.PROJECT_TYPE_KEY));
        assertNotNull(getSession().getAttribute(Constants.PROJECT_LIST_KEY));

        verifyNoActionErrors();
    }

    /**
     * Test the fail view.
     */
    public void testViewFail() {
        setRequestPathInfo("/viewOpenProjects");
        actionPerform();

        verifyForward("login");
        verifyActionErrors(new String[]{"error.login.required"});
        assertNull(getRequest().getAttribute(Constants.PROJECT_TYPE_KEY));
        assertNull(getSession().getAttribute(Constants.PROJECT_LIST_KEY));
    }

}
