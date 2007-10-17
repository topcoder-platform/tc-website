package com.topcoder.ejb.JavaDocServices;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

public interface JavaDocServicesHome extends EJBHome {
    public JavaDocServices create() throws CreateException, RemoteException;
}
