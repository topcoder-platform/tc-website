/*
 * ContactProductManagerTestCase.java 1.0 7/1/2003
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
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import com.topcoder.apps.review.failuretests.mockups.*;

/**
 * <p>Test cases for the ContactProductManager class.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class ContactProductManagerTestCase extends BaseTestCase {
    /**
     * <p>Returns an instance of ContactProductManager.</p>
     */
    public Model getModel() {
        return (new ContactProductManager());
    }

    /**
     * <p>Returns an instance of LoginData.</p>
     */
    public ActionData getWrongActionData() {
        return (ActionDataUtil.getLoginData("temp", "aaa"));
    }

    /**
     * <p>Returns instances of ContactPMData with required
     * parameters set to null.</p>
     */
    public ActionData[] getNullParams() {
        MyUser user = new MyUser("temp", "aaa");
        Project project = new MyProject("tempProj");
        UserProjectInfo projectInfo = new MyUserProjectInfo(user, project);
        ContactPMData data1 =
                ActionDataUtil.getContactPMData(user, projectInfo, "aaa", null);
        ContactPMData data2 =
                ActionDataUtil.getContactPMData(user, projectInfo, null, "bbb");
        ContactPMData data3 =
                ActionDataUtil.getContactPMData(user, null, "aaa", "bbb");
        ContactPMData data4 =
                ActionDataUtil.getContactPMData(null, projectInfo, "aaa", "bbb");
        return (new ActionData[]{data1, data2, data3, data4});
    }

    /**
     * <p>Returns the TestSuite for this TestCase.</p>
     *
     * @return the TestSuite for this TestCase
     */
    public static Test suite() {
        return (new TestSuite(ContactProductManagerTestCase.class));
    }
}
