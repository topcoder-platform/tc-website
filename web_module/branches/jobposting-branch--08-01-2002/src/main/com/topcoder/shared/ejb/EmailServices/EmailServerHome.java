package com.topcoder.shared.ejb.EmailServices;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

/**
 * @author   Eric Ellingson
 * @version  $Revision$
 *  Log of Changes:
 *           $Log$
 *           Revision 1.3  2002/07/16 21:37:45  gpaul
 *           merging in sord email changes
 *
 *           Revision 1.1.2.1  2002/04/25 04:52:35  sord
 *           Initial version.
 *
 */
public interface EmailServerHome extends EJBHome {
    /**
     *
     * @return
     * @throws CreateException
     * @throws RemoteException
     */
    public EmailServer create() throws CreateException, RemoteException;
}

