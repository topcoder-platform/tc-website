package com.topcoder.web.ejb.product;

import javax.ejb.EJBObject;
import java.sql.Date;
import java.rmi.RemoteException;
import javax.ejb.EJBException;


/**
 * EJB object for Purchase table get/set functions
 *
 * @author George Nassar
 * @version $Revision$
 */
public interface Purchase extends EJBObject {
    /**
     *
     *
     * @see com.topcoder.web.ejb.product.PurchaseBean#createPurchase
     */
    long createPurchase(long companyId, long productId, long contactId)
                 throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.product.PurchaseBean#setCompanyId
     */
    void setCompanyId(long purchaseId, long companyId)
               throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.product.PurchaseBean#setProductId
     */
    void setProductId(long purchaseId, long productId)
               throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.product.PurchaseBean#setContactId
     */
    void setContactId(long purchaseId, long contactId)
               throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.product.PurchaseBean#setStartDate
     */
    void setStartDate(long purchaseId, Date startDate)
               throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.product.PurchaseBean#setEndDate
     */
    void setEndDate(long purchaseId, Date endDate)
             throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.product.PurchaseBean#getCompanyId
     */
    long getCompanyId(long purchaseId) throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.product.PurchaseBean#getProductId
     */
    long getProductId(long purchaseId) throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.product.PurchaseBean#getContactId
     */
    long getContactId(long purchaseId) throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.product.PurchaseBean#getStartDate
     */
    Date getStartDate(long purchaseId) throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.product.PurchaseBean#getEndDate
     */
    Date getEndDate(long purchaseId) throws RemoteException, EJBException;
}
