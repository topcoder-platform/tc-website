package com.topcoder.web.ejb.user;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;


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
    void createContact(long companyId, long contactId, String dataSource)
            throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.user.ContactBean#setCompanyId
     */
    void setCompanyId(long contactId, long companyId, String dataSource)
            throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.user.ContactBean#getCompanyId
     */
    long getCompanyId(long contactId, String dataSource) throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.user.ContactBean#getTitle
     */
    String getTitle(long contactId, String dataSource)
            throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.user.ContactBean#setTitle
     */
    void setTitle(long contactId, String title, String dataSource)
            throws RemoteException, EJBException;
}
