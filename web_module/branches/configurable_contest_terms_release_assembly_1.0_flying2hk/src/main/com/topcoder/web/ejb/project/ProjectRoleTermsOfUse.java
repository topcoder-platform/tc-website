package com.topcoder.web.ejb.project;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;

public interface ProjectRoleTermsOfUse extends EJBObject {
	public void createProjectRoleTermsOfUse(long projectId, long resourceRoleId,
			long termsOfUseId, String dataSource) throws EJBException, RemoteException;

	public void removeProjectRoleTermsOfUse(long projectId, long resourceRoleId,
			long termsOfUseId, String dataSource) throws EJBException, RemoteException;

	public boolean hasTermsOfUse(long projectId, long resourceRoleId,
			long termsOfUseId, String dataSource) throws EJBException, RemoteException;
}
