package com.topcoder.web.ejb.sessionprofile;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;

/**
 *
 * @author Fred Wang (fred@fredwang.com)
 * @version $Revision$
 * Dec 20, 2002 12:11:18 AM
 */

public interface SessionProfileLanguage extends EJBObject{

    /**
     *
     * @param sessionProfileId
     * @param languageId
     * @throws RemoteException
     */
    public void createProfileLanguage(long sessionProfileId, int languageId)
            throws RemoteException;

    /**
     *
     * @param sessionProfileId
     * @param languageId
     * @throws RemoteException
     */
    public void removeProfileLanguage(long sessionProfileId, int languageId)
            throws RemoteException;
}
