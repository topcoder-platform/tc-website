package com.topcoder.web.ejb.email;

import javax.ejb.EJBObject;

import java.rmi.RemoteException;
import javax.ejb.EJBException;

/**
*
* @author   George Nassar
* @version  $Revision$
*
*/

public interface Email extends EJBObject {
    long createEmail(long userId) throws RemoteException, EJBException;
    long getEmailTypeId(long userId, long emailId) throws RemoteException, EJBException;
    String getAddress(long userId, long emailId) throws RemoteException, EJBException;
    void setEmailTypeId(long userId, long emailId, long emailTypeId) throws RemoteException, EJBException;
    void setAddress(long userId, long emailId, String address) throws RemoteException, EJBException;
}