package com.topcoder.web.ejb.user;

import java.rmi.RemoteException;
import javax.ejb.EJBException;
import javax.ejb.EJBObject;

public interface UserSchool extends EJBObject {

  public void createUserSchool(long _user_id,long _school_id)
                                           throws EJBException, RemoteException;

  public boolean isCurrent(long _user_id,long _school_id)
                                           throws EJBException, RemoteException;

  public void setCurrent(long _user_id,long _school_id,boolean _current)
                                           throws EJBException, RemoteException;

  public void removeUserSchool(long _user_id,long _school_id)
                                           throws EJBException, RemoteException;

};
