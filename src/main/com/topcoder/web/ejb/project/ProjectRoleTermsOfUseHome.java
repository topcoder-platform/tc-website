/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.ejb.project;

import java.rmi.RemoteException;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;

/**
 * <p>Remote home interface for the project role terms of use EJB.</p>
 *
 * @author pulky
 * @version 1.0 (Configurable Contest Terms Release Assembly v1.0)
 */
public interface ProjectRoleTermsOfUseHome extends EJBHome {

    /**
     * The EJB ref name
     */
    public final static String EJB_REF_NAME = "com.topcoder.web.ejb.project.ProjectRoleTermsOfUseHome";

    /**
     * Create method for the Project Role Terms of Use EJB
     *
     * @return an instance implementing <code>ProjectRoleTermsOfUse</code>.
     * @throws CreateException if any error occurs during creation
     * @throws RemoteException if any error occurs during remote invocation.
     */
    ProjectRoleTermsOfUse create() throws CreateException, RemoteException;

}
