package com.topcoder.web.ejb.email;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.EJBHome;

public interface EmailHome extends EJBHome {

  Email create() throws CreateException, RemoteException;

};
