package com.topcoder.web.ejb.product;

import javax.ejb.CreateException;
import java.rmi.RemoteException;


/**
 * Home interface for ProductUnit table EJB
 *
 * @author George Nassar
 * @version $Revision$
 */
public interface ProductUnitHome extends javax.ejb.EJBHome {
    public static final String EJB_REF_NAME = ProductUnitHome.class.getName();

    /**
     * Creates the remote ProductUnit EJB object
     *
     * @return an ProductUnit EJB object
     *
     * @throws CreateException
     * @throws RemoteException
     */
    public ProductUnit create() throws CreateException, RemoteException;
}
