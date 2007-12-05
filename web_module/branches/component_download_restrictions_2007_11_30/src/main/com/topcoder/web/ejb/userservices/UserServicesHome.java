package com.topcoder.web.ejb.userservices;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

public interface UserServicesHome extends EJBHome {
    UserServices create() throws CreateException, RemoteException;
}
