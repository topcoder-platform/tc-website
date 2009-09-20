/*
 * Copyright (C) 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.ejb.projectuser;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;

/**
 * Version 1.0 (Other Configurable Contest Terms Release Assembly 2.0 )
 * <p>
 * It represents the local home interface for the ProjectUser EJB.
 * </p>
 * 
 * @version 1.0
 * @author ASSEMBLER
 */
public interface ProjectUserLocalHome extends EJBLocalHome {
	
	/**
	 * Create the ProjectUserLocal local object.
	 * 
	 * @return the created ProjectUserLocal local object.
	 * @throws CreateException if fail to create the ProjectUserLocal local object.
	 */
	ProjectUserLocal create() throws CreateException;
}
