/*
 * ProjectAdministrationTestCase.java 1.0 7/1/2003
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
 * <p>Test cases for the ProjectAdministration class.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class ProjectAdministrationTestCase extends PermissionTestCase {
    /**
     * <p>Returns an instance of ProjectAdministration.</p>
     */
    public Model getModel() {
        return(new ProjectAdministration());
    }
    
    /**
     * <p>Returns an instance of LoginData.</p>
     */
    public ActionData getWrongActionData() {
        return(ActionDataUtil.getLoginData("temp","aaa"));
    }

    /**
     * <p>Returns instances of ProjectReviewData with required
     * parameters set to null.</p>
     */
    public ActionData[] getNullParams() {
        MyUser user = new MyUser("temp","aaa");
        Project project = new MyProject("test");
        
        user.addPermission(new AdminPermission());
        ProjectData data1 = 
            ActionDataUtil.getProjectData(user,null,"none");
        ProjectData data2 = 
            ActionDataUtil.getProjectData(null,project,"none");
        return(new ActionData[] {data1, data2});
    }

    /**
     * <p>Returns instances of ProjectReviewData with users
     * that do not have AdminPermission.</p>
     */
    public OnlineReviewData[] getWrongPermissions() {
        MyUser usera = new MyUser("a","aaa");
        MyUser userb = new MyUser("b","bbb");
        MyUser userc = new MyUser("c","ccc");
        Project project = new MyProject("test");
        
        userb.addPermission(new ViewProjectPermission(0));
        userc.addPermission(new ViewProjectPermission(0));
        userc.addPermission(new ReviewPermission(0));
        
        ProjectData data1 = 
            ActionDataUtil.getProjectData(usera,project,"none");
        ProjectData data2 = 
            ActionDataUtil.getProjectData(userb,project,"none");
        ProjectData data3 = 
            ActionDataUtil.getProjectData(userc,project,"none");
        
        return(new OnlineReviewData[] {data1, data2, data3});
    }

    /**
     * <p>Returns the TestSuite for this TestCase.</p>
     *
     * @return the TestSuite for this TestCase
     */
    public static Test suite() {
        return(new TestSuite(ProjectAdministrationTestCase.class));
    }
}
