package com.topcoder.web.ejb.user;

import java.rmi.RemoteException;
import javax.ejb.EJBObject;

public interface User extends EJBObject {

  public long createUser() throws RemoteException;

  public void setFirstName(String _first_name) throws RemoteException;

  public void setLastName(String _last_name) throws RemoteException;

  public void setUserStatusId(long _user_status_id) throws RemoteException;

  public String getFirstName() throws RemoteException;

  public String getLastName() throws RemoteException;

  public long getUserStatusId() throws RemoteException;

};
