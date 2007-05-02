package com.topcoder.apps.review.accuracytests.ejb;

import com.topcoder.apps.review.projecttracker.ProjectTrackerLocal;
import com.topcoder.apps.review.projecttracker.ProjectTracker;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.document.InvalidEditException;
import com.topcoder.security.TCSubject;

import java.rmi.RemoteException;

/**
 * Assists in UnitTesting by serving as the ProjectTracker.<p>
 *
 * @author TCDEVELOPER
 * @version 1.0
 * @version Copyright � 2003, TopCoder Software, Inc. All rights reserved
 */
public class ProjectTrackerTester implements ProjectTrackerLocal, ProjectTracker {

    private Project project;
    private UserProjectInfo[] userProjectInfos;
    private InvalidEditException invalidEditException;
    private RemoteException remoteException;

    public void clear() {
        project = null;
        userProjectInfos = null;
        invalidEditException = null;
        remoteException = null;
    }

    public void throwMe() {
        if (invalidEditException != null) throw invalidEditException;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public void setUserProjectInfos(UserProjectInfo[] userProjectInfos) {
        this.userProjectInfos = userProjectInfos;
    }

    public void setInvalidEditException(InvalidEditException invalidEditException) {
        this.invalidEditException = invalidEditException;
    }

    public void setRemoteException(RemoteException remoteException) {
        this.remoteException = remoteException;
    }

    public Project getProject(UserProjectInfo info, TCSubject req) {
        throwMe();
        return project;
    }

    public UserProjectInfo[] getProjectInfo(TCSubject user) {
        throwMe();
        return userProjectInfos;
    }

    public void saveProject(Project project, String reason, TCSubject subj) throws InvalidEditException {
        throwMe();
    }

    public Project getProjectById(long projectId, TCSubject requestor) {
        return project;
    }

    public Project[] getAllProjects() {
        return new Project[]{project};
    }

    public Project getProject(long projectId, User requester) {
        return project;
    }

    public javax.ejb.EJBLocalHome getEJBLocalHome() throws javax.ejb.EJBException {
        return null;
    }

    public javax.ejb.EJBHome getEJBHome() throws javax.ejb.EJBException {
        return null;
    }

    public Object getPrimaryKey() throws javax.ejb.EJBException {
        return null;
    }

    public boolean isIdentical(javax.ejb.EJBLocalObject eJBLocalObject) throws javax.ejb.EJBException {
        return false;
    }

    public boolean isIdentical(javax.ejb.EJBObject eJBLocalObject) throws javax.ejb.EJBException {
        return false;
    }

    public void remove() throws javax.ejb.RemoveException, javax.ejb.EJBException {
    }

    public javax.ejb.Handle getHandle() throws java.rmi.RemoteException {
        return null;
    }

    public long createProject(String projectName, String projectVersion,
                              long compVersId, long projectTypeId, String overview, java.sql.Date[] dates,
                              TCSubject requestor) {
        return 0;
    }

    public void userInquiry(long userId, long componentId, long version, long projectTypeId) {
    }

    public long convertProject(
            String projectName, String version, long versionId,
            long componentId,
            long compVersId, long phaseId, long projectTypeId,
            String overview, java.sql.Date[] dates, TCSubject requestor) {
        return 0;
    }
}
