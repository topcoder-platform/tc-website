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

    public static final String EJB_REF_NAME = "com.topcoder.web.ejb.messagehistory.MessageHistoryHome";
    
    /**
     *
     * This method returns a MessageHistory ejb.
     *
     */

    MessageHistory create() throws CreateException, RemoteException;
}
