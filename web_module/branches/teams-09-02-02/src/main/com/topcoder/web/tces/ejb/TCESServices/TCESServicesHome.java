package com.topcoder.web.tces.ejb.TCESServices;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

/**
 *
 * This class creates an instance of TCESServices ejb.
 *
 */

public interface TCESServicesHome extends EJBHome {

    /**
     *
     * This method returns a TCESServices ejb.
     *
     */

    TCESServices create() throws CreateException, RemoteException;
}
