package com.topcoder.web.ejb.project;

import java.rmi.RemoteException;

import javax.ejb.EJBException;
import javax.ejb.EJBLocalObject;

public interface ProjectRoleTermsOfUseLocal extends EJBLocalObject {
	public void createProjectRoleTermsOfUse(long projectId, long resourceRoleId,
			long termsOfUseId, String dataSource);

	public void removeProjectRoleTermsOfUse(long projectId, long resourceRoleId,
			long termsOfUseId, String dataSource);

	public boolean hasTermsOfUse(long projectId, long resourceRoleId,
			long termsOfUseId, String dataSource);
}
