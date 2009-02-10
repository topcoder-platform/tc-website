package com.topcoder.security.admin;

import javax.ejb.CreateException;
import javax.ejb.EJBException;
import java.rmi.RemoteException;

/**
 * @author Heather Van Aelst
 * @version 1.0
 */
public interface PrincipalMgrRemoteHome extends javax.ejb.EJBHome {

    public static final String EJB_REF_NAME = PrincipalMgrRemoteHome.class.getName();

    public PrincipalMgrRemote create()
            throws RemoteException, CreateException, EJBException;

}
