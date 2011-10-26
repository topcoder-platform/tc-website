package com.topcoder.web.ejb.query;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

/**
 *
 * @author   Greg Paul
 * @version  $Revision: 19692 $
 */
public interface QueryInputHome extends EJBHome {
    /**
     *
     * @return
     * @throws CreateException
     * @throws RemoteException
     */
    public QueryInput create() throws CreateException, RemoteException;
}

