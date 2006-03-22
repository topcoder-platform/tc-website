package com.topcoder.security.policy;

import javax.ejb.CreateException;
import javax.ejb.EJBException;
import java.rmi.RemoteException;

/**
 * The Session EJB is a proxy to the Policy object. This should be used by EJB clients.
 *
 * @author Heather Van Aelst
 * @version 1.0
 */
public interface PolicyRemoteHome extends javax.ejb.EJBHome {

    public static final String EJB_REF_NAME = "security/Policy";

    public PolicyRemote create()
            throws RemoteException, CreateException, EJBException;

}
