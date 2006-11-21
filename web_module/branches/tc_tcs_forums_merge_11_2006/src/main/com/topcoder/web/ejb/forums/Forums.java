package com.topcoder.web.ejb.forums;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.util.Iterator;

import javax.ejb.EJBException;

import com.jivesoftware.base.GroupNotFoundException;
import com.jivesoftware.base.UnauthorizedException;
import com.jivesoftware.base.UserNotFoundException;
import com.jivesoftware.forum.ForumCategoryNotFoundException;

public interface Forums extends EJBObject {
    
    public void createMatchForum(int roundID) throws EJBException, RemoteException;

    public String[] getCategoryNames() throws EJBException, RemoteException;
    
    public int getThreadMessageCount(int threadID) throws EJBException, RemoteException;
    
    public void assignRole(long userID, long groupID) throws EJBException, RemoteException,
		UserNotFoundException, UnauthorizedException, GroupNotFoundException;
    
    public void removeRole(long userID, long groupID) throws EJBException, RemoteException,
    	UserNotFoundException, UnauthorizedException, GroupNotFoundException;
    
    public Iterator getSoftwareCategories() throws EJBException, RemoteException, ForumCategoryNotFoundException;
    
    public Iterator getSoftwareRoles(long userID) throws EJBException, RemoteException, UserNotFoundException;
    
    public Iterator getAllSoftwareRoles() throws EJBException, RemoteException, UserNotFoundException;
}