package com.topcoder.web.ejb.address;

import javax.ejb.EJBObject;

import java.rmi.RemoteException;
import javax.ejb.EJBException;

/**
*
* @author   George Nassar
* @version  $Revision$
*
*/

public interface Address extends EJBObject {
    long createAddress() throws RemoteException, EJBException;
    long getAddressTypeId(long addressId) throws RemoteException, EJBException;
    String getAddress1(long addressId) throws RemoteException, EJBException;
    String getAddress2(long addressId) throws RemoteException, EJBException;
    String getCity(long addressId) throws RemoteException, EJBException;
    String getStateCode(long addressId) throws RemoteException, EJBException;
    String getZip(long addressId) throws RemoteException, EJBException;
    String getCountryCode(long addressId) throws RemoteException, EJBException;
    void setAddressTypeId(long addressId, long addressTypeId) throws RemoteException, EJBException;
    void setAddress1(long addressId, String address1) throws RemoteException, EJBException;
    void setAddress2(long addressId, String address2) throws RemoteException, EJBException;
    void setCity(long addressId, String city) throws RemoteException, EJBException;
    void setStateCode(long addressId, String stateCode) throws RemoteException, EJBException;
    void setZip(long addressId, String zip) throws RemoteException, EJBException;
    void setCountryCode(long addressId, String countryCode) throws RemoteException, EJBException;
}