package com.topcoder.web.ejb.school;

import java.rmi.RemoteException;
import javax.ejb.EJBObject;

public interface School extends EJBObject {

  public long createSchool() throws RemoteException;

  public String getSchoolDivisionCode(long _school_id) throws RemoteException;

  public String getFullName(long _school_id) throws RemoteException;

  public String getShortName(long _school_id) throws RemoteException;

  public void setSchoolDivisionCode(long _school_id,String _school_division_code) throws RemoteException;

  public void setFullName(long _school_id,String _full_name) throws RemoteException;

  public void setShortName(long _school_id,String _short_name) throws RemoteException;

};
