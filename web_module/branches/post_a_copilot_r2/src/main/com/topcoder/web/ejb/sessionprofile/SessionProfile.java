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
     * @param companyId
     * @return session profile id (int)
     * @throws RemoteException
     */
    public long createSessionProfile(String desc, long companyId)
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
     * @param sessionRoundId
     * @throws RemoteException
     */
    public void setSessionRoundId(long sessionProfileId, long sessionRoundId)
            throws RemoteException;


    /**
     *
     * @param sessionProfileId
     * @param companyId
     * @throws RemoteException
     */
    public void setCompanyId(long sessionProfileId, long companyId)
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
    public long getSessionRoundId(long sessionProfileId)
            throws RemoteException;

    /**
     *
     * @param sessionProfileId
     * @return
     * @throws RemoteException
     */
    public long getCompanyId(long sessionProfileId)
            throws RemoteException;
}
