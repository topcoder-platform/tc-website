package com.topcoder.web.ejb.email;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;

public interface Email extends EJBObject {

    public long createEmail(long userId) throws EJBException, RemoteException;

    public void setPrimaryEmailId(long userId, long _email_id)
            throws EJBException, RemoteException;

    public long getPrimaryEmailId(long userId)
            throws EJBException, RemoteException;

    public void setEmailTypeId(long _email_id, long _email_type_id)
            throws EJBException, RemoteException;

    public long getEmailTypeId(long _email_id)
            throws EJBException, RemoteException;

    public void setAddress(long _email_id, String _address)
            throws EJBException, RemoteException;

    public String getAddress(long _email_id) throws EJBException, RemoteException;

}

;
