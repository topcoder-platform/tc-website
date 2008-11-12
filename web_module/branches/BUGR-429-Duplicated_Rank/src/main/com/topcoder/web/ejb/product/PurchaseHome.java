package com.topcoder.web.ejb.product;

import javax.ejb.CreateException;
import java.rmi.RemoteException;


/**
 * Home interface for Purchase table EJB
 *
 * @author George Nassar
 * @version $Revision$
 */
public interface PurchaseHome extends javax.ejb.EJBHome {
    public static final String EJB_REF_NAME = PurchaseHome.class.getName();

    /**
     * Creates the remote Purchase EJB object
     *
     * @return a Purchase EJB object
     *
     * @throws CreateException
     * @throws RemoteException
     */
    public Purchase create() throws CreateException, RemoteException;
}
