package com.topcoder.ejb.AuthenticationServices;

import javax.ejb.*;
import java.rmi.RemoteException;

public interface AuthenticationServicesHome extends EJBHome {

  AuthenticationServices create() throws CreateException, RemoteException;

}
