package com.topcoder.web.project.ejb.ProjectServices;

import javax.ejb.*;
import java.rmi.RemoteException;

public interface ProjectServicesHome extends EJBHome {
    public ProjectServices create() throws CreateException, RemoteException;
}
