package com.topcoder.web.ejb.termsofuse;

import javax.ejb.CreateException;
import java.rmi.RemoteException;


/**
 * Home interface for Terms Of Use table EJB
 *
 * @author George Nassar
 * @version $Revision$
 */
public interface TermsOfUseHome extends javax.ejb.EJBHome {
    /**
     * Creates the remote Terms Of Use EJB object
     *
     * @return a TermsOfUse EJB object
     *
     * @throws CreateException
     * @throws RemoteException
     */
    public TermsOfUse create() throws CreateException, RemoteException;
}
