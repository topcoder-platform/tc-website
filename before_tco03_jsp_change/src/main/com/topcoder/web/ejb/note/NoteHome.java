package com.topcoder.web.ejb.note;

import javax.ejb.EJBHome;
import javax.ejb.CreateException;
import java.rmi.RemoteException;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Dec 20, 2002 12:01:51 AM
 */
public interface NoteHome extends EJBHome {

    /**
     *
     * @return
     * @throws CreateException
     * @throws RemoteException
     */
    Note create() throws CreateException, RemoteException;
}
