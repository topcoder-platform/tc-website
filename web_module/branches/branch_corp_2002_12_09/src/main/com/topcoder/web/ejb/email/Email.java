package com.topcoder.web.ejb.email;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import javax.ejb.EJBException;


/**
 * EJB object for Email table get/set functions
 *
 * @author George Nassar
 * @version $Revision$
 */
public interface Email extends EJBObject {
    /**
     *
     *
     * @see com.topcoder.web.ejb.email.EmailBean#createEmail
     */
    long createEmail(long userId) throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.email.EmailBean#getEmailID
     */
    long getEmailID(long userId) throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.email.EmailBean#getEmailTypeId
     */
    long getEmailTypeId(long userId, long emailId)
                 throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.email.EmailBean#getAddress
     */
    String getAddress(long userId, long emailId)
               throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.email.EmailBean#setEmailTypeIde
     */
    void setEmailTypeId(long userId, long emailId, long emailTypeId)
                 throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.email.EmailBean#setAddress
     */
    void setAddress(long userId, long emailId, String address)
             throws RemoteException, EJBException;
}
