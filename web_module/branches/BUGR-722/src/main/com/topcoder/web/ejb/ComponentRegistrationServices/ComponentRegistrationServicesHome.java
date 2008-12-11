package com.topcoder.web.ejb.ComponentRegistrationServices;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

public interface ComponentRegistrationServicesHome extends EJBHome {

    public final static String EJB_REF_NAME = "com.topcoder.web.ejb.project.ProjectHome";

    ComponentRegistrationServices create() throws CreateException, RemoteException;

}

;
