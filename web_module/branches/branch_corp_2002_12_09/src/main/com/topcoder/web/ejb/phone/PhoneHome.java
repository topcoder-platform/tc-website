package com.topcoder.web.ejb.phone;

import javax.ejb.CreateException;
import java.rmi.RemoteException;


/**
 * Home interface for Phone EJB table
 *
 * @author George Nassar
 * @version $Revision$
 */
public interface PhoneHome extends javax.ejb.EJBHome {
    /**
     * Creates the remote Phone EJB object
     *
     * @return a Phone EJB object
     *
     * @throws CreateException
     * @throws RemoteException
     */
    public Phone create() throws CreateException, RemoteException;
}
