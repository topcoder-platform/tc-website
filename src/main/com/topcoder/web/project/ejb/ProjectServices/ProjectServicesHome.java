package com.topcoder.web.project.ejb.ProjectServices;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

public interface ProjectServicesHome extends EJBHome {
    public ProjectServices create() throws CreateException, RemoteException;
}
