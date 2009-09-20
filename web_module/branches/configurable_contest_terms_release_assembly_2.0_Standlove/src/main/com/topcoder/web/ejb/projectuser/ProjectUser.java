package com.topcoder.web.ejb.projectuser;

import java.rmi.RemoteException;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;

public interface ProjectUser extends EJBObject {
	/**
    * 
    */
   void auditProjectUser(ProjectUserEntity entity, String dataSource)
           throws RemoteException, EJBException;
   
   long getORProjectId(long componentVersionId, String dataSource)
   	throws RemoteException, EJBException;
}
