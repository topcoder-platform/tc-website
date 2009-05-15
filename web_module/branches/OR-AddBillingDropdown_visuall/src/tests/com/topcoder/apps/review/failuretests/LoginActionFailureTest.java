/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.failuretests;

import com.topcoder.apps.review.BusinessDelegate;
import com.topcoder.apps.review.projecttracker.User;
import servletunit.struts.MockStrutsTestCase;

/**
 * <p>Test the LoginAction classes.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class LoginActionFailureTest extends MockStrutsTestCase {
    /**
     * Business delegate instance.
     */
    private BusinessDelegate businessDelegate = null;

    /**
     * Initialize the business delegate for the tests.
     */
    public LoginActionFailureTest(String testName) {
        super(testName);
        businessDelegate = new BusinessDelegate();
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
     * Test for missing username (username = null)
     */
    public void testLoginMissingUsername1() {
        Object user = null;

        setRequestPathInfo("/login");
        addRequestParameter("username", (String) null);
        addRequestParameter("password", "xxx");
        actionPerform();

        verifyForward("login");
        verifyActionErrors(new String[]{"error.username.required"});
        assertNull(getSession().getAttribute("user"));
    }

    /**
     * Test for missing username (username = "")
     */
    public void testLoginMissingUsername2() {
        Object user = null;

        setRequestPathInfo("/login");
        addRequestParameter("username", new String(""));
        addRequestParameter("password", "xxx");
        actionPerform();

        verifyForward("login");
        verifyActionErrors(new String[]{"error.username.required"});
        assertNull(getSession().getAttribute("user"));
    }

    /**
     * Test for missing password (password = null)
     */
    public void testLoginMissingPassword1() {
        Object user = null;

        setRequestPathInfo("/login");
        addRequestParameter("username", "pzhao");
        addRequestParameter("password", (String) null);
        actionPerform();

        verifyForward("login");
        verifyActionErrors(new String[]{"error.password.required"});
        assertNull(getSession().getAttribute("user"));
    }

    /**
     * Test for missing password (password = "")
     */
    public void testLoginMissingPassword2() {
        Object user = null;

        setRequestPathInfo("/login");
        addRequestParameter("username", "xxx");
        addRequestParameter("password", new String(""));
        actionPerform();

        verifyForward("login");
        verifyActionErrors(new String[]{"error.password.required"});
        assertNull(getSession().getAttribute("user"));
    }

    /**
     * Test unknown username.
     */
    public void testLoginUnknownUser() {
        Object user = null;

        setRequestPathInfo("/login");
        addRequestParameter("username", "JJOck");
        addRequestParameter("password", "pzhaoxxx");
        actionPerform();

        verifyForward("login");
        verifyActionErrors(new String[]{"error.password.mismatch"});
        assertNull(getSession().getAttribute("user"));
    }
}
