package com.topcoder.web.ejb.company;

import javax.ejb.EJBObject;

import java.rmi.RemoteException;
import javax.ejb.EJBException;

/**
*
* @author   George Nassar
* @version  $Revision$
*
*/

public interface Company extends EJBObject {
    long createCompany() throws RemoteException, EJBException;
    String getName(long companyId) throws RemoteException, EJBException;
    long getPrimaryContactId(long companyId) throws RemoteException, EJBException;
    void setName(long companyId, String name) throws RemoteException, EJBException;
    void setPrimaryContactId(long companyId, long primaryContactId) throws RemoteException, EJBException;
}