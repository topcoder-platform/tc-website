package com.topcoder.web.ejb.user;

import java.rmi.RemoteException;
import javax.ejb.EJBObject;

public interface User extends EJBObject {

  public long createUser() throws RemoteException;

  public void setFirstName(long _user_id,String _first_name) throws RemoteException;

  public void setLastName(long _user_id,String _last_name) throws RemoteException;

  public void setUserStatusId(long _user_id,long _user_status_id) throws RemoteException;

  public String getFirstName(long _user_id) throws RemoteException;

  public String getLastName(long _user_id) throws RemoteException;

  public long getUserStatusId(long _user_id) throws RemoteException;

};
