/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import servletunit.struts.MockStrutsTestCase;

import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;

/**
 * <p>Test the ProjectDetailAction classes.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class ProjectDetailActionTest extends MockStrutsTestCase {
    /**
     * Business delegate instance.
     */
    private BusinessDelegate businessDelegate = null;

    /**
     * Initialize the business delegate for the tests.
     */
    public ProjectDetailActionTest(String testName) {
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
        UserProjectInfo[] infos = businessDelegate.getUserProjectInfos();

        getSession().setAttribute(Constants.USER_KEY, user);
        getSession().setAttribute(Constants.UTILITY_KEY,
                new UtilityBean((SecurityEnabledUser) user));
        getSession().setAttribute(Constants.PROJECT_LIST_KEY, infos);
        addRequestParameter("id", "1");
        setRequestPathInfo("/projectDetail");
        actionPerform();

        verifyForward("success");
        assertNotNull(getRequest().getAttribute(Constants.PROJECT_KEY));

        verifyNoActionErrors();
    }

    /**
     * Test the fail view.
     */
    public void testViewFail() {
        setRequestPathInfo("/projectDetail.do?id=1");
        actionPerform();

        verifyForward("login");
        verifyActionErrors(new String[]{"error.login.required"});
        assertNull(getRequest().getAttribute(Constants.PROJECT_KEY));
    }

}
