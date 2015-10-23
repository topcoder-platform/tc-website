package com.topcoder.web.ejb.session;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Dec 20, 2002 12:09:27 AM
 */
public interface SessionSegmentHome extends EJBHome {

    /**
     *
     * @return SessionSegment EJB Object
     * @throws CreateException
     * @throws RemoteException
     */
    SessionSegment create() throws CreateException, RemoteException;
}
