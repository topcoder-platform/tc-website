package com.topcoder.web.ejb.forums;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

/**
 *
 * This class creates an instance of Forums ejb.
 *
 */

public interface ForumsHome extends EJBHome {

    /**
     *
     * This method returns a Forums ejb.
     *
     */

    Forums create() throws CreateException, RemoteException;
}
