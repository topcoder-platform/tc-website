package com.topcoder.web.ejb.sessionprofile;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Dec 19, 2002 10:26:47 PM
 */

public interface SessionProfile extends EJBObject {

    /**
     *
     * @param desc
     * @param roundId
     * @return session profile id (int)
     * @throws RemoteException
     */
    public long createSessionProfile(String desc, long roundId)
            throws RemoteException;

    /**
     *
     * @param sessionProfileId
     * @param desc
     * @throws RemoteException
     */
    public void setSessionProfileDesc(long sessionProfileId, String desc)
            throws RemoteException;

    /**
     *
     * @param sessionProfileId
     * @param roundId
     * @throws RemoteException
     */
    public void setRoundId(long sessionProfileId, long roundId)
            throws RemoteException;

    /**
     *
     * @param sessionProfileId
     * @return
     * @throws RemoteException
     */
    public String getSessionProfileDesc(long sessionProfileId)
            throws RemoteException;

    /**
     *
     * @param sessionProfileId
     * @return
     * @throws RemoteException
     */
    public long getRoundId(long sessionProfileId)
            throws RemoteException;
}