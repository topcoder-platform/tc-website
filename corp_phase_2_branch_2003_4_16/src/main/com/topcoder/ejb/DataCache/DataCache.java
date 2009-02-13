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

    public ArrayList getNewsItems() throws TCException, RemoteException;

    public void resetNewsItems() throws TCException, RemoteException;

    public ArrayList getContactSubjects() throws TCException, RemoteException;

    public void resetContactSubjects() throws TCException, RemoteException;

    public ArrayList getCountries() throws TCException, RemoteException;

    public void resetCountries() throws TCException, RemoteException;

    public ArrayList getStates() throws TCException, RemoteException;

    public void resetStates() throws TCException, RemoteException;

    public ArrayList getCoderRegions() throws TCException, RemoteException;

    public void resetCoderRegions() throws TCException, RemoteException;

    public ArrayList getForums() throws TCException, RemoteException;

    public void resetForums() throws TCException, RemoteException;

    public ArrayList getDegrees() throws TCException, RemoteException;

    public void resetDegrees() throws TCException, RemoteException;

    public ArrayList getSkills() throws TCException, RemoteException;

    public void resetSkills() throws TCException, RemoteException;

    public ArrayList getSkillTypes() throws TCException, RemoteException;

    public void resetSkillTypes() throws TCException, RemoteException;

    public ArrayList getJobTypes() throws TCException, RemoteException;

    public void resetJobTypes() throws TCException, RemoteException;

    public ArrayList getEditors() throws TCException, RemoteException;

    public void resetEditors() throws TCException, RemoteException;

    public ArrayList getReferrals() throws TCException, RemoteException;

    public void resetReferrals() throws TCException, RemoteException;

    public ArrayList getLanguages() throws TCException, RemoteException;

    public void resetTitles() throws TCException, RemoteException;

    public ArrayList getTitles() throws TCException, RemoteException;

    public void resetOrganizations() throws TCException, RemoteException;

    public ArrayList getOrganizations() throws TCException, RemoteException;

    public void resetExperienceTypes() throws TCException, RemoteException;

    public ArrayList getExperienceTypes() throws TCException, RemoteException;

    public void resetSectorFiles() throws TCException, RemoteException;

    public ArrayList getSectorFiles() throws TCException, RemoteException;

    public void resetLanguages() throws TCException, RemoteException;

    public void resetCoderTypes() throws TCException, RemoteException;

    public ArrayList getCoderTypes() throws TCException, RemoteException;

    public void resetDemographicAssignments() throws TCException, RemoteException;

    public ArrayList getDemographicAssignments(int coderTypeId) throws TCException, RemoteException;

    public byte[] setMemberCount(int memberCount) throws TCException, RemoteException;

    public int getMemberCount() throws TCException, RemoteException;

}
