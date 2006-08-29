/*
 * LoginTestCase.java 1.0 7/1/2003
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.failuretests;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

import com.topcoder.apps.review.*;
import com.topcoder.apps.review.security.*;
import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.failuretests.mockups.*;

/**
 * <p>Test cases for the Login class.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class LoginTestCase extends BaseTestCase {
    /**
     * <p>Returns an instance of Login.</p>
     */
    public Model getModel() {
        return (new Login());
    }

    /**
     * <p>Returns an instance of OnlineReviewData.</p>
     */
    public ActionData getWrongActionData() {
        MyUser user = new MyUser("temp", "aaa");
        return (ActionDataUtil.getOnlineReviewData(user));
    }

    /**
     * <p>Returns instances of LoginData with required
     * parameters set to null.</p>
     */
    public ActionData[] getNullParams() {
        LoginData data1 = ActionDataUtil.getLoginData(null, "aaa");
        LoginData data2 = ActionDataUtil.getLoginData("temp", null);
        return (new ActionData[]{data1, data2});
    }

    /**
     * <p>Tests the start method with invalid username.</p>
     */
    public void testInvalidUserName() {
        Model model = getModel();
        MyUser user = new MyUser("temp", "aaa");
        LoginData data = ActionDataUtil.getLoginData("tom", "aaa");

        ResultData result = model.start(data);
        assertFailureResult("Login should have failed", result);
    }

    /**
     * <p>Tests the start method with a valid username but
     * incorrect password.</p>
     */
    public void testInvalidPassword() {
        Model model = getModel();
        MyUser user = new MyUser("temp", "aaa");
        LoginData data = ActionDataUtil.getLoginData("temp", "bbb");

        ResultData result = model.start(data);
        assertFailureResult("Login should have failed", result);
    }

    /**
     * <p>Returns the TestSuite for this TestCase.</p>
     *
     * @return the TestSuite for this TestCase
     */
    public static Test suite() {
        return (new TestSuite(LoginTestCase.class));
    }
}
