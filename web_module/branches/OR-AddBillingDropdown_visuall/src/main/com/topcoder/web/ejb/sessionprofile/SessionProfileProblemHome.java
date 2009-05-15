package com.topcoder.web.ejb.sessionprofile;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Dec 19, 2002 10:39:26 PM
 */
public interface SessionProfileProblemHome extends EJBHome {

    /**
     *
     * @return SessionProfileProblem EJB
     * @throws CreateException
     * @throws RemoteException
     */
    SessionProfileProblem create() throws CreateException, RemoteException;

}
