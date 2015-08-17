package com.topcoder.web.ejb.query;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

/**
 *
 * @author   Greg Paul
 * @version  $Revision$
 */
public interface CommandGroupHome extends EJBHome {
    /**
     *
     * @return
     * @throws CreateException
     * @throws RemoteException
     */
    public CommandGroup create() throws CreateException, RemoteException;
}

