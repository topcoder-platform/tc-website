/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import junit.framework.TestCase;

/**
 * Unit tests for the Login class.
 *
 * @author adic
 * @version 1.0
 */
public class LoginTestCase extends TestCase {

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
     * Test a successful login.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testGoodLogin() throws Exception {
        ResultData result = new Login().start(new LoginData("marc", "secret"));
        assertTrue(result instanceof LoginResult);
        LoginResult loginResult = (LoginResult) result;
        assertNotNull(loginResult.getUser());
        assertTrue(loginResult.getUser().getHandle().equals("marc"));
    }

    /**
     * Test a bad password login.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testBadLogin1() throws Exception {
        ResultData result = new Login().start(new LoginData("marc", "1secret"));
        assertTrue(result instanceof FailureResult);
    }

    /**
     * Test a bad user login.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testBadLogin2() throws Exception {
        ResultData result = new Login().start(new LoginData("1marc", "secret"));
        assertTrue(result instanceof FailureResult);
    }

    /**
     * Test bad request.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testBadRequest1() throws Exception {
        ResultData result = new Login().start(
                new LoginData("", "") {
                    public String getUserName() {
                        return null;
                    }

                    public String getPassword() {
                        return null;
                    }
                }
        );
        assertTrue(result instanceof FailureResult);
    }

    /**
     * Test bad request.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testBadRequest2() throws Exception {
        ResultData result = new Login().start(new ActionData() {
        });
        assertTrue(result instanceof FailureResult);
    }

}

