package com.topcoder.web.ejb.product;

import javax.ejb.EJBObject;
import java.sql.Date;

import java.rmi.RemoteException;
import javax.ejb.EJBException;

/**
*
* @author   George Nassar
* @version  $Revision$
*
*/

public interface Purchase extends EJBObject {
    long createPurchase(long companyId, long productId, long contactId) throws RemoteException, EJBException;
    void setCompanyId(long purchaseId, long companyId) throws RemoteException, EJBException;
    void setProductId(long purchaseId, long productId) throws RemoteException, EJBException;
    void setContactId(long purchaseId, long contactId) throws RemoteException, EJBException;
    void setStartDate(long purchaseId, Date startDate) throws RemoteException, EJBException;
    void setEndDate(long purchaseId, Date endDate) throws RemoteException, EJBException;
    long getCompanyId(long purchaseId) throws RemoteException, EJBException;
    long getProductId(long purchaseId) throws RemoteException, EJBException;
    long getContactId(long purchaseId) throws RemoteException, EJBException;
    Date getStartDate(long purchaseId) throws RemoteException, EJBException;
    Date getEndDate(long purchaseId) throws RemoteException, EJBException;
}