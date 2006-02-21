package com.topcoder.web.ejb.user;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Dec 19, 2002 11:33:27 PM
 */
public interface UserNote extends EJBObject {

    /**
     *
     * @param userId
     * @param noteId
     * @throws RemoteException
     */
    public void createUserNote(long userId, long noteId, String dataSource)
            throws RemoteException;

    /**
     *
     * @param userId
     * @param noteId
     * @throws RemoteException
     */
    public void removeUserNote(long userId, long noteId, String dataSource)
            throws RemoteException;

}