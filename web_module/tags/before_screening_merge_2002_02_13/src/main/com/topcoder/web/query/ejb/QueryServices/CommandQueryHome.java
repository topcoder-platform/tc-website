package com.topcoder.web.query.ejb.QueryServices;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

/**
 *
 * @author   Greg Paul
 * @version  $Revision$
 */
public interface CommandQueryHome extends EJBHome {
    /**
     *
     * @return
     * @throws CreateException
     * @throws RemoteException
     */
    public CommandQuery create() throws CreateException, RemoteException;
}

