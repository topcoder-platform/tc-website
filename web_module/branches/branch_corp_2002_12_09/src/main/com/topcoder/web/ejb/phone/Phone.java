package com.topcoder.web.ejb.phone;

import javax.ejb.EJBObject;

import java.rmi.RemoteException;
import javax.ejb.EJBException;

/**
*
* @author   George Nassar
* @version  $Revision$
*
*/

public interface Phone extends EJBObject {
    long createPhone(long userId) throws RemoteException, EJBException;
    long getPhoneTypeId(long userId, long phoneId) throws RemoteException, EJBException;
    String getNumber(long userId, long phoneId) throws RemoteException, EJBException;
    void setPhoneTypeId(long userId, long phoneId, long phoneTypeId) throws RemoteException, EJBException;
    void setNumber(long userId, long phoneId, String number) throws RemoteException, EJBException;
}