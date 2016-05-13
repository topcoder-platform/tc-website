/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.mockup;

import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.ProjectTrackerLocal;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import com.topcoder.security.TCSubject;

import java.sql.Date;

import com.topcoder.util.TCException;

/**
 * Mockup implementation of the ProjectTracker EJB.
 *
 * @author adic
 * @version 1.0
 */
public class ProjectTrackerMockup extends EJBBase implements ProjectTrackerLocal {

    public void componentRename(long componentId, String oldName, String newName) {
    }

    public void versionRename(long compVersId, String oldVersion, String newVersion) {
    }

    public void userInquiry(long userId, long componentId, long version, long projectTypeId) {
    }

    public long createProject(String projectName, String projectVersion, long compVersId, long projectTypeId,
                              String overview, Date[] dates, TCSubject requestor) {
        return 0;
    }

    public long convertProject(String projectName, String version, long versionId, long componentId, long compVersId,
                               long phaseId, long projectTypeId, String overview, Date[] dates, TCSubject requestor) {
        return 0;
    }


    public Project getProjectById(long projectId, TCSubject requestor) {
        return MockupData.getProject(projectId);
    }

    public Project getProject(UserProjectInfo projectInfo, TCSubject requestor) {
        return getProjectById(projectInfo.getId(), requestor);
    }

    public UserProjectInfo[] getProjectInfo(TCSubject user) {
        return MockupData.getProjects(user);
    }

    public void saveProject(Project project, String reason, TCSubject requestor) {
    }

    public void createProject(String projectName, String projectVersion, long compVersId, long projectTypeId, String overview, TCSubject requestor) {
    }

}

