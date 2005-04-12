/*
 * ProjectTrackerLocal.java
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

import javax.ejb.EJBLocalObject;
import java.sql.Date;


/**
 * The ProjectTrackerLocal provides access to the project data stored within the system.
 *
 * @author TCSDeveloper
 */
public interface ProjectTrackerLocal extends EJBLocalObject {
    /**
     * DOCUMENT ME!
     *
     * @param projectInfo DOCUMENT ME!
     * @param requestor DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    public Project getProject(UserProjectInfo projectInfo, TCSubject requestor);

    /**
     * DOCUMENT ME!
     *
     * @param projectId DOCUMENT ME!
     * @param requestor DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    public Project getProjectById(long projectId, TCSubject requestor);

    /**
     * DOCUMENT ME!
     *
     * @param user DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    public UserProjectInfo[] getProjectInfo(TCSubject user);

    /**
     * DOCUMENT ME!
     *
     * @param project DOCUMENT ME!
     * @param reason DOCUMENT ME!
     *
     * @throws InvalidEditException DOCUMENT ME!
     * @throws GeneralSecurityException DOCUMENT ME!
     */
    public void saveProject(Project project, String reason,
                            TCSubject requestor)
            throws InvalidEditException,
            GeneralSecurityException,
            ConcurrentModificationException;


    /**
     * Gets the PM for the project, or returns null if no PM is found.
     */
    public User getPM(long projectId);

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
            long levelId) throws TCException;

    /**
     * @param userId
     * @param componentId
     * @param version
     * @param projectTypeId
     */
/*
    public void userInquiry(long userId, long componentId, long version, long projectTypeId)
            throws TCException;
*/

    /**
     *
     * @param userId
     * @param projectId
     * @throws TCException
     */
    public void userInquiry(long userId, long projectId)
            throws TCException;

    /**
     * Return scorecardtemplate id:s for project.
     *
     * @param projectId
     * @return array with screening and review template id:s
     */
    public long[] getProjectTemplates(long projectId);

/*
    public long convertProject(
            String projectName, String version, long versionId,
            long componentId,
            long compVersId, long phaseId, long projectTypeId,
            String overview, Date[] dates, TCSubject requestor, long levelId)
            throws TCException;
*/

    public void versionRename(long compVersId, String oldVersion, String newVersion);

    public void componentRename(long componentId, String oldName, String newName);
}
