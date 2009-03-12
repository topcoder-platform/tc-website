package com.topcoder.ejb.Util;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;


public interface UtilHome extends EJBHome {

    Util create() throws CreateException, RemoteException;

}
