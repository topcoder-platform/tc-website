package com.topcoder.web.ejb.product;

import javax.ejb.CreateException;
import java.rmi.RemoteException;


/**
 * Home interface for Product table EJB
 *
 * @author George Nassar
 * @version $Revision$
 */
public interface ProductHome extends javax.ejb.EJBHome {
    public static final String EJB_REF_NAME = ProductHome.class.getName();

    /**
     * Creates the remote Product EJB object
     *
     * @throws CreateException
     * @throws RemoteException
     */
    public Product create() throws CreateException, RemoteException;
}
