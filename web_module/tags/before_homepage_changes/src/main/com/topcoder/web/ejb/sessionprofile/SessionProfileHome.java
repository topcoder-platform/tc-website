package com.topcoder.web.ejb.sessionprofile;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Dec 19, 2002 10:27:43 PM
 */

public interface SessionProfileHome extends EJBHome {

    /**
     *
     * @return SessionProfile EJB
     * @throws CreateException
     * @throws RemoteException
     */
    SessionProfile create() throws CreateException, RemoteException;
}
