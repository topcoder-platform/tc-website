package com.topcoder.web.ejb.address;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import javax.ejb.EJBException;


/**
 * EJB object for Address table get/set functions
 *
 * @author George Nassar
 * @version $Revision$
 */
public interface Address extends EJBObject {
    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#createAddress
     */
    long createAddress() throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#getAddressTypeId
     */
    long getAddressTypeId(long addressId) throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#getAddress1
     */
    String getAddress1(long addressId) throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#getAddress2
     */
    String getAddress2(long addressId) throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#getCity
     */
    String getCity(long addressId) throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#getStateCode
     */
    String getStateCode(long addressId) throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#getZip
     */
    String getZip(long addressId) throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#getCountryCode
     */
    String getCountryCode(long addressId) throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#setAddressTypeId
     */
    void setAddressTypeId(long addressId, long addressTypeId)
                   throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#setAddress1
     */
    void setAddress1(long addressId, String address1)
              throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#setAddress2
     */
    void setAddress2(long addressId, String address2)
              throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#setCity
     */
    void setCity(long addressId, String city)
          throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#setStateCode
     */
    void setStateCode(long addressId, String stateCode)
               throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#setZip
     */
    void setZip(long addressId, String zip)
         throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#setCountryCode
     */
    void setCountryCode(long addressId, String countryCode)
                 throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#getAddressTypeDesc
     */
    String getAddressTypeDesc(long addressId)
                 throws RemoteException, EJBException;
}
