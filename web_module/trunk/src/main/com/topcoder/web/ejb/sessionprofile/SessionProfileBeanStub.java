package com.topcoder.web.ejb.sessionprofile;

import com.topcoder.shared.ejb.BaseEJB;
import java.rmi.RemoteException;
import java.rmi.RemoteException;

/**
 *
 * @author Fred Wang (fred@fredwang.com)
 * @version $Revision$ 
 * Dec 23, 2002 12:44:49 AM
 */
public class SessionProfileBeanStub extends BaseEJB {
    /**
     *
     * @param desc
     * @param roundId
     * @return session profile id (int)
     * @throws RemoteException
     */
    public long createSessionProfile(String desc, long roundId)
            throws RemoteException {
        return 0;
    }

    /**
     *
     * @param sessionProfileId
     * @param desc
     * @throws RemoteException
     */
    public void setSessionProfileDesc(long sessionProfileId, String desc)
            throws RemoteException {
    }

    /**
     *
     * @param sessionProfileId
     * @param roundId
     * @throws RemoteException
     */
    public void setRoundId(long sessionProfileId, long roundId)
            throws RemoteException {
    }

    /**
     *
     * @param sessionProfileId
     * @return
     * @throws RemoteException
     */
    public String getSessionProfileDesc(long sessionProfileId)
            throws RemoteException {
        return null;
    }

    /**
     *
     * @param sessionProfileId
     * @return
     * @throws RemoteException
     */
    public long getRoundId(long sessionProfileId)
            throws RemoteException {
        return 0;
    }
}
