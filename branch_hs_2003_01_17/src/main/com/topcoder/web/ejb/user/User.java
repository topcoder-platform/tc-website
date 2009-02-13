package com.topcoder.web.ejb.user;

import java.rmi.RemoteException;
import javax.ejb.EJBException;
import javax.ejb.EJBObject;

public interface User extends EJBObject {

    public void createUser(long userId,String handle,char status)
                                           throws EJBException, RemoteException;


    public void setFirstName(long userId,String firstName)
                                           throws EJBException, RemoteException;

    public void setLastName(long userId,String lastName)
                                           throws EJBException, RemoteException;

    public void setUserStatusId(long userId,long userStatusId)
                                           throws EJBException, RemoteException;

    public String getFirstName(long userId)
                                           throws EJBException, RemoteException;

    public String getLastName(long userId) throws EJBException, RemoteException;

    public long getUserStatusId(long userId)
                                           throws EJBException, RemoteException;

};
