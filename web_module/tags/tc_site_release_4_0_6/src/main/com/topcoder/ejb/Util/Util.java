package com.topcoder.ejb.Util;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;

public interface Util extends EJBObject {

//    public void registerForTourny(int coderId, int roundId, int contestId)
    public void registerForTourny(int coderId, int contestId)
            throws RemoteException;

    public void addResponse(int coderId, int answerId, int questionId)
            throws RemoteException;

    public java.sql.Date getCurrentDate()
            throws RemoteException;

    public java.sql.Time getCurrentTime()
            throws RemoteException;

    public java.sql.Timestamp getCurrentTimestamp()
            throws RemoteException;

    public void insertJMSError(int coderId, String msg)
            throws RemoteException;

    public void incrementAdvertiserHitCount(int advertiserId)
            throws RemoteException;

    public String getRegionCode(String stateCode, int userTypeId)
            throws RemoteException;

    public boolean allowFullResume(int subscriberId, int coderId)
            throws RemoteException;

    public void incrementJobPostingHits(int jobPostingId, int userId)
            throws RemoteException;

    public void incrementPressReleaseHitCount(int id, String host)
            throws RemoteException;

    public void incrementSponsorHitCount(String link, String refer)
            throws RemoteException;

}
