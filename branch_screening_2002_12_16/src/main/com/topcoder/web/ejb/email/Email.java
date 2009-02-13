package com.topcoder.web.ejb.email;

import java.rmi.RemoteException;
import javax.ejb.EJBObject;
import javax.ejb.EJBException;

public interface Email extends EJBObject {

    public long createEmail(long _user_id) throws RemoteException;

    public long getEmailTypeId(long _email_id,long _user_id) throws RemoteException;

    public String getAddress(long _email_id,long _user_id) throws RemoteException;

    public void setEmailTypeId(long _email_id,long _user_id,long _email_type_id) throws RemoteException;

    public void setAddress(long _email_id,long _user_id,String _address) throws RemoteException;

    public void setPrimary(long emailId, long userId, boolean primary) throws RemoteException, EJBException;

    public boolean getPrimary(long emailId, long userId) throws RemoteException, EJBException;

    public long getPrimaryForUser(long userId) throws RemoteException, EJBException;

};
