package com.topcoder.web.ejb.user;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.EJBHome;

public interface UserTermsOfUseHome extends EJBHome {

  UserTermsOfUse create() throws CreateException, RemoteException;

};
