package com.topcoder.web.ejb.session;

import java.sql.Date;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;

/**
 * The interface for the Session EJB.
 * This stateless session EJB controls user session information
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 */
public interface Session extends EJBObject {

    /**
     *
     * @param sessionProfileId
     * @param userId
     * @param beginTime
     * @param endTime
     * @param sendRepEmail
     * @param sendCandidateEmail
     * @param createUserId
     * @return
     */
    public long createSession(long sessionProfileId,
                              long userId,
                              Date beginTime,
                              Date endTime,
                              boolean sendRepEmail,
                              boolean sendCandidateEmail,
                              long createUserId)
            throws RemoteException;

    /**
     *
     * @param sessionId
     * @param sessionProfileId
     */
    public void setSessionProfileId(long sessionId, long sessionProfileId)
            throws RemoteException;

    /**
     *
     * @param sessionId
     * @param userId
     */
    public void setUserId(long sessionId, long userId)
            throws RemoteException;

    /**
     *
     * @param sessionId
     * @param beginTime
     */
    public void setBeginTime(long sessionId, Date beginTime)
            throws RemoteException;

    /**
     *
     * @param sessionId
     * @param endTime
     */
    public void setEndTime(long sessionId, Date endTime)
            throws RemoteException;

    /**
     *
     * @param sessionId
     * @param sendRepEmail
     */
    public void setSendRepEmail(long sessionId, boolean sendRepEmail)
            throws RemoteException;

    /**
     *
     * @param sessionId
     * @param sendCandidateEmail
     */
    public void setSendCandidateEmail(long sessionId, boolean sendCandidateEmail)
            throws RemoteException;

    /**
     *
     * @param sessionId
     * @param createUserId
     */
    public void setCreateUserId(long sessionId, long createUserId)
            throws RemoteException;

    /**
     *
     * @param sessionId
     * @return long of session profile Id
     */
    public long getSessionProfileId(long sessionId)
            throws RemoteException;

    /**
     *
     * @param sessionId
     * @return long of user id
     */
    public long getUserId(long sessionId)
            throws RemoteException;

    /**
     *
     * @param sessionId
     * @return Date of beginning session time
     */
    public Date getBeginTime(long sessionId)
            throws RemoteException;

    /**
     *
     * @param sessionId
     * @return Date of ending session time
     */
    public Date getEndTime(long sessionId)
            throws RemoteException;

    /**
     *
     * @param sessionId
     * @return
     */
    public boolean getSendRepEmail(long sessionId)
            throws RemoteException;

    /**
     *
     * @param sessionId
     * @return
     */
    public boolean getSendCandidateEmail(long sessionId)
            throws RemoteException;

    /**
     *
     * @param sessionId
     * @return
     */
    public long getCreateUserId(long sessionId)
            throws RemoteException;
}