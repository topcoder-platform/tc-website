package com.topcoder.web.ejb.product;

import javax.ejb.EJBObject;

import java.rmi.RemoteException;
import javax.ejb.EJBException;

/**
*
* @author   George Nassar
* @version  $Revision$
*
*/

public interface Product extends EJBObject {
    long createProduct(float cost) throws RemoteException, EJBException;
    String getProductDesc(long productId) throws RemoteException, EJBException;
    float getCost(long productId) throws RemoteException, EJBException;
    void setProductDesc(long userId, String productDesc) throws RemoteException, EJBException;
    void setCost(long userId, float cost) throws RemoteException, EJBException;
}