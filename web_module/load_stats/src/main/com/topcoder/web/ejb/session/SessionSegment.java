package com.topcoder.web.ejb.session;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.sql.Date;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Dec 20, 2002 12:03:48 AM
 */

public interface SessionSegment extends EJBObject {

    /**
     *
     * @param sessionId
     * @param sessionSegmentId
     * @param segmentLength
     * @throws RemoteException
     */
    public void createSessionSegment(long sessionId,
                                     long sessionSegmentId,
                                     long segmentLength)
            throws RemoteException;

    /**
     *
     * @param sessionId
     * @param sessionSegmentId
     * @param startTime
     * @throws RemoteException
     */
    public void setStartTime(long sessionId,
                             long sessionSegmentId,
                             Date startTime)
            throws RemoteException;

    /**
     *
     * @param sessionId
     * @param sessionSegmentId
     * @param endTime
     * @throws RemoteException
     */
    public void setEndTime(long sessionId,
                           long sessionSegmentId,
                           Date endTime)
            throws RemoteException;

    /**
     *
     * @param sessionId
     * @param sessionSegmentId
     * @param segmentLength
     * @throws RemoteException
     */
    public void setSegmentLength(long sessionId,
                                 long sessionSegmentId,
                                 long segmentLength)
            throws RemoteException;

    /**
     *
     * @param sessionId
     * @param sessionSegmentId
     * @return SessionSegment startTime Date
     * @throws RemoteException
     */
    public Date getStartTime(long sessionId, long sessionSegmentId)
            throws RemoteException;

    /**
     *
     * @param sessionId
     * @param sessionSegmentId
     * @return SessionSegment endTime Date
     * @throws RemoteException
     */
    public Date getEndTime(long sessionId, long sessionSegmentId)
            throws RemoteException;

    /**
     *
     * @param sessionId
     * @param sessionSegmentId
     * @return segmentLength in millesecs
     * @throws RemoteException
     */
    public long getSegmentLength(long sessionId, long sessionSegmentId)
            throws RemoteException;

    /**
     *
     * @param sessionId
     * @param sessionSegmentId
     * @return SessionSegment Description
     * @throws RemoteException
     */

    public String getSessionSegmentDesc(long sessionId, long sessionSegmentId)
            throws RemoteException;
}
