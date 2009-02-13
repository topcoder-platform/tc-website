package com.topcoder.ejb.AuthenticationServices;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

public interface AuthenticationServicesHome extends EJBHome {

    AuthenticationServices create() throws CreateException, RemoteException;

}
