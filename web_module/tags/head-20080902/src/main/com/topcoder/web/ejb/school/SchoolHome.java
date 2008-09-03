package com.topcoder.web.ejb.school;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

public interface SchoolHome extends EJBHome {

    School create() throws CreateException, RemoteException;

}
