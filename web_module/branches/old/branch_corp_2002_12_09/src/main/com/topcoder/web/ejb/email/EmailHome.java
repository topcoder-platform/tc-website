package com.topcoder.web.ejb.email;

import javax.ejb.CreateException;
import java.rmi.RemoteException;


/**
 * Home interface for Email table EJB
 *
 * @author George Nassar
 * @version $Revision$
 */
public interface EmailHome extends javax.ejb.EJBHome {
    public static final String EJB_REF_NAME = EmailHome.class.getName();

    /**
     * Creates the remote Email EJB object
     *
     * @return an Email EJB object
     *
     * @throws CreateException
     * @throws RemoteException
     */
    public Email create() throws CreateException, RemoteException;
}
