/*
 * Copyright (C) 2001 - 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dao.hibernate;

import java.util.List;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.studio.dao.UploadDAO;
import com.topcoder.web.studio.dto.Project;
import com.topcoder.web.studio.dto.Resource;
import com.topcoder.web.studio.dto.Upload;
import org.hibernate.Query;

/**
 * <p>Hibernate implementation for the <code>Upload</code> DAO interface.</p>
 *
 * <p>
 * Version 1.1 (TC Cockpit - Studio - Final Fixes Integration Part Two Assembly) Change notes:
 *   <ol>
 *     <li>Added {@link #getUploadForPhase(long)} method.</li>
 *   </ol>
 * </p>
 *
 * @author pvmagacho, isv
 * @version 1.1
 * @since (Re-platforming Studio Release 3 Assembly)
 */
public class UploadDAOHibernate extends Base implements UploadDAO {
    /**
     * <p>Find by ID the <code>Upload</code> instance from persistence.</p>
     *
     * @param id the unique identifier for the <code>Upload</code> instance
     * @return the found <code>Upload</code> instance. <code>null</code> if not found.
     */
    public Upload find(Integer id) {
    	return (Upload) super.find(Upload.class, id);
    }

	/**
     * <p>Finds a list of <code>Upload</code> instances from persistence.</p>
     *
     * @param project the project to which the submission upload belongs
     * @param resource the resource which was responsible for uploading the submission
     * @param uploadTypeId the upload type identifier
     * @param uploadStatusId the upload status identifier
     * @return a list with <code>Upload</code> instance or <code>null</code> if none is found.
     */
	@SuppressWarnings("unchecked")
	public List<Upload> getUploads(Project project,  Resource resource,
			Integer uploadTypeId, Integer uploadStatusId) {
		return session.createQuery("from com.topcoder.web.studio.dto.Upload u " +
                "where u.contest.id = ? " +
                "and u.resource.id = ? " +
                "and u.typeId = ? " +
                "and u.statusId = ? ")
                .setInteger(0, project.getId())
				.setLong(1, resource.getId())
				.setInteger(2, uploadTypeId)
				.setInteger(3, uploadStatusId)
				.list();
	}	
	
    /**
     * <p>Find a list of <code>Upload</code> instances from persistence for a given project. The upload must be active
     * and of type submission.</p>
     *
     * @param project the project to which the submission upload belongs
     * @return a list with <code>Upload</code> instance or <code>null</code> if none is found.
     */
	@SuppressWarnings("unchecked")
	public List<Upload> getUploads(Project project) {
		return session.createQuery("from com.topcoder.web.studio.dto.Upload u " +
                "where u.contest.id = ? ")
                .setInteger(0, project.getId())
				.list();
	}

    /**
     * <p>Gets the upload matching the specified project phase.</p>
     *
     * @param projectPhaseId a <code>long</code> providing the ID of a project phase to get upload for.
     * @return a <code>Upload</code> matching the specified project phase or <code>null</code> if there is no such
     *         upload.
     * @since 1.1
     */
    public Upload getUploadForPhase(long projectPhaseId) {
        Query query = session.createQuery("from com.topcoder.web.studio.dto.Upload u " +
                                          "where u.projectPhase.id = :projectPhaseId");
        query.setLong("projectPhaseId", projectPhaseId);
        return (Upload) query.uniqueResult();
    }
}
