/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import servletunit.struts.MockStrutsTestCase;

import com.topcoder.apps.review.projecttracker.User;

/**
 * <p>Test the LoginAction classes.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class LoginActionTest extends MockStrutsTestCase {
    /**
     * Business delegate instance.
     */
    private BusinessDelegate businessDelegate = null;

    /**
     * Initialize the business delegate for the tests.
     */
    public LoginActionTest(String testName) {
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
     * Test the success login.
     */
    public void testLoginSuccess() {
        Object user = null;

        setRequestPathInfo("/login");
        addRequestParameter("username", "pzhao");
        addRequestParameter("password", "xxx");
        actionPerform();

        verifyForward("success");
        user = getSession().getAttribute("user");
        assertTrue(user instanceof User);
        assertEquals("pzhao", ((User) user).getHandle());

        verifyNoActionErrors();
    }

    /**
     * Test the fail login.
     */
    public void testLoginFail() {
        setRequestPathInfo("/login");
        addRequestParameter("username", "pzhao");
        addRequestParameter("password", "xxx222");
        actionPerform();

        verifyForward("login");
        verifyActionErrors(new String[]{"error.format"});
        assertNull(getSession().getAttribute("user"));
    }

}
