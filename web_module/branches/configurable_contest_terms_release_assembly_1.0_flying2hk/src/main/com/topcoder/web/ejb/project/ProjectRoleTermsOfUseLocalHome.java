package com.topcoder.web.ejb.project;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;

public interface ProjectRoleTermsOfUseLocalHome extends EJBLocalHome {
	ProjectRoleTermsOfUse create() throws CreateException;
}
