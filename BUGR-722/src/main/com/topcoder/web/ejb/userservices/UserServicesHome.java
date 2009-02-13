package com.topcoder.web.ejb.userservices;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

public interface UserServicesHome extends EJBHome {
    
    public final static String EJB_REF_NAME = "com.topcoder.web.ejb.userservices.UserServicesHome";

    UserServices create() throws CreateException, RemoteException;
}
