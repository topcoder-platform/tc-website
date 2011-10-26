package com.topcoder.web.ejb.session;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

/**
 * Session Home Interface
 * @author Fred Wang (silentmobius)
 * @version $Revision: 14749 $
 */

public interface SessionHome extends EJBHome {

    /**
     *
     * @return Session EBJ Object
     * @throws CreateException
     * @throws RemoteException
     */
    Session create() throws CreateException, RemoteException;
}
