package com.topcoder.web.ejb.company;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;


/**
 * EJB object for Company table get/set functions
 *
 * @author George Nassar
 * @version $Revision$
 */
public interface Company extends EJBObject {
    /**
     *
     *
     * @see com.topcoder.web.ejb.company.CompanyBean#createCompany
     */
    long createCompany() throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.company.CompanyBean#getName
     */
    String getName(long companyId) throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.company.CompanyBean#getPrimaryContactId
     */
    long getPrimaryContactId(long companyId)
            throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.company.CompanyBean#getNewUserStatus
     */
    String getNewUserStatus(long companyId)
            throws RemoteException, EJBException;

    String getTimeZone(long companyId) throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.company.CompanyBean#setName
     */
    void setName(long companyId, String name)
            throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.company.CompanyBean#setPrimaryContactId
     */
    void setPrimaryContactId(long companyId, long primaryContactId)
            throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.company.CompanyBean#setNewUserStatus
     */
    void setNewUserStatus(long companyId, String status)
            throws RemoteException, EJBException;



}
