/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.failuretests;

import com.topcoder.apps.review.BusinessDelegate;
import com.topcoder.apps.review.Constants;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.User;
import servletunit.struts.MockStrutsTestCase;

/**
 * <p>Test the ViewOpenProjectsAction classes.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class ViewOpenProjectsActionFailureTest extends MockStrutsTestCase {
    /**
     * Business delegate instance.
     */
    private BusinessDelegate businessDelegate = null;

    /**
     * Initialize the business delegate for the tests.
     */
    public ViewOpenProjectsActionFailureTest(String testName) {
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
     * Test the fail view with login required error caused by directly accessing
     * the viewOpenProjects path without previous login
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
