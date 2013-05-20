/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dao;

import java.util.List;

import com.topcoder.web.studio.dto.FileType;


/**
 * <p>The Java Data Access Object interface responsible for handling the <code>FileType</code>
 * class.</p>
 *
 * @author pvmagacho 
 * @version 1.0
 * @since (Re-platforming Studio Release 3 Assembly)
 */
public interface FileTypeCatalogDAO {
    /**
     * <p>Find by ID the <code>Upload</code> instance from persistence.</p>
     *
     * @param id the unique identifier for the <code>Upload</code> instance
     * @return the found <code>Upload</code> instance. <code>null</code> if not found.
     */
    public FileType find(Integer id);

    /**
     * <p>Find a list of <code>FileType</code> instances from persistence.
     *
     * @return a list with <code>FileType</code> instance or <code>null</code> if none is found.
     */
    public List<FileType> getFileTypes();
}
