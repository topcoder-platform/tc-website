package com.topcoder.web.ejb.product;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;


/**
 * EJB object for Product table get/set functions
 *
 * @author George Nassar
 * @version $Revision$
 */
public interface Product extends EJBObject {
    /**
     * @see com.topcoder.web.ejb.product.ProductBean#createProduct
     */
    long createProduct(float cost) throws RemoteException, EJBException;

    /**
     * @see com.topcoder.web.ejb.product.ProductBean#getProductDesc
     */
    String getProductDesc(long productId) throws RemoteException, EJBException;

    /**
     * @see com.topcoder.web.ejb.product.ProductBean#getCost
     */
    float getCost(long productId) throws RemoteException, EJBException;

    /**
     * @see com.topcoder.web.ejb.product.ProductBean#getNumUnits
     */
    int getNumUnits(long productId) throws RemoteException, EJBException;

    /**
     * @see com.topcoder.web.ejb.product.ProductBean#getUnitTypeId
     */
    long getUnitTypeId(long productId) throws RemoteException, EJBException;

    /**
     * @see com.topcoder.web.ejb.product.ProductBean#getUnitTypeDesc
     */
    String getUnitTypeDesc(long productId) throws RemoteException, EJBException;

    /**
     * @see com.topcoder.web.ejb.product.ProductBean#setProductDesc
     */
    void setProductDesc(long userId, String productDesc)
            throws RemoteException, EJBException;

    /**
     * @see com.topcoder.web.ejb.product.ProductBean#setCost
     */
    void setCost(long userId, float cost) throws RemoteException, EJBException;

    /**
     * @see com.topcoder.web.ejb.product.ProductBean#setNumUnits
     */
    void setNumUnits(long userId, int numUnits) throws RemoteException, EJBException;

    /**
     * @see com.topcoder.web.ejb.product.ProductBean#setUnitTypeId
     */
    void setUnitTypeId(long userId, long unitTypeId) throws RemoteException, EJBException;

}
