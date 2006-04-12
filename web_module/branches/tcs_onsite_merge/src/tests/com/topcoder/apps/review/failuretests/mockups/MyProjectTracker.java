/*
 * MyProjectTracker.java 1.0 6/30/2003
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.failuretests.mockups;

import java.util.*;
import java.rmi.RemoteException;
import java.sql.Date;

import com.topcoder.apps.review.mockup.EJBBase;
import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.document.InvalidEditException;
import com.topcoder.apps.review.projecttracker.ProjectTrackerLocal;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import com.topcoder.security.TCSubject;
import com.topcoder.util.TCException;

/**
 * <p>A mockup implementation of ProjectTracker used for testing.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class MyProjectTracker extends EJBBase implements ProjectTrackerLocal {
    /**
     * <p>Maps id's to projects</p>
     */
    private static HashMap projects = new HashMap();

    /**
     * <p>Maps user id's to lists of projects which that
     * user is involved in.</p>
     */
    private static HashMap userProjects = new HashMap();

    /**
     * <p>Adds the given project to the project tracker.</p>
     *
     * @param project the project to add
     */
    public static void addProject(Project project) {
        Long id = new Long(project.getId());
        projects.put(id, project);
    }

    /**
     * <p>Adds the specified Project to the list of projects
     * associated with the given User.</p>
     *
     * @param user the User to associate with the given UserProjectInfo
     * @param userProjectInfo contains information about the project
     * we want to add user to.
     */
    public static void addUserProject(User user,
                                      UserProjectInfo userProjectInfo) {
        Long id = new Long(user.getId());
        ArrayList list = (ArrayList) userProjects.get(id);
        if (list == null) {
            list = new ArrayList();
            userProjects.put(id, list);
        }
        list.add(userProjectInfo);
    }

    /**
     * <p>Clears all projects.</p>
     */
    public static void clearProjects() {
        projects.clear();
        userProjects.clear();
    }

    //ProjectTracker methods

    public Project getProject(UserProjectInfo info, TCSubject requestor) {
        Long id = new Long(info.getId());
        return ((Project) projects.get(id));
    }

    public Project getProjectById(long projectId, TCSubject requestor) {
        Long id = new Long(projectId);
        return ((Project) projects.get(id));
    }

    public UserProjectInfo[] getProjectInfo(TCSubject user) {
        Long id = new Long(user.getUserId());
        List list = (List) userProjects.get(id);
        return ((UserProjectInfo[]) list.toArray());
    }

    public void saveProject(Project project, String reason, TCSubject requestor)
            throws InvalidEditException {
    }

    public Project getProject(long projectId, User user) {
        Long id = new Long(projectId);
        return ((Project) projects.get(id));
    }

    public Project[] getAllProjects() throws RemoteException {
        return ((Project[]) projects.values().toArray());
    }

    public long createProject(
            String projectName,
            String projectVersion,
            long compVersId,
            long projectTypeId,
            String overview,
            Date[] dates,
            TCSubject requestor) {
        return (1);
    }

    public void userInquiry(long userId, long componentId,
                            long version, long projectTypeId)
            throws TCException {
    }

    public long convertProject(
            String projectName, String version, long versionId,
            long componentId,
            long compVersId, long phaseId, long projectTypeId,
            String overview, Date[] dates, TCSubject requestor)
            throws TCException {
        return (1);
    }
}
