package com.topcoder.apps.review.accuracytests;

import servletunit.struts.MockStrutsTestCase;

import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.BusinessDelegate;
import com.topcoder.apps.review.*;
import com.topcoder.apps.review.projecttracker.*;


/**
 * Test ProjectDetailAction class
 *
 * @author TCDEVELOPER
 * @version 1.0
 */
public class TestProjectDetail extends MockStrutsTestCase {
    /**
     * Business delegate instance.
     */
    private BusinessDelegate businessDelegate = null;

    /**
     * Initialize the business delegate for the tests.
     */
    public TestProjectDetail(String testName) {
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
    public void testEditTerminate() {
        User user = businessDelegate.getUserByHandle("pzhao");
        UserProjectInfo[] infos = businessDelegate.getUserProjectInfos();
        SecurityEnabledUser seUser = new SecurityEnabledUser(user.getId(),
                user.getHandle(), user.getFirstName(), user.getLastName(), user.getEmail(),
                null, null);

        getSession().setAttribute(Constants.USER_KEY, user);
        getSession().setAttribute(Constants.PROJECT_LIST_KEY, infos);
        getSession().setAttribute(Constants.UTILITY_KEY, new UtilityBean(seUser));
        addRequestParameter("id", "1");
        setRequestPathInfo("/projectDetail");
        actionPerform();

        verifyForward("success");
        Project pr = (Project) getRequest().getAttribute(Constants.PROJECT_KEY);
        assertNotNull(pr);
        assertEquals(pr.getId(), 1);  // because in request in was 1

        verifyNoActionErrors();
    }
}
