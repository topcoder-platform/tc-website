/*
 * ProjectTracker.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.projecttracker;

import com.topcoder.apps.review.ConcurrentModificationException;
import com.topcoder.apps.review.GeneralSecurityException;
import com.topcoder.apps.review.document.InvalidEditException;
import com.topcoder.security.TCSubject;
import com.topcoder.util.TCException;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.sql.Date;


/**
 * The ProjectTracker provides access to the project data stored within the system.
 *
 * @author TCSDeveloper
 */
public interface ProjectTracker extends EJBObject {
    /**
     * DOCUMENT ME!
     *
     * @param projectInfo DOCUMENT ME!
     * @param requestor DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     *
     * @throws RemoteException DOCUMENT ME!
     */
    public Project getProject(UserProjectInfo projectInfo, TCSubject requestor)
            throws RemoteException;

    /**
     * DOCUMENT ME!
     *
     * @param projectId DOCUMENT ME!
     * @param requestor DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     *
     * @throws RemoteException DOCUMENT ME!
     */
    public Project getProjectById(long projectId, TCSubject requestor)
            throws RemoteException;

    /**
     * Retrieves the id of a project based on the component version id of a component and the project type
     * @param compVersId the component's component version id
     * @param projectType the project type (design or development)
     * @return the project id, -1 if no project exists
     * @throws RemoteException
     */
    public long getProjectIdByComponentVersionId(long compVersId, long projectType) throws RemoteException;

    /**
     * DOCUMENT ME!
     *
     * @param user DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     *
     * @throws RemoteException DOCUMENT ME!
     */
    public UserProjectInfo[] getProjectInfo(TCSubject user)
            throws RemoteException;

    /**
     * DOCUMENT ME!
     *
     * @param project DOCUMENT ME!
     * @param reason DOCUMENT ME!
     *
     * @throws InvalidEditException DOCUMENT ME!
     * @throws GeneralSecurityException DOCUMENT ME!
     * @throws RemoteException DOCUMENT ME!
     */
    public void saveProject(Project project, String reason,
                            TCSubject requestor)
            throws InvalidEditException,
            GeneralSecurityException,
            ConcurrentModificationException,
            RemoteException;

    /**
     * Gets the PM for the project, or returns null if no PM is found.
     */
    public User getPM(long projectId) throws RemoteException;

    /**
     * Create a new Online Review Project.
     *
     * @param projectName
     * @param projectVersion
     * @param compVersId
     * @param projectTypeId
     * @param overview
     * @param requestor
     */
    public long createProject(
            String projectName,
            String projectVersion,
            long compVersId,
            long projectTypeId,
            String overview,
            Date[] dates,
            TCSubject requestor,
            long levelId)
            throws TCException, RemoteException;

    /**
     * @param userId
     * @param componentId
     * @param version
     * @param projectTypeId
     */
/*
    public void userInquiry(long userId, long componentId, long version, long projectTypeId)
            throws TCException, RemoteException;
*/

    /**
     *
     * @param userId
     * @param projectId
     * @throws TCException
     * @throws RemoteException
     */
    public void userInquiry(long userId, long projectId)
            throws TCException, RemoteException;


    /**
     * Return scorecardtemplate id:s for project.
     *
     * @param projectId
     * @return array with screening and review template id:s
     */
    public long[] getProjectTemplates(long projectId)
            throws RemoteException;

/*
    public long convertProject(
            String projectName, String version, long versionId,
            long componentId,
            long compVersId, long phaseId, long projectTypeId,
            String overview, Date[] dates, TCSubject requestor, long levelId)
            throws TCException, RemoteException;
*/

    public void versionRename(long compVersId, String oldVersion, String newVersion)
            throws RemoteException;

    public void componentRename(long componentId, String oldName, String newName)
            throws RemoteException;

    public void finalizeScores(long projectId) throws RemoteException;
}
