/*
 * Copyright (C) 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.ejb.projectuser;


import javax.ejb.EJBException;
import javax.ejb.EJBLocalObject;

/**
 * <p>
 * Version 1.0 (Other Configurable Contest Terms Release Assembly 2.0 )
 * This local interface defines the following functionalities:
 *   <ol>
 *     <li>audit project resource change behaviour.</li>
 *     <li>retrieve project id by component version id.</li>
 *   </ol>
 * </p>
 * 
 * @version 1.0
 * @author ASSEMBLER
 */
public interface ProjectUserLocal extends EJBLocalObject {
	/**
	 * Audit the project resource (User).
	 * 
	 * @param entity the entity to audit.
	 * @param dataSource the data source name.
	 * @throws EJBException if error occurs when auditing the project resource.
	 */
	void auditProjectUser(ProjectUserEntity entity, String dataSource)
    	throws EJBException;
	

	/**
	 * Get project id by the component version id.
	 * 
	 * @param componentVersionId the component version id.
	 * @param dataSource the data source name.
	 * @return the project id.
	 * @throws EJBException if error occurs when getting the project id.
	 */
	long getProjectId(long componentVersionId, String dataSource)
   		throws EJBException;


}
