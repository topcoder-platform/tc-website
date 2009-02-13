package com.topcoder.web.ejb.email;

import java.rmi.RemoteException;
import javax.ejb.EJBException;
import javax.ejb.EJBObject;

public interface Email extends EJBObject {

    public long createEmail(long userID) throws EJBException, RemoteException;

    public void setPrimaryEmailId(long userID,long emailID)
                                           throws EJBException, RemoteException;

    public long getPrimaryEmailId(long userId)
                                           throws EJBException, RemoteException;

    public void setEmailTypeId(long emailId,long emailTypeId)
                                           throws EJBException, RemoteException;

    public long getEmailTypeId(long emailId)
                                           throws EJBException, RemoteException;

    public void setAddress(long emailId,String address)
                                           throws EJBException, RemoteException;

    public String getAddress(long emailId) throws EJBException, RemoteException;

};
