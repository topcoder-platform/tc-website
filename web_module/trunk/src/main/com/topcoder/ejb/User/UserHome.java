package com.topcoder.ejb.User;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.EJBHome;

public interface UserHome extends EJBHome {

  User create() throws CreateException, RemoteException;

};
