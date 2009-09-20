/*
 * Copyright (C) 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.ejb.projectuser;

import java.rmi.RemoteException;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;

/**
 * <p>
 * Version 1.0 (Other Configurable Contest Terms Release Assembly 2.0 )
 * This EJB interface defines the following functionalities:
 *   <ol>
 *     <li>audit project resource change behaviour.</li>
 *     <li>retrieve project id by component version id.</li>
 *   </ol>
 * </p>
 * 
 * @author ASSEMBLER
 * @version 1.0
 */
public interface ProjectUser extends EJBObject {
	
	/**
	 * Audit the project resource (User).
	 * 
	 * @param entity the entity to audit.
	 * @param dataSource the data source name.
	 * @throws RemoteException if communication error occurs.
	 * @throws EJBException if error occurs when auditing the project resource.
	 */
   void auditProjectUser(ProjectUserEntity entity, String dataSource)
       throws RemoteException, EJBException;
   
   

   /**
	 * Get project id by the component version id.
	 * 
	 * @param componentVersionId the component version id.
	 * @param dataSource the data source name.
	 * @return the project id.
	 * @throws RemoteException if communication error occurs.
	 * @throws EJBException if error occurs when getting the project id.
	 */
   long getProjectId(long componentVersionId, String dataSource)
       throws RemoteException, EJBException; 
}
