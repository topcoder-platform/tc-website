package com.topcoder.security.admin;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.EJBException;
import com.topcoder.security.GeneralSecurityException;

/**
 * @author Heather Van Aelst
 * @version 1.0
 */
public interface PrincipalMgrRemoteHome extends javax.ejb.EJBHome {

    public static final String EJB_REF_NAME="security/PrincipalMgr";

    public PrincipalMgrRemote create()
        throws RemoteException, CreateException, EJBException;

}
