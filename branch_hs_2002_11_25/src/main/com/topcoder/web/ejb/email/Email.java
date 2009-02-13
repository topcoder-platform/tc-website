package com.topcoder.web.ejb.email;

import java.rmi.RemoteException;
import javax.ejb.EJBException;
import javax.ejb.EJBObject;

public interface Email extends EJBObject {

  public long createEmail(long _user_id) throws EJBException, RemoteException;

  public void setPrimaryEmailId(long _user_id,long _email_id)
                                           throws EJBException, RemoteException;

  public long getPrimaryEmailId(long _user_id)
                                           throws EJBException, RemoteException;

  public void setEmailTypeId(long _email_id,long _email_type_id)
                                           throws EJBException, RemoteException;

  public long getEmailTypeId(long _email_id)
                                           throws EJBException, RemoteException;

  public void setAddress(long _email_id,String _address)
                                           throws EJBException, RemoteException;

  public String getAddress(long _email_id) throws EJBException, RemoteException;

};
