package com.topcoder.web.ejb.projectuser;


import javax.ejb.EJBException;
import javax.ejb.EJBLocalObject;

public interface ProjectUserLocal extends EJBLocalObject {
	void auditProjectUser(ProjectUserEntity entity, String dataSource)
    	throws EJBException;
	
	long getORProjectId(long componentVersionId, String dataSource)
   		throws EJBException;

}
