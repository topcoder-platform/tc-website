package com.topcoder.ejb.CoderStatistics;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

/**
 *
 * This class creates an instance of Statistical ejb.
 *
 */

public interface CoderStatisticsHome extends EJBHome {

    /**
     *
     * This method returns a Statistical ejb.
     *
     */

    CoderStatistics create() throws CreateException, RemoteException;
}
