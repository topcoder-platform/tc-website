package com.topcoder.web.ejb.session;

import com.topcoder.shared.ejb.BaseEJB;
import java.rmi.RemoteException;
import java.sql.Date;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Dec 20, 2002 12:34:57 AM
 */
public class SessionBeanStub extends BaseEJB {
    /**
     *
     * @param sessionProfileId
     * @param userId
     * @param beginTime
     * @param endTime
     * @param sendRepEmail
     * @param sendCandidateEmail
     * @param createUserId
     * @return session id
     */
    public long createSession(long sessionProfileId,
                              long userId,
                              Date beginTime,
                              Date endTime,
                              boolean sendRepEmail,
                              boolean sendCandidateEmail,
                              long createUserId)
            throws RemoteException {
        return 0;
    }

    /**
     *
     * @param sessionId
     * @param sessionProfileId
     */
    public void setSessionProfileId(long sessionId, long sessionProfileId)
            throws RemoteException {
    }

    /**
     *
     * @param sessionId
     * @param userId
     */
    public void setUserId(long sessionId, long userId)
            throws RemoteException {
    }

    /**
     *
     * @param sessionId
     * @param beginTime
     */
    public void setBeginTime(long sessionId, Date beginTime)
            throws RemoteException {
    }

    /**
     *
     * @param sessionId
     * @param endTime
     */
    public void setEndTime(long sessionId, Date endTime)
            throws RemoteException {
    }

    /**
     *
     * @param sessionId
     * @param sendRepEmail
     */
    public void setSendRepEmail(long sessionId, boolean sendRepEmail)
            throws RemoteException {
    }

    /**
     *
     * @param sessionId
     * @param sendCandidateEmail
     */
    public void setSendCandidateEmail(long sessionId, boolean sendCandidateEmail)
            throws RemoteException {
    }

    /**
     *
     * @param sessionId
     * @param createUserId
     */
    public void setCreateUserId(long sessionId, long createUserId)
            throws RemoteException {
    }

    /**
     *
     * @param sessionId
     * @return session profile Id
     */
    public long getSessionProfileId(long sessionId)
            throws RemoteException {
        return 0;
    }

    /**
     *
     * @param sessionId
     * @return user id
     */
    public long getUserId(long sessionId)
            throws RemoteException {
        return 0;
    }

    /**
     *
     * @param sessionId
     * @return Date of beginning session time
     */
    public Date getBeginTime(long sessionId)
            throws RemoteException {
        return null;
    }

    /**
     *
     * @param sessionId
     * @return Date of ending session time
     */
    public Date getEndTime(long sessionId)
            throws RemoteException {
        return null;
    }

    /**
     *
     * @param sessionId
     * @return SendRepEmail
     */
    public boolean getSendRepEmail(long sessionId)
            throws RemoteException {
        return false;
    }

    /**
     *
     * @param sessionId
     * @return sendCandidateEmail
     */
    public boolean getSendCandidateEmail(long sessionId)
            throws RemoteException {
        return false;
    }

    /**
     *
     * @param sessionId
     * @return userId
     */
    public long getCreateUserId(long sessionId)
            throws RemoteException {
        return 0;
    }
}
