package com.topcoder.web.ejb.forum;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

/**
 *
 * This class creates an instance of Forum ejb.
 *
 */

public interface ForumHome extends EJBHome {

    /**
     *
     * This method returns a Forum ejb.
     *
     */

    Forum create() throws CreateException, RemoteException;
}
