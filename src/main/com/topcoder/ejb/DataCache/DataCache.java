package com.topcoder.ejb.DataCache;

import com.topcoder.common.web.error.TCException;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.TreeSet;


public interface DataCache extends EJBObject {

    public ArrayList getNotifications() throws TCException, RemoteException;

    public void resetNotifications() throws TCException, RemoteException;

    public ArrayList getRounds() throws TCException, RemoteException;

    public void resetRounds() throws TCException, RemoteException;

    public byte[] resetAll() throws TCException, RemoteException;

    public ArrayList getAdContests() throws TCException, RemoteException;

    public TreeSet getContestNavs(String strContestNo) throws TCException, RemoteException;

    public void resetContestNavs() throws TCException, RemoteException;

    public void resetMemberCount() throws TCException, RemoteException;

    public void resetContestNavs(String strContestNo) throws TCException, RemoteException;

    public ArrayList getContests() throws TCException, RemoteException;

    public void resetContests() throws TCException, RemoteException;

    public ArrayList getSchools() throws TCException, RemoteException;

    public void resetSchools() throws TCException, RemoteException;

    public ArrayList getCountries() throws TCException, RemoteException;

    public void resetCountries() throws TCException, RemoteException;

    public ArrayList getStates() throws TCException, RemoteException;

    public void resetStates() throws TCException, RemoteException;

    public ArrayList getDegrees() throws TCException, RemoteException;

    public void resetDegrees() throws TCException, RemoteException;

    public ArrayList getJobTypes() throws TCException, RemoteException;

    public void resetJobTypes() throws TCException, RemoteException;

    public ArrayList getEditors() throws TCException, RemoteException;

    public void resetEditors() throws TCException, RemoteException;

    public ArrayList getReferrals() throws TCException, RemoteException;

    public void resetReferrals() throws TCException, RemoteException;

    public ArrayList getLanguages() throws TCException, RemoteException;

    public void resetLanguages() throws TCException, RemoteException;

    public void resetDemographicAssignments() throws TCException, RemoteException;

    public ArrayList getDemographicAssignments(int coderTypeId) throws TCException, RemoteException;

    public byte[] setMemberCount(int memberCount) throws TCException, RemoteException;

    public int getMemberCount() throws TCException, RemoteException;

}
