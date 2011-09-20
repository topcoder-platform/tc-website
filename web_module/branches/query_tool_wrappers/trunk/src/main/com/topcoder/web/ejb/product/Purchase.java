package com.topcoder.web.ejb.product;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.sql.Date;


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
    long createPurchase(long productId, long userId,
                        double paid)
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

    /**
     *
     *
     * @see com.topcoder.web.ejb.product.PurchaseBean#getPaid
     */
    double getPaid(long purchaseId) throws RemoteException, EJBException;


    /**
     * @see com.topcoder.web.ejb.product.PurchaseBean#getCreateDate
     */
    Date getCreateDate(long productId) throws RemoteException, EJBException;


    /**
     *
     *
     * @see com.topcoder.web.ejb.product.PurchaseBean#setPaid
     */
    void setPaid(long purchaseId, double Paid)
            throws RemoteException, EJBException;
}
