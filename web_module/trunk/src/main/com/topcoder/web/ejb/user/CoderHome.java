package com.topcoder.web.ejb.user;

import javax.ejb.EJBHome;
import javax.ejb.CreateException;
import java.rmi.RemoteException;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Dec 19, 2002 11:31:25 PM
 */
public interface CoderHome extends EJBHome{

    /**
     *
     * @return Coder EJB Object
     * @throws CreateException
     * @throws RemoteException
     */
    Coder create() throws CreateException, RemoteException;
}
