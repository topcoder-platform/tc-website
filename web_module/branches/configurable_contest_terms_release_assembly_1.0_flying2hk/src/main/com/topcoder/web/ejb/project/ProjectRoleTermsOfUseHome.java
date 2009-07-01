package com.topcoder.web.ejb.project;

import java.rmi.RemoteException;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;


public interface ProjectRoleTermsOfUseHome extends EJBHome {
	public final static String EJB_REF_NAME =
        "com.topcoder.web.ejb.project.ProjectRoleTermsOfUseHome";

	ProjectRoleTermsOfUse create() throws CreateException, RemoteException;
}
