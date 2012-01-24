/*
 * MyUserProjectInfo.java 1.0 7/1/2003
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.failuretests.mockups;

import java.util.Date;

import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.UserRole;
import com.topcoder.apps.review.projecttracker.ProjectType;
import com.topcoder.apps.review.projecttracker.PhaseInstance;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;

/**
 * <p>An implementation of UserProjectInfo used for testing.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class MyUserProjectInfo extends UserProjectInfo {
    /**
     * <p>The project </p>
     */
    private Project project;

    /**
     * <p>Constructs a new instance of MyUserProjectInfo for
     * the given user and project.</p>
     *
     * @param user the User we want to add to the given Project
     * @param protject the Project we want to add the User to
     */
    public MyUserProjectInfo(User user, Project project) {
        super(0, "", "", null, null, null, null, null);
        this.project = project;
        MyProjectTracker.addUserProject(user, this);
    }

    //UserProjectInfo methods

    public String getProjectName() {
        return (project.getName());
    }

    public String getProjectVersion() {
        return (project.getVersion());
    }

    public UserRole[] getUserRoles() {
        return (new UserRole[0]);
    }

    public PhaseInstance getCurrentPhaseInstance() {
        return (new PhaseInstance(0, project.getCurrentPhase(),
                new Date(), new Date(), 0));
    }

    public long getId() {
        return (project.getId());
    }
}
