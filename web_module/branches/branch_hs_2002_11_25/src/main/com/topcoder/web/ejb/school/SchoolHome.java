package com.topcoder.web.ejb.school;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.EJBHome;

public interface SchoolHome extends EJBHome {

  School create() throws CreateException, RemoteException;

};
