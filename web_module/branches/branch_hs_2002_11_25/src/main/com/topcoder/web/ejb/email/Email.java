package com.topcoder.web.ejb.email;

import java.rmi.RemoteException;
import javax.ejb.EJBObject;

public interface Email extends EJBObject {

  public long createEmail(long _user_id) throws RemoteException;

  public long getEmailTypeId(long _user_id,long _email_id) throws RemoteException;

  public String getAddress(long _user_id,long _email_id) throws RemoteException;

  public void setEmailTypeId(long _user_id,long _email_id,long _email_type_id) throws RemoteException;

  public void setAddress(long _user_id,long _email_id,String _address) throws RemoteException;

};
