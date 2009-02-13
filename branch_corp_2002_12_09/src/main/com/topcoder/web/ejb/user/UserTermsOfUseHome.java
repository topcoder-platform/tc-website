package com.topcoder.web.ejb.user;

import javax.ejb.CreateException;
import java.rmi.RemoteException;


/**
 * Home interface for User/Terms Of Use table EJB
 *
 * @author George Nassar
 * @version $Revision$
 */
public interface UserTermsOfUseHome extends javax.ejb.EJBHome {
    /**
     * Creates the remote User/Terms Of Use EJB object
     *
     * @return an UserTermsOfUse EJB object
     *
     * @throws CreateException
     * @throws RemoteException
     */
    public UserTermsOfUse create() throws CreateException, RemoteException;
}
