package com.topcoder.web.ejb.resume;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

public interface ResumeServicesHome extends EJBHome {
    ResumeServices create() throws CreateException, RemoteException;
}
