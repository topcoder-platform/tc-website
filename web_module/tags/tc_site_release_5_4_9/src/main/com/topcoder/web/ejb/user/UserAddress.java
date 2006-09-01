package com.topcoder.web.ejb.user;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;


/**
 * EJB object for User/Address table get/set functions
 *
 * @author George Nassar
 * @version $Revision$
 */
public interface UserAddress extends EJBObject {
    /**
     *
     *
     * @see com.topcoder.web.ejb.user.UserAddressBean#createUserAddress
     */
    void createUserAddress(long userId, long addressId, String dataSource)
            throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.user.UserAddressBean#removeUserAddress
     */
    void removeUserAddress(long userId, long addressId, String dataSource)
            throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.user.UserAddressBean#removeUserAddress
     */
    ResultSetContainer getUserAddresses(long userId, String dataSource)
            throws RemoteException, EJBException;
}
