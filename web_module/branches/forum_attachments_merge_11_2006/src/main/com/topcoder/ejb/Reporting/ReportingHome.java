package com.topcoder.ejb.Reporting;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;


public interface ReportingHome extends EJBHome {

    Reporting create() throws CreateException, RemoteException;

}
