package com.topcoder.ejb.User;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.EJBHome;

public interface UserTermsOfUseHome extends EJBHome {

  UserTermsOfUse create() throws CreateException, RemoteException;

};
