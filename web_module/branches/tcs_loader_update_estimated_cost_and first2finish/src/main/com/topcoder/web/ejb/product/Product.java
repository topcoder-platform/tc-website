package com.topcoder.web.ejb.product;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;

//import java.sql.Date;


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
     * @see com.topcoder.web.ejb.product.ProductBean#getTermsOfUseId
     */
    long getTermsOfUseId(long productId) throws RemoteException, EJBException;


    /**
     * @see com.topcoder.web.ejb.product.ProductBean#setProductDesc
     */
    void setProductDesc(long productId, String productDesc)
            throws RemoteException, EJBException;

    /**
     * @see com.topcoder.web.ejb.product.ProductBean#setCost
     */
    void setCost(long productId, float cost) throws RemoteException, EJBException;

    /**
     * @see com.topcoder.web.ejb.product.ProductBean#setCost
     */
    void setTermsOfUseId(long productId, long termsOfUseId) throws RemoteException, EJBException;


    /**
     * by djFD 19/03/2002
     * @param productId
     * @return String
     * @throws RemoteException
     * @throws EJBException
     */
    public String getRedirectionURL(long productId)
            throws RemoteException, EJBException;

    /**
     * by djFD 19/03/2002
     * @param productId
     * @param redirectURL
     * @throws RemoteException
     * @throws EJBException
     */
    public void setProductRedirectionURL(long productId, String redirectURL)
            throws RemoteException, EJBException;
}
