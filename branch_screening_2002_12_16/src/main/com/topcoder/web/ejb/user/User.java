package com.topcoder.web.ejb.user;

import java.rmi.RemoteException;
import javax.ejb.EJBObject;
import javax.ejb.EJBException;

public interface User extends EJBObject {

  public void createUser(long userId, String handle, char status) 
                                           throws RemoteException, EJBException;

  public void setFirstName(long _user_id,String _first_name) throws RemoteException, EJBException;

  public void setLastName(long _user_id,String _last_name) throws RemoteException, EJBException;

  public void setUserStatusId(long _user_id,long _user_status_id) throws RemoteException, EJBException;

  public String getFirstName(long _user_id) throws RemoteException, EJBException;

  public String getLastName(long _user_id) throws RemoteException, EJBException;

  public long getUserStatusId(long _user_id) throws RemoteException, EJBException;

  public boolean userExists(long userId) throws RemoteException, EJBException;
};
