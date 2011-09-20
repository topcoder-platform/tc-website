/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dao.hibernate;

import java.util.List;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.studio.dao.FileTypeCatalogDAO;
import com.topcoder.web.studio.dto.FileType;

/**
 * <p>Hibernate implementation for the <code>FileType</code> DAO interface.</p>
 *
 * @author pvmagacho
 * @version 1.0
 * @since (Re-platforming Studio Release 3 Assembly)
 */
public class FileTypeCatalogDAOHibernate extends Base implements FileTypeCatalogDAO {
    /**
     * <p>Find by ID the <code>Upload</code> instance from persistence.</p>
     *
     * @param id the unique identifier for the <code>Upload</code> instance
     * @return the found <code>Upload</code> instance. <code>null</code> if not found.
     */
    public FileType find(Integer id) {
    	return (FileType) super.find(FileType.class, id);
    }
	
    /**
     * <p>Find a list of <code>FileType</code> instances from persistence for a given project.
     *
     * @return a list with <code>FileType</code> instance or <code>null</code> if none is found.
     */
	@SuppressWarnings("unchecked")
	public List<FileType> getFileTypes() {
		return session.createQuery("FROM com.topcoder.web.studio.dto.FileType ft" 
				+ " ORDER BY ft.sort").list();
	}
}
