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

public interface Contact extends EJBObject {
    void createContact(long companyId, long contactId) throws RemoteException, EJBException;
    void setCompany(long contactId, long companyId) throws RemoteException, EJBException;
    long getCompanyId(long contactId) throws RemoteException, EJBException;
    String getTitle(long companyId, long contactId) throws RemoteException, EJBException;
    void setTitle(long companyId, long contactId, String title) throws RemoteException, EJBException;
}