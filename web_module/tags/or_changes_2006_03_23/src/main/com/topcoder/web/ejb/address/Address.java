package com.topcoder.web.ejb.address;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;


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
    long createAddress(String dataSource, String idDataSource) throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#getAddressTypeId
     */
    long getAddressTypeId(long addressId, String dataSource) throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#getAddress1
     */
    String getAddress1(long addressId, String dataSource) throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#getAddress2
     */
    String getAddress2(long addressId, String dataSource) throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#getAddress3
     */
    String getAddress3(long addressId, String dataSource) throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#getCity
     */
    String getCity(long addressId, String dataSource) throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#getStateCode
     */
    String getStateCode(long addressId, String dataSource) throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#getProvince
     */
    String getProvince(long addressId, String dataSource) throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#getZip
     */
    String getZip(long addressId, String dataSource) throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#getCountryCode
     */
    String getCountryCode(long addressId, String dataSource) throws RemoteException, EJBException;

    String getCountryName(String countryCode, String dataSource) throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#setAddressTypeId
     */
    void setAddressTypeId(long addressId, long addressTypeId, String dataSource)
            throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#setAddress1
     */
    void setAddress1(long addressId, String address1, String dataSource)
            throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#setAddress2
     */
    void setAddress2(long addressId, String address2, String dataSource)
            throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#setAddress3
     */
    void setAddress3(long addressId, String address3, String dataSource)
            throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#setCity
     */
    void setCity(long addressId, String city, String dataSource)
            throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#setStateCode
     */
    void setStateCode(long addressId, String stateCode, String dataSource)
            throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#setProvince
     */
    void setProvince(long addressId, String province, String dataSource)
            throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#setZip
     */
    void setZip(long addressId, String zip, String dataSource)
            throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#setCountryCode
     */
    void setCountryCode(long addressId, String countryCode, String dataSource)
            throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.address.AddressBean#getAddressTypeDesc
     */
    String getAddressTypeDesc(long addressId, String dataSource)
            throws RemoteException, EJBException;
}
