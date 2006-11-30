package com.topcoder.web.ejb.messagehistory;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

/**
 *
 * This class creates an instance of MessageHistory ejb.
 *
 */

public interface MessageHistoryHome extends EJBHome {

    /**
     *
     * This method returns a MessageHistory ejb.
     *
     */

    MessageHistory create() throws CreateException, RemoteException;
}
