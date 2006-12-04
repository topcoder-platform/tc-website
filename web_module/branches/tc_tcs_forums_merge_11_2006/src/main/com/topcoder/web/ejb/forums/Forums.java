package com.topcoder.web.ejb.forums;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;

import javax.ejb.EJBException;

import com.jivesoftware.forum.ForumCategory;

public interface Forums extends EJBObject {
    
    public void createMatchForum(int roundID) throws EJBException, RemoteException;

    public String[] getCategoryNames() throws EJBException, RemoteException;
    
    public int getThreadMessageCount(int threadID) throws EJBException, RemoteException;
    
    public void assignRole(long userID, long groupID) throws EJBException, RemoteException;
    
    public void removeRole(long userID, long groupID) throws EJBException, RemoteException;
    
    public String[][] getSoftwareCategoriesData() throws EJBException, RemoteException;
    
    public String[][] getSoftwareRolesData(long userID) throws EJBException, RemoteException;
    
    public String[][] getAllSoftwareRolesData() throws EJBException, RemoteException;
    
    public ForumCategory createSoftwareComponentForums(String componentName, String description, String versionText, long templateId)
    	throws EJBException, RemoteException;
}