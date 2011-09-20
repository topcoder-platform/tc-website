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
public class TestScreeningScorecard extends MockStrutsTestCase {
    /**
     * Business delegate instance.
     */
    private BusinessDelegate businessDelegate = null;

    /**
     * Initialize the business delegate for the tests.
     */
    public TestScreeningScorecard(String testName) {
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
     * Test the edit forward.
     */
    public void testEdit() {
        User user = businessDelegate.getUserByHandle("pzhao");
        UserProjectInfo[] infos = businessDelegate.getUserProjectInfos();
        // settting utility
        SecurityEnabledUser seUser = new SecurityEnabledUser(user.getId(),
                user.getHandle(), user.getFirstName(), user.getLastName(), user.getEmail(),
                null, null);
        UtilityBean utility = new UtilityBean(seUser);
        getSession().setAttribute(Constants.UTILITY_KEY, utility);

        getSession().setAttribute(Constants.USER_KEY, user);
        getSession().setAttribute(Constants.PROJECT_LIST_KEY, infos);
        addRequestParameter("id", "1");
        addRequestParameter("sid", "2");
        addRequestParameter("action", "admin");
        setRequestPathInfo("/screeningScorecard");
        actionPerform();

        verifyForward("edit");
        ScreeningScorecardForm form = (ScreeningScorecardForm) getSession().getAttribute("screeningScorecardForm");
        assertNotNull(form);
        //assertEquals(form.getId(), 1);  // because in request in was 1

        verifyNoActionErrors();
    }

    /**
     * Test the view forward.
     */
    public void testView() {
        User user = businessDelegate.getUserByHandle("pzhao");
        UserProjectInfo[] infos = businessDelegate.getUserProjectInfos();
        // settting utility
        SecurityEnabledUser seUser = new SecurityEnabledUser(user.getId(),
                user.getHandle(), user.getFirstName(), user.getLastName(), user.getEmail(),
                null, null);
        UtilityBean utility = new UtilityBean(seUser);
        getSession().setAttribute(Constants.UTILITY_KEY, utility);


        getSession().setAttribute(Constants.USER_KEY, user);
        getSession().setAttribute(Constants.PROJECT_LIST_KEY, infos);
        addRequestParameter("id", "1");
        addRequestParameter("sid", "2");
        addRequestParameter("action", "view");
        setRequestPathInfo("/screeningScorecard");
        actionPerform();

        verifyForward("view");
        ScreeningScorecardForm form = (ScreeningScorecardForm) getSession().getAttribute("screeningScorecardForm");
        assertNotNull(form);
        //assertEquals(form.getId(), 1);  // because in request in was 1

        verifyNoActionErrors();
    }
}
