/*
 * RetrieveScreeningScorecardsTestCase.java 1.0 7/2/2003
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
public class RetrieveScreeningScorecardsTestCase extends PermissionTestCase {
    /**
     * <p>Returns an instance of ContactProductManager.</p>
     */
    public Model getModel() {
        return(new RetrieveScreeningScorecards());
    }
    
    /**
     * <p>Returns an instance of OnlineReviewProjectData.</p>
     */
    public ActionData getWrongActionData() {
        MyUser user = new MyUser("temp","aaa");
        Project project = new MyProject("tempProj");
        UserProjectInfo projectInfo = new MyUserProjectInfo(user,project);
        return(ActionDataUtil.getOnlineReviewProjectData(user,projectInfo));
    }

    /**
     * <p>Returns instances of ScreeningScorecardsData with required
     * parameters set to null.</p>
     */
    public ActionData[] getNullParams() {
        MyUser user = new MyUser("temp","aaa");
        Project project = new MyProject("tempProj");
        UserProjectInfo projectInfo = new MyUserProjectInfo(user,project);
        
        user.addPermission(new ViewProjectPermission(project.getId()));
        ScreeningScorecardsData data1 = 
            ActionDataUtil.getScreeningScorecardsData(user,null);
        ScreeningScorecardsData data2 = 
            ActionDataUtil.getScreeningScorecardsData(null,projectInfo);
        return(new ActionData[] {data1, data2});
    }
    
    /**
     * <p>Returns instances of ScreeningScorecardsData with users
     * that do not have ViewPermissions for the specified projec.</p>
     */
    public OnlineReviewData[] getWrongPermissions() {
        MyUser user1 = new MyUser("1","aaa");
        MyUser user2 = new MyUser("2","bbb");

        Project project = new MyProject("testProj");

        user1.addPermission(new ReviewPermission(project.getId()));
        user2.addPermission(new ViewProjectPermission(project.getId() + 1));

        UserProjectInfo projectInfo1 = new MyUserProjectInfo(user1,project);
        UserProjectInfo projectInfo2 = new MyUserProjectInfo(user2,project);
        ScreeningScorecardsData data1 = 
            ActionDataUtil.getScreeningScorecardsData(user1,projectInfo1);
        ScreeningScorecardsData data2 = 
            ActionDataUtil.getScreeningScorecardsData(user2,projectInfo2);
            
        return(new OnlineReviewData[] {data1, data2});
    }
   
    /**
     * <p>Returns the TestSuite for this TestCase.</p>
     *
     * @return the TestSuite for this TestCase
     */
    public static Test suite() {
        return(new TestSuite(RetrieveScreeningScorecardsTestCase.class));
    }
}
