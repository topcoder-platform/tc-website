package com.topcoder.web.ejb.forums;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import javax.ejb.EJBException;

import com.jivesoftware.base.UnauthorizedException;
import com.jivesoftware.forum.ForumCategoryNotFoundException;

public interface Forums extends EJBObject {
    
    public void createMatchForum(int roundID) throws EJBException, RemoteException;

    public String[] getCategoryNames() throws EJBException, RemoteException;
    
    public int numSoftwareCategories() throws EJBException, RemoteException, ForumCategoryNotFoundException;
    
    public void addSoftwareCategory() throws EJBException, RemoteException, ForumCategoryNotFoundException, UnauthorizedException;
}