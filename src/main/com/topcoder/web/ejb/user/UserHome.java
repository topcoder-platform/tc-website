package com.topcoder.web.ejb.user;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.EJBHome;

public interface UserHome extends EJBHome {

  User create() throws CreateException, RemoteException;

};
