package com.topcoder.web.ejb.user;

import javax.ejb.CreateException;
import java.rmi.RemoteException;


/**
 * Home interface for User table EJB
 *
 * @author George Nassar
 * @version $Revision$
 */
public interface UserHome extends javax.ejb.EJBHome {
    /**
     * Creates the remote User EJB object
     *
     * @return an User EJB object
     *
     * @throws CreateException
     * @throws RemoteException
     */
    public User create() throws CreateException, RemoteException;
}
