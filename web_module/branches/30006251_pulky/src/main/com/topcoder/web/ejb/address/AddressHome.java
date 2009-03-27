package com.topcoder.web.ejb.address;

import javax.ejb.CreateException;
import java.rmi.RemoteException;


/**
 * Home interface for Address table EJB
 *
 * @author   George Nassar
 * @version  $Revision$
 */
public interface AddressHome extends javax.ejb.EJBHome {
    public static final String EJB_REF_NAME = AddressHome.class.getName();

    /**
     *
     * Creates the remote Address EJB object
     *
     * @return an Address EJB object
     *
     * @throws CreateException
     * @throws RemoteException
     */
    public Address create() throws CreateException, RemoteException;
}