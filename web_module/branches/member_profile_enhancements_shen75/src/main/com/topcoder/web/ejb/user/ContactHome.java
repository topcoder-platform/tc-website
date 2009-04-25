package com.topcoder.web.ejb.user;

import javax.ejb.CreateException;
import java.rmi.RemoteException;


/**
 * Home interface for Contact table EJB
 *
 * @author George Nassar
 * @version $Revision$
 */
public interface ContactHome extends javax.ejb.EJBHome {
    public static final String EJB_REF_NAME = ContactHome.class.getName();

    /**
     *
     * Creates the remote Contact EJB object
     *
     * @return a Contact EJB object
     *
     * @throws CreateException
     * @throws RemoteException
     */
    public Contact create() throws CreateException, RemoteException;
}
