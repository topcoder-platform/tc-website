/*
 * Copyright (C) 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.ejb.projectuser;

import java.rmi.RemoteException;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;


/**
 * Version 1.0 (Other Configurable Contest Terms Release Assembly 2.0 )
 * <p>
 * It represents the remote home interface for the ProjectUser EJB.
 * </p>
 * 
 * @version 1.0
 * @author ASSEMBLER
 */
public interface ProjectUserHome extends EJBHome {
	/**
	 * The EJB reference name.
	 */
	public static final String EJB_REF_NAME = ProjectUserHome.class.getName();

    /**
     * Creates the remote ProjectUser EJB object
     *
     * @return a ProjectUser EJB object
     *
     * @throws CreateException if fail to create the ProjectUser.
     * @throws RemoteException if communication error occurs.
     */
    public ProjectUser create() throws CreateException, RemoteException;
}
