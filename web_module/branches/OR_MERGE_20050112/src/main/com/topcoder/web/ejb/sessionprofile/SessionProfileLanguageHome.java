package com.topcoder.web.ejb.sessionprofile;

import javax.ejb.EJBHome;
import javax.ejb.CreateException;
import java.rmi.RemoteException;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Dec 20, 2002 12:13:08 AM
 */
public interface SessionProfileLanguageHome extends EJBHome {
    /**
     *
     * @return SessionProfileLanguage EJB Object
     * @throws CreateException
     * @throws RemoteException
     */
    SessionProfileLanguage create() throws CreateException, RemoteException;
}
