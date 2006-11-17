package com.topcoder.apps.review.accuracytests;

/**
 * @author TCDEVELOPER
 * @version 1.0
 */

import servletunit.struts.MockStrutsTestCase;

import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.BusinessDelegate;
import com.topcoder.apps.review.*;
import com.topcoder.apps.review.projecttracker.*;


/**
 * Test ReviewAction class
 *
 * @author TCDEVELOPER
 * @version 1.0
 */
public class TestViewOpenProjects extends MockStrutsTestCase {
    /**
     * Business delegate instance.
     */
    private BusinessDelegate businessDelegate = null;

    /**
     * Initialize the business delegate for the tests.
     */
    public TestViewOpenProjects(String testName) {
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
     * Test the forward to view.
     */
    public void testForwardEdit() {
        User user = businessDelegate.getUserByHandle("pzhao");
        UserProjectInfo[] infos = businessDelegate.getUserProjectInfos();
        SecurityEnabledUser seUser = new SecurityEnabledUser(user.getId(),
                user.getHandle(), user.getFirstName(), user.getLastName(), user.getEmail(),
                null, null);


        getSession().setAttribute(Constants.USER_KEY, user);
        getSession().setAttribute(Constants.PROJECT_LIST_KEY, infos);
        getSession().setAttribute(Constants.UTILITY_KEY, new UtilityBean(seUser));
        setRequestPathInfo("/viewOpenProjects");
        actionPerform();

        verifyForward("success");
        UserProjectInfo[] projects = (UserProjectInfo[]) getSession().getAttribute(Constants.PROJECT_LIST_KEY);
        assertNotNull(projects);
        OpenProjectBean[] beans = (OpenProjectBean[]) getRequest().getAttribute(Constants.PROJECT_TYPE_KEY);
        assertNotNull(beans);

        verifyNoActionErrors();
    }
}
