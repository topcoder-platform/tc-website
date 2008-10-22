package com.topcoder.ejb.ContestAdminServices;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;


public interface ContestAdminServicesHome extends EJBHome {

    ContestAdminServices create() throws CreateException, RemoteException;

}
