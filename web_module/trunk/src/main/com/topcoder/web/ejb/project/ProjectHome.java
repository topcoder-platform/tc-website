package com.topcoder.web.ejb.project;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

public interface ProjectHome extends EJBHome {

    public final static String EJB_REF_NAME = "com.topcoder.web.ejb.project.ProjectHome";

    Project create() throws CreateException, RemoteException;

}

;
