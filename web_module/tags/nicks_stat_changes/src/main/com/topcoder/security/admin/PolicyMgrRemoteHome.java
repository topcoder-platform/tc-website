package com.topcoder.security.admin;

import javax.ejb.CreateException;
import javax.ejb.EJBException;
import java.rmi.RemoteException;

/**
 * @author Heather Van Aelst
 * @version 1.0
 */
public interface PolicyMgrRemoteHome extends javax.ejb.EJBHome {

    public static final String EJB_REF_NAME = "security/PolicyMgr";

    public PolicyMgrRemote create()
            throws RemoteException, CreateException, EJBException;

}
