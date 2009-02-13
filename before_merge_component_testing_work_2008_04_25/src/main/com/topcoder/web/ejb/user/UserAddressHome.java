package com.topcoder.web.ejb.user;

import javax.ejb.CreateException;
import java.rmi.RemoteException;


/**
 * Home interface for User/Address table EJB
 *
 * @author George Nassar
 * @version $Revision$
 */
public interface UserAddressHome extends javax.ejb.EJBHome {
    public static final String EJB_REF_NAME = UserAddressHome.class.getName();

    /**
     * Creates the remote User/Address EJB object
     *
     * @return an UserAddress EJB object
     *
     * @throws CreateException
     * @throws RemoteException
     */
    public UserAddress create() throws CreateException, RemoteException;
}
