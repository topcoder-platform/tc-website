package com.topcoder.web.ejb.phone;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import javax.ejb.EJBException;


/**
 * EJB object for Phone table get/set functions
 *
 * @author George Nassar
 * @version $Revision$
 */
public interface Phone extends EJBObject {
    /**
     *
     *
     * @see com.topcoder.web.ejb.phone.PhoneBean#createPhone
     */
    long createPhone(long userId) throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.phone.PhoneBean#getPhoneTypeId
     */
    long getPhoneTypeId(long userId, long phoneId)
                 throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.phone.PhoneBean#getPhoneId
     */
    long getPhoneId(long userId)
                 throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.phone.PhoneBean#getNumber
     */
    String getNumber(long userId, long phoneId)
              throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.phone.PhoneBean#setPhoneTypeId
     */
    void setPhoneTypeId(long userId, long phoneId, long phoneTypeId)
                 throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.phone.PhoneBean#setNumber
     */
    void setNumber(long userId, long phoneId, String number)
            throws RemoteException, EJBException;
}
