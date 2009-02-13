package com.topcoder.web.ejb.user;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import javax.ejb.EJBException;


/**
 * EJB object for Contact table get/set functions
 *
 * @author George Nassar
 * @version $Revision$
 */
public interface Contact extends EJBObject {
    /**
     *
     *
     * @see com.topcoder.web.ejb.user.ContactBean#createContact
     */
    void createContact(long companyId, long contactId)
                throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.user.ContactBean#setCompanyId
     */
    void setCompanyId(long contactId, long companyId)
               throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.user.ContactBean#getCompanyId
     */
    long getCompanyId(long contactId) throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.user.ContactBean#getTitle
     */
    String getTitle(long contactId)
             throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.user.ContactBean#setTitle
     */
    void setTitle(long contactId, String title)
           throws RemoteException, EJBException;
}
