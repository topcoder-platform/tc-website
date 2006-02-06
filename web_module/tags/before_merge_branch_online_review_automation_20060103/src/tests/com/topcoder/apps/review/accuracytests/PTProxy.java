/*
 * TCS Online Review
 *
 * PTProxy.java
 *
 * Copyright (c) 2003  TopCoder, Inc.  All rights reserved.
 */

package com.topcoder.apps.review.accuracytests;

import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.projecttracker.ReviewerResponsibility;
import com.topcoder.apps.review.projecttracker.Role;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import com.topcoder.apps.review.projecttracker.Project;

import java.sql.Connection;

/**
 * An interface defining the behavior of an adaptor class that wraps a version
 * of a ProjectTracker bean interface implementation class so as to present a
 * consistent API for the benefit of the tests.  Additional methods useful for
 * testing and submission-dependant but not actually part of the Project Tracker
 * bean are also provided.
 *
 * @author ThinMan
 * @version 1.0
 */
interface PTProxy {
    public Project getProject(UserProjectInfo projectInfo) throws Exception;

    public UserProjectInfo[] getProjectInfo(User user) throws Exception;

    public Project getProject(long projectId, User requestor)
            throws Exception;

    public void saveProject(Project project, String reason, User requestor)
            throws Exception;

    public void remove() throws Exception;

    public Project createProject(String name, String version, User manager)
            throws Exception;

    public void assignUserRole(User user, Role role,
                               ReviewerResponsibility resp, Project proj)
            throws Exception;

    public void registerDeveloper(User user, Project proj, Connection con)
            throws Exception;
}

