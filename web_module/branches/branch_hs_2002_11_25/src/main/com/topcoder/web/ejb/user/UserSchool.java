package com.topcoder.web.ejb.user;

import java.rmi.RemoteException;
import javax.ejb.EJBObject;

public interface User extends EJBObject {

  public void createUserSchool(long _user_id,long _school_id) throws RemoteException;

  public boolean isCurrent(long _user_id,long _school_id) throws RemoteException;

  public void setCurrent(long _user_id,long _school_id,boolean _current) throws RemoteException;

  public void removeUserSchool(long _user_id,long _school_id) throws RemoteException;

};
