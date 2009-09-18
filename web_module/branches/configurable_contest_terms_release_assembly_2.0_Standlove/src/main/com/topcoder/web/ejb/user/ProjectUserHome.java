package com.topcoder.web.ejb.user;

import java.rmi.RemoteException;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;

public interface ProjectUserHome extends EJBHome {
	public static final String EJB_REF_NAME = ProjectUserHome.class.getName();

    /**
     *
     * Creates the remote Contact EJB object
     *
     * @return a Contact EJB object
     *
     * @throws CreateException
     * @throws RemoteException
     */
    public ProjectUser create() throws CreateException, RemoteException;
}
