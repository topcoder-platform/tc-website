package com.topcoder.web.ejb.product;

import javax.ejb.CreateException;
import java.rmi.RemoteException;


/**
 * Home interface for Unit table EJB
 *
 * @author Greg Paul
 * @version $Revision$
 */
public interface UnitHome extends javax.ejb.EJBHome {
    public static final String EJB_REF_NAME = UnitHome.class.getName();

    /**
     * Creates the remote Product EJB object
     *
     * @throws CreateException
     * @throws RemoteException
     */
    public Unit create() throws CreateException, RemoteException;
}
