package com.topcoder.web.ejb.user;

import javax.ejb.EJBObject;

import java.rmi.RemoteException;
import javax.ejb.EJBException;

/**
*
* @author   George Nassar
* @version  $Revision$
*
*/

public interface UserAddress extends EJBObject {
    void createUserAddress(long userId, long addressId) throws RemoteException, EJBException;
    void removeUserAddress(long userId, long addressId) throws RemoteException, EJBException;
}