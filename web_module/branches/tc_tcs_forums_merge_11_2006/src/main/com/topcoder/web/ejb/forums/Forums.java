package com.topcoder.web.ejb.forums;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.util.Iterator;

import javax.ejb.EJBException;

public interface Forums extends EJBObject {
    
    public void createMatchForum(int roundID) throws EJBException, RemoteException;

    public String[] getCategoryNames() throws EJBException, RemoteException;
    
    public int getThreadMessageCount(int threadID) throws EJBException, RemoteException;
    
    public void assignRole(long userID, long groupID) throws EJBException, RemoteException;
    
    public void removeRole(long userID, long groupID) throws EJBException, RemoteException;
    
    public Iterator getSoftwareCategories() throws EJBException, RemoteException;
    
    public Iterator getSoftwareRoles(long userID) throws EJBException, RemoteException;
    
    public Iterator getAllSoftwareRoles() throws EJBException, RemoteException;
}