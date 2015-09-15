/*
 * ViewMyOpenProjectsTestCase.java 1.0 7/1/2003
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
 * <p>Test cases for the ViewMyOpenProjects class.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class ViewMyOpenProjectsTestCase extends BaseTestCase {
    /**
     * <p>Returns an instance of ViewMyOpenProjects.</p>
     */
    public Model getModel() {
        return (new ViewMyOpenProjects());
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
     * <p>Returns the TestSuite for this TestCase.</p>
     *
     * @return the TestSuite for this TestCase
     */
    public static Test suite() {
        return (new TestSuite(ViewMyOpenProjectsTestCase.class));
    }
}
