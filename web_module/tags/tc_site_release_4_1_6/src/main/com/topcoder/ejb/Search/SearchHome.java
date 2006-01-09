package com.topcoder.ejb.Search;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

/**
 *
 * This class creates an instance of Search ejb.
 *
 */

public interface SearchHome extends EJBHome {

    /**
     *
     * This method returns a Search ejb.
     *
     */

    Search create() throws CreateException, RemoteException;
}
