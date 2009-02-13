package com.topcoder.ejb.DataCache;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

/**
 *
 * This class creates an instance of DataCache ejb.
 *
 */

public interface DataCacheHome extends EJBHome {

    /**
     *
     * This method returns a DataCache ejb.
     *
     */

    DataCache create() throws CreateException, RemoteException;
}
