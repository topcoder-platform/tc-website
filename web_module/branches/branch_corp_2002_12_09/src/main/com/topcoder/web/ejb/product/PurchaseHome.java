package com.topcoder.web.ejb.product;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

/**
*
* @author   George Nassar
* @version  $Revision$
*
*/

public interface PurchaseHome extends javax.ejb.EJBHome {
    /**
    *
    * @return
    * @throws CreateException
    * @throws RemoteException
    *
    */
    public Purchase create() throws CreateException, RemoteException;
}