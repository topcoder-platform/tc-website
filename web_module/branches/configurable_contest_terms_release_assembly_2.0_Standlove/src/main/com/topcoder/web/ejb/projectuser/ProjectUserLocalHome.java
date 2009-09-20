package com.topcoder.web.ejb.projectuser;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;

public interface ProjectUserLocalHome extends EJBLocalHome {
	ProjectUserLocal create() throws CreateException;
}
