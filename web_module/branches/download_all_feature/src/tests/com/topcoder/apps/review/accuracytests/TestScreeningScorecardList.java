package com.topcoder.apps.review.accuracytests;

import servletunit.struts.MockStrutsTestCase;

import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.BusinessDelegate;
import com.topcoder.apps.review.*;
import com.topcoder.apps.review.document.*;

import javax.servlet.http.*;

import com.topcoder.apps.review.projecttracker.*;

/**
 * Test ScreeningScorecardListAction class
 *
 * @author TCDEVELOPER
 * @version 1.0
 */
public class TestScreeningScorecardList extends MockStrutsTestCase {
    /**
     * Business delegate instance.
     */
    private BusinessDelegate businessDelegate = null;

    /**
     * Initialize the business delegate for the tests.
     */
    public TestScreeningScorecardList(String testName) {
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
        setRequestPathInfo("/screeningScorecardList");
        actionPerform();

        verifyForward("success");
        HttpServletRequest rq = getRequest();
        ScreeningScorecard[] l = (ScreeningScorecard[]) rq.getAttribute(Constants.SCORECARD_LIST_KEY);
        assertNotNull(l);

        verifyNoActionErrors();
    }
}
