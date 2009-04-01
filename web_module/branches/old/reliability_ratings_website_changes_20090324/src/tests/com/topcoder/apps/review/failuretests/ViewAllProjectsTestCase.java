/*
 * ViewAllProjectsTestCase.java 1.0 7/1/2003
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
import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import com.topcoder.apps.review.failuretests.mockups.*;

/**
 * <p>Test cases for the ViewAllProjects class.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class ViewAllProjectsTestCase extends PermissionTestCase {
    /**
     * <p>Returns an instance of ViewMyOpenProjects.</p>
     */
    public Model getModel() {
        return (new ViewAllProjects());
    }

    /**
     * <p>Returns an instance of LoginData.</p>
     */
    public ActionData getWrongActionData() {
        return (ActionDataUtil.getLoginData("temp", "aaa"));
    }

    /**
     * <p>Returns instances of OnlineRevieData with required
     * parameters set to null.</p>
     */
    public ActionData[] getNullParams() {
        OnlineReviewData data = ActionDataUtil.getOnlineReviewData(null);
        return (new ActionData[]{data});
    }

    /**
     * <p>Returns instances of OnlineReviewData with users
     * that do not have AdminPermission.</p>
     */
    public OnlineReviewData[] getWrongPermissions() {
        MyUser usera = new MyUser("a", "aaa");
        MyUser userb = new MyUser("b", "bbb");
        MyUser userc = new MyUser("c", "ccc");

        userb.addPermission(new ViewProjectPermission(0));
        userc.addPermission(new ViewProjectPermission(0));
        userc.addPermission(new ReviewPermission(0));

        OnlineReviewData data1 = ActionDataUtil.getOnlineReviewData(usera);
        OnlineReviewData data2 = ActionDataUtil.getOnlineReviewData(userb);
        OnlineReviewData data3 = ActionDataUtil.getOnlineReviewData(userc);

        return (new OnlineReviewData[]{data1, data2, data3});
    }

    /**
     * <p>Returns the TestSuite for this TestCase.</p>
     *
     * @return the TestSuite for this TestCase
     */
    public static Test suite() {
        return (new TestSuite(ViewAllProjectsTestCase.class));
    }
}
