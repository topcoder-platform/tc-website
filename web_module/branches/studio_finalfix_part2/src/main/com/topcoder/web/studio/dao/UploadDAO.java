/*
 * Copyright (C) 2001 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dao;

import java.util.List;

import com.topcoder.web.studio.dto.Project;
import com.topcoder.web.studio.dto.Resource;
import com.topcoder.web.studio.dto.Upload;

/**
 * <p>The Java Data Access Object interface responsible for handling the <code>Upload</code>
 * class.</p>
 *
 * @author pvmagacho 
 * @version 1.0
 * @since (Re-platforming Studio Release 3 Assembly)
 */
public interface UploadDAO {
    /**
     * <p>Find by ID the <code>Upload</code> instance from persistence.</p>
     *
     * @param id the unique identifier for the <code>Upload</code> instance
     * @return the found <code>Upload</code> instance. <code>null</code> if not found.
     */
    public Upload find(Integer id);
    
    /**
     * <p>Finds a list of <code>Upload</code> instances from persistence.</p>
     *
     * @param project the project to which the submission upload belongs
     * @param resource the resource which was responsible for uploading the submission
     * @param uploadTypeId the upload type identifier
     * @param uploadStatusId the upload status identifier
     * @return a list with <code>Upload</code> instance or <code>null</code> if none is found.
     */
    public List<Upload> getUploads(Project project, Resource resource, Integer uploadTypeId,
    		Integer uploadStatusId);
    
    /**
     * <p>Find a list of <code>Upload</code> instances from persistence for a given project. The upload must be active
     * and of type submission.</p>
     *
     * @param project the project to which the submission upload belongs
     * @return a list with <code>Upload</code> instance or <code>null</code> if none is found.
     */
    public List<Upload> getUploads(Project project);
}
