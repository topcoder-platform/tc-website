package com.topcoder.security.admin;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.EJBException;
import com.topcoder.security.GeneralSecurityException;

/**
 * @author Heather Van Aelst
 * @version 1.0
 */
public interface PolicyMgrRemoteHome extends javax.ejb.EJBHome {

    public static final String EJB_REF_NAME="security/PolicyMgr";

    public PolicyMgrRemote create()
        throws RemoteException, CreateException, EJBException;

}
