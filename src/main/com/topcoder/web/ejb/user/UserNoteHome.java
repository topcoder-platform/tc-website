package com.topcoder.web.ejb.user;

import javax.ejb.EJBHome;
import javax.ejb.CreateException;
import java.rmi.RemoteException;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Dec 19, 2002 11:35:29 PM
 */
public interface UserNoteHome extends EJBHome {

    /**
     *
     * @return UserNote EJB Object
     * @throws CreateException
     * @throws RemoteException
     */
    UserNote create() throws CreateException, RemoteException;
}
