package com.topcoder.web.ejb.company;

import javax.ejb.CreateException;
import java.rmi.RemoteException;


/**
 * Home interface for Company table EJB
 *
 * @author George Nassar
 * @version $Revision$
 */
public interface CompanyHome extends javax.ejb.EJBHome {
    public static final String EJB_REF_NAME = CompanyHome.class.getName();

    /**
     * creates the remote Company EJB object
     *
     * @return a Company EJB object
     *
     * @throws CreateException
     * @throws RemoteException
     */
    public Company create() throws CreateException, RemoteException;
}
