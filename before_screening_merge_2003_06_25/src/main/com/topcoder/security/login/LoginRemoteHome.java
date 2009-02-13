package com.topcoder.security.login;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.EJBException;

public interface LoginRemoteHome extends javax.ejb.EJBHome {

    public static final String EJB_REF_NAME="security/Login";

    public LoginRemote create() 
        throws RemoteException, CreateException, EJBException;

}
